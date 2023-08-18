import 'package:drift/drift.dart';
import 'package:lucky_generator/database/entity/dmc/dmc_entity.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/database/type_converter/string_list_converter.dart';

part 'dmc_dao.g.dart';

@DriftAccessor(tables: [DmcEntity])
class DmcDao extends DatabaseAccessor<MyDatabase> with _$DmcDaoMixin {
  DmcDao(MyDatabase db) : super(db);

  /// Insert
  Future<void> insertDmcList(List<DmcEntityData> list) async =>
      await db.batch((batch) => batch.insertAllOnConflictUpdate(db.dmcEntity, list));

  /// Get
  // Check exist
  Future<DmcEntityData?> checkExistDmc() async => select(dmcEntity).getSingleOrNull();

  // Get 4d list after xx unix time
  Future<List<List<String>?>> get4dListAfterDateTime(DateTime dateTime) async {
    final query = selectOnly(dmcEntity)
      ..where(dmcEntity.drawDate.isBiggerThan(Constant(dateTime)))
      ..addColumns([dmcEntity.full4dList]);
    return query.map((row) {
      final read = row.read(dmcEntity.full4dList);
      if (read == null) {
        return null;
      } else {
        return const StringListConverter().fromSql(read);
      }
    }).get();
  }

  // Get full 4d list
  Future<List<List<String>?>> getFull4dList() async {
    final query = selectOnly(dmcEntity)..addColumns([dmcEntity.full4dList]);
    return query.map((row) {
      final read = row.read(dmcEntity.full4dList);
      if (read == null) {
        return null;
      } else {
        return const StringListConverter().fromSql(read);
      }
    }).get();
  }

  // Get top x list of draw dates for a number (exact), latest first
  Future<List<DateTime?>> getLatestDrawDatesList(String number, int topCount) async {
    final query = selectOnly(dmcEntity)
      ..addColumns([dmcEntity.drawDate])
      ..where(dmcEntity.full4dList.contains(number))
      ..orderBy([OrderingTerm.desc(dmcEntity.drawDate)])
      ..limit(topCount);
    return query.map((row) {
      return row.read(dmcEntity.drawDate);
    }).get();
  }

  /// Delete
  // Clear whole table
  Future<void> clearDb() async {
    delete(dmcEntity);
  }
}
