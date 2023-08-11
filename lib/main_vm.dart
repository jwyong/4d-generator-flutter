import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:lucky_generator/base/base_state.dart';
import 'package:lucky_generator/constant/shared_prefs_constants.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/main.dart';
import 'package:lucky_generator/repository/dmc_repo.dart';
import 'package:lucky_generator/repository/realtime_db_repo.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'main_vm.g.dart';

class MainVM = AMainVM with _$MainVM;

/// TODO: JAY_LOG:
/// - design layout struct (3 tabs dmc, toto and magnum?)
/// - add http lib
/// - make http GET call (as per script)
abstract class AMainVM with Store, BaseController {
  late final _dmcRepository = DmcRepository(database);
  late final _realtimeDbRepo = RealtimeDatabaseRepository();
  late final SharedPreferences prefs;

  late final Stream<List<DmcEntityData>> dmcList = _dmcRepository.getDmcListStream();

  // Sync all realtimeDB data to driftDB (for all companies dmc, toto, magnum...)
  void checkAndStartSync() async {
    prefs = await SharedPreferences.getInstance();
    final isSynced = prefs.getBool(spKeyIsDmcSynced);

    debugPrint("JAY_LOG: AMainVM, checkAndSyncDatabases, isSynced = $isSynced");

    // Only sync from realtimeDB if not done yet
    if (isSynced != true) {
      _syncDmcFromRealtimeDB();
    } else {
      // Already synced from realtimeDB: need to check date and sync latest from website
      // TODO: JAY_LOG - assume already get latest in DB from this point

    }
  }

  // Get dmc db from realtimeDB
  void _syncDmcFromRealtimeDB() async {
    final dmcObj = await _realtimeDbRepo.getDmcDatabase();

    debugPrint("JAY_LOG: AMainVM, checkAndSyncDatabases, dmcObjectList = ${dmcObj?.length}");

    // Get dmc entity list from realtimeDB object. This includes processing into a single list.
    final dmcEntityList = _realtimeDbRepo.getDmcEntityListFromObject(dmcObj);
    debugPrint("JAY_LOG: AMainVM, checkAndSyncDatabases, dmcEntityList = ${dmcEntityList.length}");

    // Add to drift db
    await _dmcRepository.insertDmcList(dmcEntityList);

    debugPrint("JAY_LOG: AMainVM, checkAndSyncDatabases, ");

    // Update isSynced bool to sp
    prefs.setBool(spKeyIsDmcSynced, true);
  }

  // Calculate hot numbers from past 1 year
  void _updateHotNumbers() {
    here - // TODO: JAY_LOG
  }
}
