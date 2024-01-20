import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lucky_generator/base/base_state.dart';
import 'package:lucky_generator/widget/generic_filter_list_view/generic_filter_list_vm.dart';

class GenericFilterListView<T> extends StatelessWidget {
  final ScrollController scrollController;

  // The list of filter items on FilterView on top of page
  final List<FilterItem> filterItems;

  // Callback when a filterItem is clicked (for sorting)
  final Function(FilterItem filterItem) onSortItemClicked;

  // The data stream for vertical list items
  final Stream<List<T>> dataStream;

  // UI for each list item
  final Widget Function(T item) itemBuilder;

  // Swipe action on item - disabled if null
  final Function(T item)? onItemSwiped;

  const GenericFilterListView(
      {super.key,
      required this.scrollController,
      required this.filterItems,
      required this.dataStream,
      required this.itemBuilder,
      required this.onSortItemClicked,
      this.onItemSwiped});

  @override
  Widget build(BuildContext context) {
    late List<FilterItemWidget> filterItemWidgets;
    filterItemWidgets = filterItems
        .map((item) => FilterItemWidget(
              key: GlobalKey<_FilterItemWidgetState>(), // Provide a unique k
              filterItem: item,
              onClick: (filterItem) {
                // Reset isSorting UX of all other filterItems
                resetOtherFilterItems(filterItemWidgets, filterItem.id);

                // Update list sorting
                onSortItemClicked(filterItem);
              },
            ))
        .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          _buildFilterView(filterItemWidgets),
          _buildDataView(),
        ],
      ),
    );
  }

  void resetOtherFilterItems(filterItemWidgets, int id) {
    for (var element in filterItemWidgets) {
      // Reset sorting UI for other items
      if (element.filterItem.id != id) {
        (element.key as GlobalKey<_FilterItemWidgetState>).currentState?.resetIsSorting();
      }
    }
  }

  // Top sticky filterView
  Widget _buildFilterView(List<FilterItemWidget> filterItemWidgets) {
    return Row(mainAxisSize: MainAxisSize.max, children: filterItemWidgets);
  }

  // Content listView
  Widget _buildDataView() {
    return Expanded(
        child: StreamBuilder<List<T>>(
      stream: dataStream,
      builder: (context, snapshot) {
        // TODO: JAY_LOG - skeleton loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          // return const CircularProgressIndicator();
        } else {
        }

        final List<T>? items = snapshot.data;

        // TODO: JAY_LOG - empty list view
        if (items == null || items.isEmpty) return const Text("No items");

        return ListView.builder(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return _buildDataItemView(context, items[index]);
            });
      },
    ));
  }

  // Build item based on whether swipe is enabled
  Widget _buildDataItemView(BuildContext context, T item) {
    return onItemSwiped != null

        // Build dismissable widget if swipe function available
        ? Dismissible(
            key: Key(item.hashCode.toString()),
            // Use a unique identifier for each item
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            confirmDismiss: (direction) async {
              return await showDialog(
                context: context,
                builder: (BuildContext context) {
                  // TODO: JAY_LOG - strings
                  return AlertDialog(
                    title: const Text("Confirm Delete"),
                    content: const Text("Are you sure you want to delete this item?"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false), // Return false to cancel dismissal
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true), // Return true to proceed with dismissal
                        child: const Text("Delete"),
                      ),
                    ],
                  );
                },
              );
            },
            onDismissed: (direction) {
              onItemSwiped?.call(item);
            },
            child: itemBuilder(item))

        // Just build normal item if no swipe function
        : itemBuilder(item);
  }
}

class FilterItemWidget extends StatefulWidget {
  final FilterItem filterItem;
  final Function(FilterItem item) onClick;

  const FilterItemWidget({Key? key, required this.filterItem, required this.onClick}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FilterItemWidgetState();
}

class _FilterItemWidgetState extends BaseState<FilterItemWidget> {
  late final GenericFilterItemVM _vm = GenericFilterItemVM()..bind(this);

  // Clear off isSorting and direction
  void resetIsSorting() {
    _vm.updateSortingAndDesc(false, false);
  }

  @override
  void initState() {
    super.initState();

    // Update filterItem to vm vars
    _vm
      ..isSorting = widget.filterItem.isSorting
      ..isDesc = widget.filterItem.isDesc;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.filterItem.widthRatio,
      child: InkWell(
        // Only allow onClick if is sortable
        onTap: widget.filterItem.isSortable ? itemOnClick : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.filterItem.title),

            // Show sorting arrow ONLY if this item is currently sorting
            Observer(
                builder: (ctx) => Visibility(
                      visible: _vm.isSorting, // Set your boolean variable here
                      child: Icon(_vm.isDesc ? Icons.arrow_drop_down_sharp : Icons.arrow_drop_up_sharp),
                    ))
          ],
        ),
      ),
    );
  }

  void itemOnClick() {
    // If current item is already sorting, toggle direction. Else, use desc direction
    bool isDesc = _vm.isSorting ? !_vm.isDesc : true;

    // Update UI
    _vm.updateSortingAndDesc(true, isDesc);

    // Update callback with new sorting direction
    widget.onClick(widget.filterItem
      ..isSorting = _vm.isSorting
      ..isDesc = _vm.isDesc);
  }
}

/// Only 1 filterItem can be currently sorting. Not currently sorting ones will NOT show the arrow icon.
class FilterItem {
  FilterItem(this.id, this.type, this.title, this.widthRatio,
      {this.isSortable = true, this.isSorting = false, this.isDesc = true});

  final int id;
  final FilterItemType type;
  final String title;
  final int widthRatio; // The width ratio of each column (e.g. 1:1:4:5 etc)
  final bool isSortable; // Whether sortr onClick is enabled
  bool isSorting; // Whether this filterItem is currently the sorting one
  bool isDesc; // The direction of sorting

  @override
  String toString() {
    return 'FilterItem{id: $id, type: $type, title: $title, widthRatio: $widthRatio, isSortable: $isSortable, isSorting: $isSorting, isDesc: $isDesc}';
  }
}

enum FilterItemType { rank, number, date, status, draw_no }
