import 'package:flutter/material.dart';
import 'package:lucky_generator/base/base_state.dart';
import 'package:lucky_generator/util/number_util.dart';
import 'package:lucky_generator/widget/generic_paging_page_view/generic_paging_page_view_model.dart';

/// A generic [PageView]
///
class GenericPagingPageView<T> extends StatefulWidget {
  const GenericPagingPageView(
      {super.key,
      required this.dataStream,
      this.dataId,
      this.setInitialPageCallback,
      this.firstItemId,
      required this.onPreviousPaging,
      required this.onNextPaging,
      required this.itemBuilder,
      required this.fetchCount});

  // Paged list data stream
  final Stream<List<T>>? dataStream;

  // Unique data id, e.g. "drawNo" from DMC item.
  final String? dataId;

  final Widget Function(T item, int index) itemBuilder;

  // Callback for setting initialPage.
  final int Function(List<T> list)? setInitialPageCallback;

  // First itemId e.g. dmcFirstDrawNo
  final String? firstItemId;

  // When user has swiped to beginning / end of initial list
  final Stream<List<T>>? Function(T? firstItem) onPreviousPaging;
  final Stream<List<T>>? Function(T? lastItem) onNextPaging;

  final int fetchCount;

  @override
  State<StatefulWidget> createState() => _GenericPagingPageState<T>();
}

class _GenericPagingPageState<T> extends BaseState<GenericPagingPageView<T>> {
  late final _vm = GenericPagingPageViewVM<T>()..bind(this);

  @override
  void initState() {
    super.initState();

    _vm.initDataStream(widget.dataStream, widget.dataId, widget.setInitialPageCallback, widget.firstItemId);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<T>>(
        // Replace with your driftDB query logic
        stream: _vm.pageViewDataStream,
        builder: (context, snapshot) {
          final items = snapshot.data;

          // TODO: JAY_LOG - skeleton view
          if (items == null || items.isEmpty) return Text('no items');

          // Init pageController for pageView
          if (_vm.initialPage != null) {
            _vm.pageController ??= PageController(initialPage: _vm.initialPage.toNonNull());
          }

          return Stack(children: [
            // TODO: JAY_LOG - Left / right arrows based on whether there are more items
            // Observer(builder: (context) {
            //   return _vm.currentPage != items.length - 1? Positioned.fill(
            //     right: 5,
            //     child: Align(
            //       alignment: Alignment.centerRight,
            //       child: Container(
            //         width: 25,
            //         decoration: ShapeDecoration(
            //           color: Colors.grey.withOpacity(0.5), // Background color
            //           shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(8.0), // Border radius
            //           ),
            //         ),
            //         child: IconButton(
            //           padding: EdgeInsets.zero,
            //           icon: const Icon(Icons.chevron_right),
            //           color: Colors.white, // Icon color
            //           onPressed: () {
            //             // Your onPressed logic here
            //           },
            //         ),
            //       ),
            //     ),
            //   ): const SizedBox();
            // }),
            _buildPageView(items)
          ]);
        });
  }

  Widget _buildPageView(List<T> items) {
    return PageView.builder(
      // Use null to signify that there are still more next items to be loaded
      itemCount: _vm.noMoreNextPastResults ? items.length : null,
      // Unlimited paging
      controller: _vm.pageController,
      onPageChanged: (int index) {
        // Call previous page callback when reached index == 0
        if (index == 0) {
          widget.onPreviousPaging(items.firstOrNull)?.listen((previousList) {
            _vm.onPreviousPaging(previousList, widget.fetchCount);
          });
        }

        // Call next page callback when reached last item
        if (index == items.length - 1) {
          widget.onNextPaging(items.lastOrNull)?.listen((nextList) {
            _vm.onNextPaging(nextList);
          });
        }
      },
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final item = items[index];

        return widget.itemBuilder(item, index);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();

    _vm.dispose();
  }
}
