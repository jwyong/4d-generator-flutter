import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class RealtimeDatabaseRepository {
  // Init database refs for firebase rtDB
  Object getDmcDatabase() async {
    try {
      // TODO: JAY_LOG - test get 10 only for now
      final dmc = await FirebaseDatabase.instance.ref("dmc").limitToFirst(10).get();
      if (dmc.exists) {
        debugPrint("JAY_LOG: RealtimeDatabaseRepository, initFirebaseRefs, dmc size = ${dmc.value}");
        return dmc.value;
      } else {
        debugPrint("JAY_LOG: RealtimeDatabaseRepository, initFirebaseRefs, not exist");
        return null;
      }
    } catch (error) {
      debugPrint("JAY_LOG: MainVMBase, initFirebaseRefs, e = $error");
      return null;
    }
  }
}