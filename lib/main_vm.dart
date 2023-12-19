import 'package:flutter/material.dart';
import 'package:lucky_generator/base/base_state.dart';
import 'package:lucky_generator/constant/shared_prefs_constants.dart';
import 'package:lucky_generator/model/universal/hot_number_type.dart';
import 'package:lucky_generator/model/universal/time_period.dart';
import 'package:lucky_generator/repository/dmc_hot_repo.dart';
import 'package:lucky_generator/repository/dmc_repo.dart';
import 'package:lucky_generator/repository/dmc_web_repo.dart';
import 'package:lucky_generator/repository/universal/realtime_db_repo.dart';
import 'package:lucky_generator/util/date_time_util.dart';
import 'package:lucky_generator/util/hot_numbers_util.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'main_vm.g.dart';

class MainVM = AMainVM with _$MainVM;

/// TODO: JAY_LOG:
/// - first time realtimeDB sync issue (vivo, iphone) - permission? check
/// - add realtimeDB sync logics after xx days (1 month?)
/// - check http web call error cases (crash? spammed?)
/// - ads!
/// - error handling (snack bars/retry button?)
/// - optimise first time driftDB (check logics, async?)
abstract class AMainVM extends BaseViewModel with Store {
  late final _realtimeDbRepo = RealtimeDatabaseRepository();

  late final _dmcRepository = DmcRepository(database);
  late final _dmcHotRepository = DmcHotRepository(database);
  late final _dmcWebRepository = DmcWebRepository();

  late final HotNumbersUtil _hotNumbersUtil = HotNumbersUtil();

  late final SharedPreferences prefs;

  Future<void> clearDriftDb() async {
    await _dmcRepository.clearDb();
    await _dmcHotRepository.clearDb();
  }

