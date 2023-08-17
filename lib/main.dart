import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucky_generator/base/base_state.dart';
import 'package:lucky_generator/constant/constants.dart';
import 'package:lucky_generator/main_init_module.dart';
import 'package:lucky_generator/pages/home_page/home_page.dart';

import 'generated/l10n.dart';
import 'main_vm.dart';

Future<void> main() async {
  await MainInitModule().init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends BaseState<MyApp> {
  late final MainVM _vm = MainVM()..bind(this);

  @override
  void initState() {
    super.initState();

    _vm.checkAndStartSync();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    // TODO: JAY_LOG - add willPopScope for Android back button
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (ctx, child) => MaterialApp(
            title: dmcShort,
            theme: ThemeData(primarySwatch: Colors.red),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            home: const HomePage()));
  }
}
