import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lucky_generator/generated/l10n.dart';
import 'package:lucky_generator/pages/home_page/base_home_state.dart';
import 'package:lucky_generator/pages/home_page/my_history/module/my_history_list_module.dart';
import 'package:lucky_generator/pages/home_page/my_history/my_history_vm.dart';

import '../../../widget/generic_filter_list_view/generic_filter_list_view.dart';

class MyHistoryPage extends StatefulWidget {
  const MyHistoryPage({super.key});

  @override
  State<StatefulWidget> createState() => MyHistoryPageState();
}

class MyHistoryPageState extends BaseHomeState<MyHistoryPage> {
  late final MyHistoryVM _vm = MyHistoryVM()..bind(this);

  late final MyHistoryListModule _myHistoryListModule = MyHistoryListModule(this);

  late final List<FilterItem> filterItemsList = [
    FilterItem(1, FilterItemType.rank, "#", 2, isSortable: false),
    FilterItem(2, FilterItemType.number, S().number, 5),
    FilterItem(3, FilterItemType.date, S().generated, 10, isSorting: true),
    FilterItem(4, FilterItemType.status, S().status, 4),
  ];
  
  late final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _vm.updateMyHistoryListStream();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return GenericFilterListView(
      scrollController: _scrollController,
      filterItems: filterItemsList,
      dataStream: _vm.myHistoryListStream,
      itemBuilder: (item) => _myHistoryListModule.buildHistoryItemWidget(item),
      onItemSwiped: (item) {
        debugPrint("JAY_LOG: _MyHistoryPage, build, item deleted: $item");

        // TODO: JAY_LOG - swipe to delete history number
      },
      onSortItemClicked: (FilterItem filterItem) {
        // Scroll to top of list
        _scrollController.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);

        _vm.updateMyHistoryListStream(sortType: filterItem.type, isDesc: filterItem.isDesc);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();

    _vm.dispose();
  }
}
