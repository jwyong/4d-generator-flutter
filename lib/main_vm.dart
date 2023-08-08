
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lucky_generator/repository/realtime_db_repo.dart';
import 'package:mobx/mobx.dart';

part 'main_vm.g.dart';

class MainVM = MainVMBase with _$MainVM;

/// TODO: JAY_LOG:
/// - add model generator lib
/// - create object for DMC + test add/get
/// - add http lib
/// - make http GET call
/// - checkAndUpdate to frDB
/// - populate xxx entries
/// - download CSV and start analysing
abstract class MainVMBase with Store {
  /// Firebase realtime database related
  final realtimeDbRepo = RealtimeDatabaseRepository();

  // @observable
  // String description = '';

  // Get all db from firebase realtimeDB
  void syncDatabasesOnClick() {
    // Get dmc db from realtimeDB
    Object dmcObj = realtimeDbRepo.getDmcDatabase();

    // Map to database object

  }
}