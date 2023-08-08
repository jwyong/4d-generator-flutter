import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

class MainInitModule {
  Future init() async {
    // Widgets
    WidgetsFlutterBinding.ensureInitialized();

    // Firebase realtime db
    await Firebase.initializeApp(
      name: "lucky_generator_frDB",
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}