  // Sync all realtimeDB data to driftDB (for all companies dmc, toto, magnum...)
  void checkAndStartSync() async {
    prefs = await SharedPreferences.getInstance();

    // Check and sync realtimeDB if not done yet
    bool? isDmcRealtimeDbSynced = prefs.getBool(spKeyIsDmcRealtimeDbSynced);
    if (isDmcRealtimeDbSynced != true) {
      isDmcRealtimeDbSynced = await _syncDmcFromRealtimeDB();
    }

    // Return error if failed to sync
    // TODO: JAY_LOG - error, show snack bar?
    if (isDmcRealtimeDbSynced != true) {
      debugPrint("AMainVM, checkAndStartSync, isDmcRealtimeDbSynced error");
      return;
    }

    // Already synced from realtimeDB: check date and sync latest from website
    DateTime? latestDrawDate = await _dmcRepository.getLatestDrawDate();
    // TODO: JAY_LOG - error, show snack bar?
    if (latestDrawDate == null) {
      debugPrint("AMainVM, checkAndStartSync, latestDrawDate null error");
      return;
    }

    final dateTimeNow = DateTime.now();
    final today = DateTime(dateTimeNow.year, dateTimeNow.month, dateTimeNow.day);
    final latestDrawDay = DateTime(latestDrawDate.year, latestDrawDate.month, latestDrawDate.day);

    /// Web is synced if:
    /// - already synced today
    /// - OR today is AFTER last draw date
    final String? dmcLastWebSync = prefs.getString(spKeyDmcLastWebSync);
    final String todayFormattedDateStr = today.toFormattedString(ddMMyyyyFormat);
    final bool isWebSyncedToday = dmcLastWebSync == todayFormattedDateStr;
    final isNextDayFromLastDrawDate = today.isAfter(latestDrawDay);

    bool isDmcWebSynced = isWebSyncedToday || !isNextDayFromLastDrawDate;
    if (!isDmcWebSynced) {
      isDmcWebSynced = await _syncDmcFromOfficialWeb(latestDrawDate, todayFormattedDateStr);
    }

    // Return error if failed to sync
    // TODO: JAY_LOG - error, show snack bar?
    if (isDmcWebSynced != true) {
      debugPrint("AMainVM, checkAndStartSync, isDmcWebSynced error");
      return;
    }

    /// Latest results synced from web: calculate 1 year stats (hot numbers/etc) based on driftDB data
    /// Only need to re-calculate 1 year stats if:
    /// - latest draw date is NOT the same as last stats sync date
    // Get latest draw date from DB again, since it might have been updated by web sync
    latestDrawDate = await _dmcRepository.getLatestDrawDate();
    // TODO: JAY_LOG - error, show snack bar?
    if (latestDrawDate == null) {
      debugPrint("AMainVM, checkAndStartSync, latestDrawDate for hotSync null error");
      return;
    }
    final latestDrawDateStr = latestDrawDate.toFormattedString(ddMMyyyyFormat);
    final lastHotSyncDateStr = prefs.getString(spKeyDmcLastHotSync);

    bool isDmcHotSynced = latestDrawDateStr == lastHotSyncDateStr;
    if (!isDmcHotSynced) {
      _syncHotNumbers(latestDrawDateStr);
    }
  }

// Get dmc db from realtimeDB
  Future<bool> _syncDmcFromRealtimeDB() async {
    final dmcObj = await _realtimeDbRepo.getDmcDatabase();

    // Get dmc entity list from realtimeDB object. This includes processing into a single list.
    final dmcEntityList = _realtimeDbRepo.getDmcEntityListFromObject(dmcObj);

    // TODO: JAY_LOG - show snack bar? Return false if list is empty (failed)
    if (dmcEntityList.isEmpty) {
      debugPrint("AMainVM, _syncDmcFromRealtimeDB, list is empty");
      return false;
    }

    // Add to drift db
    await _dmcRepository.insertDmcList(dmcEntityList);

    // Update isSynced bool to sp
    prefs.setBool(spKeyIsDmcRealtimeDbSynced, true);

    // Return true after inserting
    return true;
  }

// Get latest results from dmc web
  Future<bool> _syncDmcFromOfficialWeb(DateTime latestDrawDate, String todayFormattedDateStr) async {
    final latestResultsList = await _dmcWebRepository.getLatestDmcWebResultsList(latestDrawDate);

    if (latestResultsList == null) {
      return false;
    } else {
      // Only insert to DB if list not empty (success, no new results)
      if (latestResultsList.isNotEmpty) {
        _dmcRepository.insertDmcList(latestResultsList);
      }

      // Update isSyncedToday bool for success case
      prefs.setString(spKeyDmcLastWebSync, todayFormattedDateStr);

      return true;
    }
  }

// Calculate hot numbers from past 1 year
  Future<bool> _syncHotNumbers(String latestDrawDateStr) async {
    // Get 1 year flat 4d list from db
    const timePeriod = TimePeriod.year_1;
    final list4d1year = await _dmcRepository.getDmc4dListByTimePeriod(timePeriod);

    // Get all hot numbers / doubles / triples first
    final hotNumbers = _hotNumbersUtil.getHotNumbers(list4d1year, 3);
    final hotNumbersPau = _hotNumbersUtil.getHotNumbersPau(list4d1year, 3);
    final hotDoubles = _hotNumbersUtil.getHotDoubles(list4d1year, 3);
    final hotTriples = _hotNumbersUtil.getHotTriples(list4d1year, 3);

    // Get occurrences/date for each hot numbers pau and doubles / triples
    final List<MapEntry<String, List<DateTime?>>> hotNumbersDrawDates = List.empty(growable: true);
    for (final element in hotNumbers) {
      final drawDates = await _dmcRepository.getLatestDrawDatesList(element.key, 3);
      hotNumbersDrawDates.add(MapEntry(element.key, drawDates));
    }
    final List<MapEntry<String, List<MapEntry<String, int>>>> hotNumbersPauOccurrences = hotNumbersPau.map((e) {
      final occurrenceList = _hotNumbersUtil.getHotNumbersPauOccurrences(list4d1year, 3, e.key);
      return MapEntry(e.key, occurrenceList);
    }).toList();
    final List<MapEntry<String, List<MapEntry<String, int>>>> hotDoublesOccurrences = hotDoubles.map((e) {
      final occurrenceList = _hotNumbersUtil.getHotDoublesOccurrences(list4d1year, 3, e.key);
      return MapEntry(e.key, occurrenceList);
    }).toList();
    final List<MapEntry<String, List<MapEntry<String, int>>>> hotTriplesOccurrences = hotTriples.map((e) {
      final occurrenceList = _hotNumbersUtil.getHotTriplesOccurrences(list4d1year, 3, e.key);
      return MapEntry(e.key, occurrenceList);
    }).toList();

    // Get companion from each type of hot number list
    final hotNumbersCompanions =
        _dmcHotRepository.convertListToDmcHotEntityList(hotNumbers, HotNumberType.hotNumber, timePeriod);
    final hotNumberDrawDatesCompanions = _dmcHotRepository.convertDrawDatesListToDmcHotEntityList(
        hotNumbersDrawDates, HotNumberType.hotNumberDrawDate, timePeriod);

    final hotNumbersPauCompanions =
        _dmcHotRepository.convertListToDmcHotEntityList(hotNumbersPau, HotNumberType.hotNumberPau, timePeriod);
    final hotNumbersPauOccurrenceCompanions = _dmcHotRepository.convertOccurenceListToDmcHotEntityList(
        hotNumbersPauOccurrences, HotNumberType.hotNumberPauOccurrence, timePeriod);

    final hotDoublesCompanions =
        _dmcHotRepository.convertListToDmcHotEntityList(hotDoubles, HotNumberType.hotDouble, timePeriod);
    final hotDoublesOccurrenceCompanions = _dmcHotRepository.convertOccurenceListToDmcHotEntityList(
        hotDoublesOccurrences, HotNumberType.hotDoubleOccurrence, timePeriod);

    final hotTriplesCompanions =
        _dmcHotRepository.convertListToDmcHotEntityList(hotTriples, HotNumberType.hotTriple, timePeriod);
    final hotTriplesOccurrenceCompanions = _dmcHotRepository.convertOccurenceListToDmcHotEntityList(
        hotTriplesOccurrences, HotNumberType.hotTripleOccurrence, timePeriod);

    // Combine entity list and insert to db
    final combinedCompanions = hotNumbersCompanions +
        hotNumberDrawDatesCompanions +
        hotNumbersPauCompanions +
        hotNumbersPauOccurrenceCompanions +
        hotDoublesCompanions +
        hotDoublesOccurrenceCompanions +
        hotTriplesCompanions +
        hotTriplesOccurrenceCompanions;

    // Clear hot table before inserting new list
    await _dmcHotRepository.clearDb();
    await _dmcHotRepository.insertDmcHotList(combinedCompanions);

    // Update sp with latest drawDate once done insert
    prefs.setString(spKeyDmcLastHotSync, latestDrawDateStr);

    return true;
  }
}
