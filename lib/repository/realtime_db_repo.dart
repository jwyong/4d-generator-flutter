import 'dart:collection';
import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lucky_generator/database/entity/dmc_entity.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/model/dmc/dmc_real_db.dart';
import 'package:lucky_generator/util/number_util.dart';

class RealtimeDatabaseRepository {
  // Init database refs for firebase rtDB
  Future<List<Object?>?> getDmcDatabase() async {
    try {
      // TODO: JAY_LOG - test get 10 only for now
      final dmc = await FirebaseDatabase.instance.ref("dmc").limitToFirst(10).get();
      if (dmc.exists) {
        return dmc.value as List<Object?>;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  // Map dmc realtimeDB to driftDB object
  List<DmcEntityData> getDmcEntityListFromObject(List<Object?>? value) {
    if (value != null) {
      final dmcList = List<DmcEntityData>.from(value.map((e) {
        // Convert realtimeDb object to map
        final objectMap = e as Map<Object?, Object?>;

        // Get all 4d numbers and lists
        final p1 = objectMap['p1'].toString();
        final p2 = objectMap['p2'].toString();
        final p3 = objectMap['p3'].toString();
        final starterList = (objectMap['starterList'] as List<dynamic>)
            .map((e) => e.toString())
            .toList();
        final consolidateList = (objectMap['consolidateList'] as List<dynamic>)
            .map((e) => e.toString())
            .toList();

        // Combine list to form full4dList
        final full4dList = starterList + consolidateList;
        full4dList
          ..add(p1)
          ..add(p2)
          ..add(p3);

        // Map objects map to correct String / int map
        final dmcEntityData = DmcEntityData(
            id: objectMap['id'].toString().toIntOrNull() ?? -1,
            status: objectMap['status'].toString(),
            drawDate: objectMap['drawDate'].toString(),
            drawNo: objectMap['drawNo'].toString(),
            p1: p1,
            p2: p2,
            p3: p3,
            starterList: starterList,
            consolidateList: consolidateList,
            full4dList: full4dList);

        return dmcEntityData;
      }));

      return dmcList;
    }
    return List.empty();
  }
}
