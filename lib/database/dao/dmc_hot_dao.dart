import 'package:drift/drift.dart';
import 'package:lucky_generator/database/entity/dmc/dmc_hot_entity.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/model/time_period.dart';

part 'dmc_hot_dao.g.dart';

@DriftAccessor(tables: [DmcHotEntity])
class DmcHotDao extends DatabaseAccessor<MyDatabase> with _$DmcHotDaoMixin {
  DmcHotDao(MyDatabase db) : super(db);

  /// Insert
  Future<void> insertDmcHotList(List<DmcHotEntityCompanion> list) async =>
      await db.batch((batch) => batch.insertAllOnConflictUpdate(db.dmcHotEntity, list));

  // Get hot lists in streams
  Stream<List<DmcHotEntityData>> getDmcHotListStream(TimePeriod selectedTimePeriod) =>
      (select(dmcHotEntity)..where((tbl) => tbl.timePeriodIndex.equals(selectedTimePeriod.index))).watch();

  Future<int> clearDb() async => await delete(dmcHotEntity).go();
}
