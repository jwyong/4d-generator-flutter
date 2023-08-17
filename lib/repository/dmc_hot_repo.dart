import 'package:drift/drift.dart';
import 'package:lucky_generator/database/dao/dmc_hot_dao.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/model/hot_number_type.dart';
import 'package:lucky_generator/model/time_period.dart';

class DmcHotRepository {
  DmcHotRepository(this._db);

  final MyDatabase _db;
  late final DmcHotDao _dmcHotDao = _db.dmcHotDao;

  // Convert list of mapEntries to dmcHotEntity with type / etc
  List<DmcHotEntityCompanion> convertListToDmcHotEntityList(
          List<MapEntry<String, int>> list, HotNumberType hotNumberType, TimePeriod timePeriod) =>
      list
          .map((e) => DmcHotEntityCompanion(
              number: Value(e.key),
              occurrences: Value(e.value),
              hotNumberTypeIndex: Value(hotNumberType.index),
              timePeriodIndex: Value(timePeriod.index)))
          .toList();

  // Insert to db
  Future<void> insertDmcHotList(List<DmcHotEntityCompanion> list) async {
    await _dmcHotDao.insertDmcHotList(list);
  }

  // Get full dmc hot list stream
  Stream<List<DmcHotEntityData>> getDmcHotListStream(TimePeriod selectedTimePeriod) => _dmcHotDao.getDmcHotListStream(selectedTimePeriod);

  Future<void> clearDb() async {
    await _dmcHotDao.clearDb();
  }
}
