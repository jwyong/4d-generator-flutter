import 'package:drift/drift.dart';
import 'package:lucky_generator/database/entity/dmc/dmc_hot_entity.dart';
import 'package:lucky_generator/database/my_database.dart';

part 'dmc_hot_dao.g.dart';

@DriftAccessor(tables: [DmcHotEntity])
class DmcHotDao extends DatabaseAccessor<MyDatabase> with _$DmcHotDaoMixin {
  DmcHotDao(MyDatabase db) : super(db);

  /// Insert
  Future<void> insertDmcHotList(List<DmcHotEntityCompanion> list) async =>
      await db.batch((batch) => batch.insertAllOnConflictUpdate(db.dmcHotEntity, list));

  // Get full list in stream
  Stream<List<DmcHotEntityData>> getDmcHotListStream() => (select(dmcHotEntity)).watch();
}