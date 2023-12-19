import 'package:flutter/material.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/pages/home_page/my_history/my_history_page.dart';
import 'package:lucky_generator/util/date_time_util.dart';
import 'package:lucky_generator/util/list_util.dart';
import 'package:lucky_generator/widget/generic_filter_list_view/generic_filter_list_view.dart';

/// Module for MyHistory data list widgets
class MyHistoryListModule {
  MyHistoryListModule(this.myHistoryPageState);

  final MyHistoryPageState myHistoryPageState;

  late final List<FilterItem> filterItemsList = myHistoryPageState.filterItemsList;
  late final MyHistoryPage widget = myHistoryPageState.widget;

  // History item widget (wrapped in dismissable swipe view)
  Widget buildHistoryItemWidget(MyHistoryEntityData item) {
    return Row(
      children: [
        _buildIdCell(item),
        _buildGeneratedNumberCell(item),
        _buildGeneratedDateCell(item),
        _buildStatusCell(item)
      ],
    );
  }

  // Id column cell
  Widget _buildIdCell(MyHistoryEntityData item) {
    return _buildHistoryItemCellWidget(
        filterItemsList.firstOrNull?.widthRatio ?? 1,
        Text(
          item.id.toString(),
          textAlign: TextAlign.center,
        ));
  }

  // Generated generated number column cell
  Widget _buildGeneratedNumberCell(MyHistoryEntityData item) {
    return _buildHistoryItemCellWidget(
        filterItemsList.getOrNull(1)?.widthRatio ?? 1, Text(item.number.toString(), textAlign: TextAlign.center));
  }

  // Generated generated date column cell
  Widget _buildGeneratedDateCell(MyHistoryEntityData item) {
    return _buildHistoryItemCellWidget(filterItemsList.getOrNull(2)?.widthRatio ?? 1,
        Text(item.dateGenerated.toFormattedString(ddMMMyyyyhhmmaFormat), textAlign: TextAlign.center));
  }

  // Generated hit status column cell
  Widget _buildStatusCell(MyHistoryEntityData item) {
    return _buildHistoryItemCellWidget(
        filterItemsList.getOrNull(3)?.widthRatio ?? 1, Text(item.winStatusId.toString(), textAlign: TextAlign.center));
  }

  // History item cell view
  Widget _buildHistoryItemCellWidget(int widthRatio, Widget child) {
    return Expanded(flex: widthRatio, child: child);
  }
}
