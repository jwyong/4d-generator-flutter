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
/// - optimise first time realtimeDB (remove unused columns)
/// - add http lib
/// - optimise first time driftDB (check logics, async?)
/// - make http GET call (as per script)
abstract class AMainVM with Store, BaseViewModel {
  late final _realtimeDbRepo = RealtimeDatabaseRepository();

  late final _dmcRepository = DmcRepository(database);
  late final _dmcHotRepository = DmcHotRepository(database);

  late final HotNumbersUtil _hotNumbersUtil = HotNumbersUtil();

  late final SharedPreferences prefs;

  // Sync all realtimeDB data to driftDB (for all companies dmc, toto, magnum...)
  void checkAndStartSync() async {
    prefs = await SharedPreferences.getInstance();
    final isSynced = prefs.getBool(spKeyIsDmcSynced);

    debugPrint("JAY_LOG: AMainVM, checkAndSyncDatabases, isSynced = $isSynced");

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

    // Add to drift db
    await _dmcRepository.insertDmcList(dmcEntityList);

    // Update isSynced bool to sp
    prefs.setBool(spKeyIsDmcSynced, true);

    debugPrint("JAY_LOG: AMainVM, checkAndSyncDatabases done, dmcEntityList = ${dmcEntityList.length}");
  }

  // Calculate hot numbers from past 1 year
  void _checkAndUpdateHotNumbers() async {
    // TODO: JAY_LOG - combine with web check logics
    final bool needUpdate = prefs.getInt(spKeyDmcLastHotSync) == null;

    debugPrint("JAY_LOG: AMainVM, _checkAndUpdateHotNumbers, needUpdate = $needUpdate");

    if (!needUpdate) return;

    // Get 1 year flat 4d list from db
    const timePeriod = TimePeriod.year_1;
    final list4d1year = await _dmcRepository.getDmc4dListByTimePeriod(timePeriod);

    // Get all hot numbers / doubles / triples first
    final hotNumbers = _hotNumbersUtil.getHotNumbers(list4d1year, 3);
    final hotNumbersPau = _hotNumbersUtil.getHotNumbersPau(list4d1year, 3);
    final hotDoubles = _hotNumbersUtil.getHotDoubles(list4d1year, 3);
    final hotTriples = _hotNumbersUtil.getHotTriples(list4d1year, 3);

    // Get occurrences for each hot numbers pau and doubles / triples
    final hotNumbersPauOccurrences = List<MapEntry<String, int>>.empty(growable: true);
    for (var element in hotNumbersPau) {
      hotNumbersPauOccurrences.addAll(_hotNumbersUtil.getHotNumbersPauOccurrences(list4d1year, 3, element.key));
    }
    final hotDoublesOccurrences = List<MapEntry<String, int>>.empty(growable: true);
    for (var element in hotDoubles) {
      hotDoublesOccurrences.addAll(_hotNumbersUtil.getHotDoublesOccurrences(list4d1year, 3, element.key));
    }
    final hotTriplesOccurrences = List<MapEntry<String, int>>.empty(growable: true);
    for (var element in hotTriples) {
      hotTriplesOccurrences.addAll(_hotNumbersUtil.getHotTriplesOccurrences(list4d1year, 3, element.key));
    }

    // Get companion from each type of hot number list
    final hotNumbersCompanions =
        _dmcHotRepository.convertListToDmcHotEntityList(hotNumbers, HotNumberType.hotNumber, timePeriod);
    final hotNumbersPuaCompanions =
        _dmcHotRepository.convertListToDmcHotEntityList(hotNumbersPau, HotNumberType.hotNumberPau, timePeriod);
    final hotNumbersPuaOccurrenceCompanions =
        _dmcHotRepository.convertListToDmcHotEntityList(hotNumbersPauOccurrences, HotNumberType.hotNumberPauOccurrence, timePeriod);
    final hotDoublesCompanions =
        _dmcHotRepository.convertListToDmcHotEntityList(hotDoubles, HotNumberType.hotDouble, timePeriod);
    final hotDoublesOccurrenceCompanions =
        _dmcHotRepository.convertListToDmcHotEntityList(hotDoublesOccurrences, HotNumberType.hotDoubleOccurrence, timePeriod);
    final hotTriplesCompanions =
        _dmcHotRepository.convertListToDmcHotEntityList(hotTriples, HotNumberType.hotTriple, timePeriod);
    final hotTriplesOccurrenceCompanions =
        _dmcHotRepository.convertListToDmcHotEntityList(hotTriplesOccurrences, HotNumberType.hotTripleOccurrence, timePeriod);

    // Combine entity list and insert to db
    final combinedCompanions = hotNumbersCompanions + hotNumbersPuaCompanions + hotNumbersPuaOccurrenceCompanions +
        hotDoublesCompanions + hotDoublesOccurrenceCompanions + hotTriplesCompanions + hotTriplesOccurrenceCompanions;

    await _dmcHotRepository.insertDmcHotList(combinedCompanions);

    // Update sp once done insert
    prefs.setInt(spKeyDmcLastHotSync, DateTime.now().millisecondsSinceEpoch);
  }
}
