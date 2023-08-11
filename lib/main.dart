import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucky_generator/main_init_module.dart';
import 'package:provider/provider.dart';

import 'database/my_database.dart';
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

class _MyHomePageState extends State<MyHomePage> {
  final MainVM vm = MainVM();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<List<DmcEntityData>>(
          stream: vm.dmcList,
          builder: (context, snapshot) {
            final List<DmcEntityData>? items = snapshot.data;
            if (items?.isNotEmpty == true) {
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: items?.length,
                  itemBuilder: (context, index) =>
                      Text(items?.elementAt(index).full4dList?.toString() ?? ""));
            } else {
              return const Text("empty");
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: vm.syncDatabasesOnClick,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
