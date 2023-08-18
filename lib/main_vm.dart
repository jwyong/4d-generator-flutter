import 'package:flutter/material.dart';
import 'package:lucky_generator/base/base_state.dart';
import 'package:lucky_generator/constant/shared_prefs_constants.dart';
import 'package:lucky_generator/model/hot_number_type.dart';
import 'package:lucky_generator/model/time_period.dart';
import 'package:lucky_generator/repository/dmc_hot_repo.dart';
import 'package:lucky_generator/repository/dmc_repo.dart';
import 'package:lucky_generator/repository/realtime_db_repo.dart';
import 'package:lucky_generator/util/hot_numbers_util.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'main_vm.g.dart';

class MainVM = AMainVM with _$MainVM;

/// TODO: JAY_LOG:
/// - first time realtimeDB sync issue (vivo, iphone) - permission? check
/// - add http lib
/// - optimise first time driftDB (check logics, async?)
/// - make http GET call (as per script)
abstract class AMainVM with Store, BaseViewModel {
  late final _realtimeDbRepo = RealtimeDatabaseRepository();

  late final _dmcRepository = DmcRepository(database);
  late final _dmcHotRepository = DmcHotRepository(database);

  late final HotNumbersUtil _hotNumbersUtil = HotNumbersUtil();

  late final SharedPreferences prefs;

  Future<void> clearDriftDb() async {
    await _dmcRepository.clearDb();
    await _dmcHotRepository.clearDb();
  }

  // Sync all realtimeDB data to driftDB (for all companies dmc, toto, magnum...)
  void checkAndStartSync() async {
    prefs = await SharedPreferences.getInstance();
    final isSynced = prefs.getBool(spKeyIsDmcSynced);

    debugPrint("AMainVM, checkAndSyncDatabases, isSynced = $isSynced");

    // Only sync from realtimeDB if not done yet
    if (isSynced != true) {
      await _syncDmcFromRealtimeDB();
    } else {
      // Already synced from realtimeDB: need to check date and sync latest from website
      // TODO: JAY_LOG - flow for http checking
    }

    // Calculate 1 year stats (hot numbers/etc) based on driftDB data
    // TODO: JAY_LOG - need do check logics (use sp bool again?)
    _checkAndUpdateHotNumbers();
  }

  // Get dmc db from realtimeDB
  Future<void> _syncDmcFromRealtimeDB() async {
    final dmcObj = await _realtimeDbRepo.getDmcDatabase();

    // Get dmc entity list from realtimeDB object. This includes processing into a single list.
    final dmcEntityList = _realtimeDbRepo.getDmcEntityListFromObject(dmcObj);

    // Don't proceed if list empty TODO: JAY_LOG - handle error
    if (dmcEntityList.isEmpty) {
      debugPrint("AMainVM, _syncDmcFromRealtimeDB, list is empty");
      return;
    }

    // Add to drift db
    await _dmcRepository.insertDmcList(dmcEntityList);

    // Update isSynced bool to sp
    prefs.setBool(spKeyIsDmcSynced, true);
  }

  // Calculate hot numbers from past 1 year
  void _checkAndUpdateHotNumbers() async {
    // TODO: JAY_LOG - combine with web check logics
    final bool needUpdate = prefs.getInt(spKeyDmcLastHotSync) == null;

    debugPrint("AMainVM, _checkAndUpdateHotNumbers, needUpdate = $needUpdate");

    if (!needUpdate) return;

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

    await _dmcHotRepository.insertDmcHotList(combinedCompanions);

    // Update sp once done insert
    prefs.setInt(spKeyDmcLastHotSync, DateTime.now().millisecondsSinceEpoch);
  }
}
