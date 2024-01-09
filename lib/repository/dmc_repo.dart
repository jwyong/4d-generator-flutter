import 'package:analyzer_plugin/utilities/pair.dart';
import 'package:lucky_generator/database/dao/dmc/dmc_dao.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/model/universal/time_period.dart';

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

  // Get flat list of dmc 4d numbers based on timePeriod enum
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

  // Get flat list of dmc 4d numbers from 1 year - last month away
  Future<List<String>> getDmc4dFlatList2yearsAgo() async {
    final dateTimeNow = DateTime.now();

    // Get start date (2 years ago)
    final dateTimeStart = DateTime(dateTimeNow.year - 1, dateTimeNow.month, dateTimeNow.day);

    // Get end date (1 year ago)
    final dateTimeEnd = DateTime(dateTimeNow.year, dateTimeNow.month, dateTimeNow.day);

    // Get list from dao
    final nested4dList = await _dmcDao.get4dListBetweenStartToEndDate(dateTimeStart, dateTimeEnd);

    // Flatten list and return
    return nested4dList.expand<String>((i) => i ?? List.empty()).toList();
  }

  // Get flat list of dmc 4d numbers from a specific date to now
  Future<List<Pair<String, String>>> getDmc4dFlatPairListSinceDate(DateTime startDate) async {
    final nested4dList = await _dmcDao.get4dListPairBetweenStartToEndDate(startDate, DateTime.now());

    return nested4dList
        .where((pair) => pair != null)
        .expand((pair) => pair!.last.map((innerItem) => Pair(pair.first, innerItem)))
        .toList();
  }

  // Get list of dmc 4d numbers from 1 month ago
  Future<List<List<String>?>> getDmc4dListNested1Year() {
    final dateTimeNow = DateTime.now();

    // Get start date (1 year ago)
    final dateTimeStart = DateTime(dateTimeNow.year - 1, dateTimeNow.month, dateTimeNow.day);

    // Get list from dao
    final nested4dList = _dmcDao.getNested4dListFromStartDate(dateTimeStart);

    // Retrun nested list of strings
    return nested4dList;
  }

  // Get latest draw dates for a number
  Future<List<DateTime?>> getLatestDrawDatesList(String number, int topCount) async =>
      await _dmcDao.getLatestDrawDatesList(number, topCount);

  // Get latest draw date in DB (to see if need to sync with website)
  Future<DateTime?> getLatestDrawDate() async => await _dmcDao.getLatestDrawDate();

  /// Past results page related
  // Get the x previous past results from today
  Stream<List<DmcEntityData>> getLatestPastResults(int count) => _dmcDao.getLatestPastResults(count);

  // Get the x past results on both sides of a given drawNo (previous and next)
  Future<Stream<List<DmcEntityData>>?> getPastResultsAroundDrawNo(String drawNo, int count) async {
    // Get the drawDate from drawNo first
    DateTime? drawDate = await _dmcDao.getDrawDateFromDrawNo(drawNo);

    // Add a flat 2 weeks into the drawDate to cater for next pastResults
    drawDate = drawDate?.add(const Duration(days: 14));

    // Add a flat 8 items to count to cater for next pastResults
    return drawDate != null ? _dmcDao.getPreviousPastResultsFromDateTime(drawDate, count + 8, true) : null;
  }

  // Get x previous past results from a given date
  Stream<List<DmcEntityData>> getPreviousPastResultsFromDateTime(
          DateTime dateTime, int count, bool shouldIncludeDate) =>
      _dmcDao.getPreviousPastResultsFromDateTime(dateTime, count, shouldIncludeDate);

  // Get x next past results from a given date
  Stream<List<DmcEntityData>> getNextPastResultsFromDateTime(DateTime dateTime, int count, bool shouldIncludeDate) =>
      _dmcDao.getNextPastResultsFromDateTime(dateTime, count, shouldIncludeDate);

  // Delete whole table
  Future<void> clearDb() async {
    await _dmcDao.clearDb();
  }
}
