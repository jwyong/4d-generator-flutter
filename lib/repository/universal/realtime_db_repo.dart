import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lucky_generator/constant/constants.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/util/dmc_parser_util.dart';

class RealtimeDatabaseRepository {
  late final DmcParserUtil _dmcParserUtil = DmcParserUtil();

  // Init database refs for firebase rtDB
  Future<List<Object?>?> getDmcDatabase() async {
    try {
      final dmc = await FirebaseDatabase.instance.ref(realtimeDbKeyDMC).get();

      await FirebaseDatabase.instance.ref().get();

      if (dmc.exists) {
        return dmc.value as List<Object?>;
      } else {
        // TODO: JAY_LOG - error handling
        debugPrint("RealtimeDatabaseRepository, getDmcDatabase, database 'dmc' does not exist");
        return null;
      }
    } catch (error) {
      // TODO: JAY_LOG - error handling
      debugPrint("RealtimeDatabaseRepository, getDmcDatabase, error = $error");
      return null;
    }
  }

  // Map dmc realtimeDB to driftDB object
  List<DmcEntityData> getDmcEntityListFromObject(List<Object?>? dmcRealtimeDbList) {
    if (dmcRealtimeDbList != null) {
      final dmcList = List<DmcEntityData>.from(dmcRealtimeDbList.map((e) {
        // Convert realtimeDb object to map
        final objectMap = e as Map<Object?, Object?>;

        return _dmcParserUtil.getDmcEntityDatafromDmcJson(objectMap);
      }));

      return dmcList;
    }
    return List.empty();
  }
}
