import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:lucky_generator/database/entity/dmc/dmc_entity.dart';
import 'package:lucky_generator/database/entity/universal/my_history_entity.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/database/type_converter/string_list_converter.dart';
import 'package:lucky_generator/model/universal/history/history_win_status.dart';
import 'package:lucky_generator/model/universal/module_type.dart';
import 'package:lucky_generator/pages/home_page/my_history/my_history_vm.dart';
import 'package:lucky_generator/widget/generic_filter_list_view/generic_filter_list_view.dart';

part 'my_history_dao.g.dart';

@DriftAccessor(tables: [MyHistoryEntity])
class MyHistoryDao extends DatabaseAccessor<MyDatabase> with _$MyHistoryDaoMixin {
  MyHistoryDao(MyDatabase db) : super(db);

  /// Insert
  Future<void> insertGeneratedNumber(String generatedNumber) async =>
      await db.into(db.myHistoryEntity).insert(MyHistoryEntityCompanion.insert(
          moduleTypeId: ModuleType.dmc.id,
          dateGenerated: DateTime.now(),
          number: generatedNumber,
          winStatusId: HistoryWinStatus.none.id));

  // Get my history paged lists in streams based on moduleType and currentPage
  Stream<List<MyHistoryEntityData>> getMyHistoryPagedListStream(
      ModuleType selectedModuleType, FilterItemType sortType, bool isDesc, int currentPage) {
    debugPrint("JAY_LOG: MyHistoryDao, getMyHistoryPagedListStream, sortType = $sortType, isDesc= $isDesc");

    final query = select(myHistoryEntity)
      ..where((tbl) => tbl.moduleTypeId.equals(selectedModuleType.id))
      ..orderBy([
        (item) {
          // Convert sortType to respective database column
          Expression expression = item.dateGenerated;
          switch (sortType) {
            case FilterItemType.date:
              expression = item.dateGenerated;
              break;

            case FilterItemType.number:
              expression = item.number;
              break;

            case FilterItemType.status:
              expression = item.winStatusId;
              break;

            default:
              break;
          }

          // Convert bool to sort direction
          OrderingMode mode = isDesc ? OrderingMode.desc : OrderingMode.asc;

          return OrderingTerm(expression: expression, mode: mode);
        },
      ]);

    // TODO: JAY_LOG - implement paging
    // ..limit(myHistoryItemsPerPage, offset: currentPage * myHistoryItemsPerPage);

    return query.watch();
  }
}
