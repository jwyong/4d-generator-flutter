import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucky_generator/database/my_database.dart';

import 'firebase_options.dart';

class MainInitModule {
  Future init() async {
    // Widgets
    WidgetsFlutterBinding.ensureInitialized();

    // Provide database to whole app with GetX
    Get.put(MyDatabase());

    // Firebase realtime db
    await Firebase.initializeApp(
      name: "lucky_generator_frDB",
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}