import 'package:drift/drift.dart';

import '../../type_converter/string_list_converter.dart';

/// Main dmc table with full ori data
class DmcEntity extends Table {
  IntColumn get id => integer()();
  @override
  Set<Column> get primaryKey => {id};

  // Draw details
  TextColumn get status => text().nullable()(); // "COMPLETED" | "C" etc
  DateTimeColumn get drawDate => dateTime()(); // drawDate in unix timestamp format (seconds). ori: "30/07/2023"
  TextColumn get drawNo => text().nullable()(); // "5618/23"

  /// 1+3d
  TextColumn get p1 => text().nullable()(); // Number 1 "4123"
  TextColumn get p2 => text().nullable()(); // Number 2 "5425"
  TextColumn get p3 => text().nullable()(); // Number 3 "1980"
  TextColumn get starterList => text().map(const StringListConverter()).nullable()();
  TextColumn get consolidateList => text().map(const StringListConverter()).nullable()();

  // 1+3d bonus (zodiac)
  TextColumn get zodiac3dp1 => text().nullable()(); // Number 1 "5"
  TextColumn get zodiac3dp2 => text().nullable()(); // Number 1 "4"
  TextColumn get zodiac3dp3 => text().nullable()(); // Number 1 "8"

  // Generated: full 1+3d list
  TextColumn get full4dList => text().map(const StringListConverter()).nullable()();

  /// 3+3d
  TextColumn get p13p3d => text().nullable()(); // Number 1 4d "192462"
  TextColumn get p23p3d => text().nullable()(); // Number 2 4d "975762"
  TextColumn get p33p3d => text().nullable()(); // Number 3 4d "402430"
  TextColumn get starterList3p3d => text().map(const StringListConverter()).nullable()();
  TextColumn get consolidateList3p3d => text().map(const StringListConverter()).nullable()();

  // Generated: full 3+3d list
  TextColumn get full6dList => text().map(const StringListConverter()).nullable()();
}
