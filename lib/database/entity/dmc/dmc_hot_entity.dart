import 'package:drift/drift.dart';

/// Hot numbers, doubles, triples table. Mainly for "hot tabs" display use. This table needs to be
/// recalculated everytime the main dmcEntity table is updated from web.
class DmcHotEntity extends Table {
  // Primary key (recognised by default due to autoIncrement)
  IntColumn get id => integer().autoIncrement()();

  // Number: can be combination of 4d, 6d, or a single digit for hotDoubles / triples.
  TextColumn get number => text()(); // "0253" | "049301" | "6" etc
  IntColumn get occurrences => integer()(); // 11 | 0 | 3054

  // drawDate in unix timestamp format (seconds). ori: "30/07/2023"
  DateTimeColumn get drawDate => dateTime().nullable()(); // 143252356 etc

  // Index of HotNumberType enum
  IntColumn get hotNumberTypeIndex => integer()(); // 1 | 2 | 3 etc

  // Index of TimePeriod enum (1 year, 2 year, 3 year...)
  IntColumn get timePeriodIndex => integer()(); // 1 | 2 | 3 etc
}