
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lucky_generator/base/base_state.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/main.dart';
import 'package:lucky_generator/repository/dmc_repo.dart';
import 'package:lucky_generator/repository/realtime_db_repo.dart';
import 'package:mobx/mobx.dart';

part 'main_vm.g.dart';

class MainVM = AMainVM with _$MainVM;

/// TODO: JAY_LOG:
/// - design layout struct (3 tabs dmc, toto and magnum?)
/// - add http lib
/// - make http GET call (as per script)
abstract class AMainVM with Store, BaseController {
  late final _dmcRepository = DmcRepository(database);
  late final _realtimeDbRepo = RealtimeDatabaseRepository();

  late final Stream<List<DmcEntityData>> dmcList = _dmcRepository.getDmcListStream();

  // @observable
  // String description = '';

  // Sync all realtimeDB data to driftDB
  void syncDatabasesOnClick() async {
    // Get dmc db from realtimeDB
    final dmcObj = await _realtimeDbRepo.getDmcDatabase();

    // Get dmc entity list from realtimeDB object. This includes processing into a single list.
    final dmcEntityList = _realtimeDbRepo.getDmcEntityListFromObject(dmcObj);

    // Add to drift db
    _dmcRepository.insertDmcList(dmcEntityList);
  }
}