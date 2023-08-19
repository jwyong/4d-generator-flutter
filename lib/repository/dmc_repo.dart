import 'package:lucky_generator/database/dao/dmc_dao.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/model/time_period.dart';

class DmcRepository {
  DmcRepository(this._db);

  final MyDatabase _db;
  late final DmcDao _dmcDao = _db.dmcDao;

  // Insert dmc list to db
  Future<void> insertDmcList(List<DmcEntityData> list) async {
    await _dmcDao.insertDmcList(list);
  }

  // Check if data exists
  Future<bool> checkExistDmcTable() async {
    final data = await _dmcDao.checkExistDmc();
    return data != null;
  }

  // Get flat list of dmc 4d numbers based on timePeriod
  Future<List<String>> getDmc4dListByTimePeriod(TimePeriod timePeriod) async {
    // Get the unix timeStamp to be used to query db
    final int unixForFilter;
    if (timePeriod.unixTimeStampSeconds == null) {
      // All - just use 0
      unixForFilter = 0;
    } else {
      // Others - minus from timeNow
      final unixSinceEpochNow = DateTime.now().millisecondsSinceEpoch;
      final unixTimePeriod = (timePeriod.unixTimeStampSeconds ?? 0) * 1000;
      unixForFilter = unixSinceEpochNow - unixTimePeriod.toInt();
    }

    // Convert unix int to dateTime
    final dateTimeForFilter = DateTime.fromMillisecondsSinceEpoch(unixForFilter);

    // Query db with unix
    final nested4dList = await _dmcDao.get4dListAfterDateTime(dateTimeForFilter);

    // Flatten list and return
    return nested4dList.expand<String>((i) => i ?? List.empty()).toList();
  }

  // Get latest draw dates for a number
  Future<List<DateTime?>> getLatestDrawDatesList(String number, int topCount) async =>
      await _dmcDao.getLatestDrawDatesList(number, topCount);

  // Get latest draw date in DB (to see if need to sync with website)
  Future<DateTime?> getLatestDrawDate() async => await _dmcDao.getLatestDrawDate();

  // Delete whole table
  Future<void> clearDb() async {
    await _dmcDao.clearDb();
  }
}
