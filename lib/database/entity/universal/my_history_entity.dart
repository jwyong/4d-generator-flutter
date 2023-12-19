import 'package:drift/drift.dart';

import '../../type_converter/string_list_converter.dart';

/// Main my history table holding all generated numbers + hit status
class MyHistoryEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  @override
  Set<Column> get primaryKey => {id};

  // Module type: DMC, toto, magnum, etc
  IntColumn get moduleTypeId => integer()();

  // Date this number was generated
  DateTimeColumn get dateGenerated => dateTime()();

  // Generated number in String form (for easy permutation matching)
  TextColumn get number => text()();

  // "5618/23"
  TextColumn get drawNo => text().nullable()();

  // Win status - no hit, hit or pau
  IntColumn get winStatusId => integer()();
}
