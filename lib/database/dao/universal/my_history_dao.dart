import 'package:drift/drift.dart';
import 'package:lucky_generator/database/entity/universal/my_history_entity.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/model/universal/history/history_win_status.dart';
import 'package:lucky_generator/model/universal/module_type.dart';
import 'package:lucky_generator/widget/generic_filter_list_view/generic_filter_list_view.dart';

part 'my_history_dao.g.dart';

@DriftAccessor(tables: [MyHistoryEntity])
class MyHistoryDao extends DatabaseAccessor<MyDatabase> with _$MyHistoryDaoMixin {
  MyHistoryDao(MyDatabase db) : super(db);

  /// Insert
  // Insert single item (generated number)
  Future<void> insertGeneratedNumber(String generatedNumber) async =>
      await db.into(db.myHistoryEntity).insert(MyHistoryEntityCompanion.insert(
          moduleTypeId: ModuleType.dmc.id,
          dateGenerated: DateTime.now(),
          number: generatedNumber,
          winStatusId: HistoryWinStatus.none.id));

  // Insert list of items
  Future<void> insertMyHistoryList(List<MyHistoryEntityData> list) async =>
      await db.batch((batch) => batch.insertAllOnConflictUpdate(db.myHistoryEntity, list));

  // Get my history list based on winStatus
  Future<List<MyHistoryEntityData>> getMyHistoryListByWinStatus(ModuleType selectedModuleType) {
    final query = select(myHistoryEntity)
      ..where((tbl) => tbl.moduleTypeId.equals(selectedModuleType.id) & tbl.winStatusId.equals(0))
      ..orderBy([(item) => OrderingTerm(expression: item.dateGenerated, mode: OrderingMode.asc)]);

    return query.get();
  }

  // Get my history paged lists in streams based on moduleType and currentPage
  Stream<List<MyHistoryEntityData>> getMyHistoryPagedListStream(ModuleType selectedModuleType, FilterItemType sortType,
      bool isDesc, int currentPage) {
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
