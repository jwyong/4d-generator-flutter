import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/database/type_converter/int_list_converter.dart';
import 'package:path_provider/path_provider.dart';

import '../type_converter/string_list_converter.dart';

class DmcEntity extends Table {
  IntColumn get id => integer()();
  @override
  Set<Column> get primaryKey => {id};

  // Draw details
  TextColumn get status => text().nullable()(); // "COMPLETED" | "C" etc
  TextColumn get drawDate => text().nullable()(); // "30/07/2023"
  TextColumn get drawNo => text().nullable()(); // "5618/23"

  // 4d
  TextColumn get p1 => text().nullable()(); // Number 1 4d "4123"
  TextColumn get p2 => text().nullable()(); // Number 2 4d "4123"
  TextColumn get p3 => text().nullable()(); // Number 3 4d "4123"
  TextColumn get starterList => text().map(const StringListConverter()).nullable()();
  TextColumn get consolidateList => text().map(const StringListConverter()).nullable()();

  // Full lists for calculations
  TextColumn get full4dList => text().map(const StringListConverter()).nullable()();




// TextColumn get status => text().nullable()();
// TextColumn get status => text().nullable()();
// TextColumn get status => text().nullable()();

// TextColumn get content => text().named('body')();
// IntColumn get category => integer().nullable()();
}

// "p1HorseNo": "12",
// "p2HorseNo": "4",
// "p3HorseNo": "2",
// "drawNo": "5618/23",
// "starterHorseList": [
// "7",
// "9",
// "1",
// "10",
// "13",
// "3",
// "11",
// "6",
// "8",
// "5"
// ],
// "consolidateList": [
// "1221",
// "0738",
// "4105",
// "6936",
// "3699",
// "8623",
// "7989",
// "4935",
// "4092",
// "9956"
// ],
// "starterList": [
// "7814",
// "3500",
// "4745",
// "9740",
// "9230",
// "7275",
// "4610",
// "9892",
// "8848",
// "6459"
// ],
// "1+3DJackpot1": "20,132,948.30",
// "1+3DJackpot2": "210,743.90",
// "dmcJackpot1": "",
// "dmcJackpot2": "",
// "3DJackpot": "895,377.80",
// "1+3DJackpotWinning1": "1",
// "1+3DJackpotWinning2": "1",
// "3DJackpotWinning": "0",
// "dmcJackpotWinning1": "0",
// "dmcJackpotWinning2": "0",
// "drawVenue": "PERAK TURF CLUB",
// "raceDate": "22/07/2023",
// "raceNo": "11",
// "raceVenue": "AUSTRALIA",
// "p1": "2462",
// "p2": "5762",
// "p3": "2430",
// "consolidateList3p3d": [
// "471221",
// "280738",
// "604105",
// "636936",
// "353699",
// "408623",
// "007989",
// "644935",
// "084092",
// "769956"
// ],
// "starterList3p3d": [
// "077814",
// "993500",
// "324745",
// "789740",
// "349230",
// "697275",
// "974610",
// "319892",
// "518848",
// "226459"
// ],
// "p13p3d": "192462",
// "p23p3d": "975762",
// "p33p3d": "402430",
// "zodiac3dp1": "5",
// "zodiac3dp2": "4",
// "zodiac3dp3": "8",
// "3+3DBonusp1": "2,133,613.00",
// "3+3DBonusp2": "1,676,527.70",
// "3+3DBonusp3": "2,586,754.20",
// "3+3DBonusp1Winning": "2",
// "3+3DBonusp2Winning": "0",
// "3+3DBonusp3Winning": "0",
