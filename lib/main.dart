import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lucky_generator/base/base_state.dart';
import 'package:lucky_generator/main_init_module.dart';
import 'package:lucky_generator/pages/home_page/home_page.dart';
import 'package:lucky_generator/util/constants.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lucky 4d Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Lucky 4D Generator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends BaseState<MyHomePage> {
  late final MainVM _vm = MainVM()
    ..bind(this);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
        title: DMC,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const HomePage()
    );

    // Scaffold(
    //   appBar: AppBar(
    //     title: Text(widget.title),
    //   ),
    //   body: StreamBuilder<List<DmcEntityData>>(
    //       stream: _vm.dmcList,
    //       builder: (context, snapshot) {
    //         final List<DmcEntityData>? items = snapshot.data;
    //         if (items?.isNotEmpty == true) {
    //           return ListView.builder(
    //               physics: const BouncingScrollPhysics(),
    //               itemCount: items?.length,
    //               itemBuilder: (context, index) =>
    //                   Text(items
    //                       ?.elementAt(index)
    //                       .full4dList
    //                       ?.toString() ?? ""));
    //         } else {
    //           return const Text("empty");
    //         }
    //       }),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: _vm.syncDatabasesOnClick,
    //     tooltip: 'Increment',
    //     child: const Icon(Icons.add),
    //   ), // This trailing comma makes auto-formatting nicer for build methods.
    // );
  }
}
