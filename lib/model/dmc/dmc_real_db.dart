import 'package:json_annotation/json_annotation.dart';
import 'package:lucky_generator/util/number_util.dart';

part 'dmc_real_db.g.dart';

@JsonSerializable()
class DmcRealDb {
  DmcRealDb(this.id, this.p1, this.p2, this.p3, this.status, this.drawDate, this.drawNo,
      this.starterList, this.consolidateList,
      {this.full4dList});

  // DmcRealDb({
  //   required this.id, required this.p1, required this.p2, required this.p3
  // });

  final int id;
  final int? p1, p2, p3;

  final String? status, drawDate, drawNo;

  final List<int?>? starterList, consolidateList, full4dList;

  factory DmcRealDb.fromJson(Map<String, dynamic> json) => DmcRealDb(
      json['id'].toString().toIntOrNull() ?? -1,
      // Fallback to -1 for id
      json['p1'].toString().toIntOrNull(),
      json['p2'].toString().toIntOrNull(),
      json['p3'].toString().toIntOrNull(),
      json['status'].toString(),
      json['drawDate'].toString(),
      json['drawNo'].toString(),
      (json['starterList'] as List<dynamic>).map((e) => e.toString().toIntOrNull()).toList(),
      (json['consolidateList'] as List<dynamic>).map((e) => e.toString().toIntOrNull()).toList());

  Map<String, dynamic> toJson() => _$DmcRealDbToJson(this);

  @override
  String toString() {
    return 'DmcRealDb {id: $id, p1: $p1, p2: $p2, p3: $p3, status: $status, drawDate: $drawDate, drawNo: $drawNo, starterList: $starterList, consolidateList: $consolidateList, full4dList: $full4dList}';
  }

// IntColumn get id => integer()();
//
// // Draw details
// TextColumn get status => text().nullable()(); // "COMPLETED" | "C" etc
// TextColumn get drawDate => text().nullable()(); // "30/07/2023"
// TextColumn get drawNo => text().nullable()(); // "5618/23"
//
// // 4d
// IntColumn get p1 => integer().nullable()(); // Number 1 4d "4123"
// IntColumn get p2 => integer().nullable()(); // Number 2 4d "4123"
// IntColumn get p3 => integer().nullable()(); // Number 3 4d "4123"
// TextColumn get starterList => text().map(const IntListConverter()).nullable()();
// TextColumn get consolidateList => text().map(const IntListConverter()).nullable()();
//
// // Full lists for calculations
// TextColumn get full4dList => text().map(const IntListConverter()).nullable()();

  /// The generated code assumes these values exist in JSON.
// final String firstName, lastName;
//
// /// The generated code below handles if the corresponding JSON value doesn't
// /// exist or is empty.
// final DateTime? dateOfBirth;

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
//
// /// Connect the generated [_$PersonToJson] function to the `toJson` method.
}
