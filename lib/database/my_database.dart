import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:lucky_generator/database/dao/dmc_dao.dart';
import 'package:lucky_generator/database/type_converter/int_list_converter.dart';
import 'package:lucky_generator/database/type_converter/string_list_converter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'entity/dmc_entity.dart';

part 'my_database.g.dart';

@DriftDatabase(tables: [DmcEntity], daos: [DmcDao])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
