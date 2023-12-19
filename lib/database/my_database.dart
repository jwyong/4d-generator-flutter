import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:lucky_generator/database/dao/dmc/dmc_dao.dart';
import 'package:lucky_generator/database/dao/dmc/dmc_hot_dao.dart';
import 'package:lucky_generator/database/dao/universal/my_history_dao.dart';
import 'package:lucky_generator/database/entity/dmc/dmc_hot_entity.dart';
import 'package:lucky_generator/database/entity/universal/my_history_entity.dart';
import 'package:lucky_generator/database/type_converter/string_list_converter.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'entity/dmc/dmc_entity.dart';

part 'my_database.g.dart';

@DriftDatabase(tables: [DmcEntity, DmcHotEntity, MyHistoryEntity], daos: [DmcDao, DmcHotDao, MyHistoryDao])
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
