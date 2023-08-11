import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucky_generator/base/base_state.dart';
import 'package:lucky_generator/main_init_module.dart';
import 'package:lucky_generator/pages/home_page/home_page.dart';
import 'package:lucky_generator/constant/constants.dart';
import 'package:provider/provider.dart';

import 'database/my_database.dart';
import 'generated/l10n.dart';
import 'main_vm.dart';

MyDatabase database = MyDatabase();

Future<void> main() async {
  await MainInitModule().init();
  runApp(Provider<MyDatabase>(
    create: (context) => MyDatabase(),
    child: const MyApp(),
    dispose: (context, db) => db.close(),
  ));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//
//   // This widget is the root of your application.
//   // @override
//   // Widget build(BuildContext context) {
//   //   return MaterialApp(
//   //     title: 'Lucky 4d Generator',
//   //     theme: ThemeData(
//   //       primarySwatch: Colors.blue,
//   //     ),
//   //     home: const MyHomePage(title: 'Lucky 4D Generator'),
//   //   );
//   }
// }

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

    // TODO: JAY_LOG - check performance
    _vm.checkAndStartSync();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (ctx, child) => MaterialApp(
            title: dmcShort, // TODO: JAY_LOG
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
