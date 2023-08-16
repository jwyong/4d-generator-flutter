import 'package:firebase_database/firebase_database.dart';
import 'package:lucky_generator/constant/constants.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/util/date_time_util.dart';
import 'package:lucky_generator/util/number_util.dart';

class RealtimeDatabaseRepository {
  // Init database refs for firebase rtDB
  Future<List<Object?>?> getDmcDatabase() async {
    try {
      final dmc = await FirebaseDatabase.instance.ref(realtimeDbKeyDMC).get();
      if (dmc.exists) {
        return dmc.value as List<Object?>;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  // Map dmc realtimeDB to driftDB object
  List<DmcEntityData> getDmcEntityListFromObject(List<Object?>? value) {
    if (value != null) {
      final dmcList = List<DmcEntityData>.from(value.map((e) {
        // Convert realtimeDb object to map
        final objectMap = e as Map<Object?, Object?>;

        // Convert drawDate to DateTime obj
        final drawDate = objectMap['drawDate'].toDateTimeInddMMyyyy();

        // Get all 4d numbers and lists
        final p1 = objectMap['p1'].toString();
        final p2 = objectMap['p2'].toString();
        final p3 = objectMap['p3'].toString();
        final starterList =
            (objectMap['starterList'] as List<dynamic>).map((e) => e.toString()).toList();
        final consolidateList =
            (objectMap['consolidateList'] as List<dynamic>).map((e) => e.toString()).toList();

        // Combine list to form full4dList
        final full4dList = starterList + consolidateList;
        full4dList
          ..add(p1)
          ..add(p2)
          ..add(p3);

        // Get all 3+3d numbers and lists (can be null
        final p13p3d = objectMap['p13p3d']?.toString();
        final p23p3d = objectMap['p23p3d']?.toString();
        final p33p3d = objectMap['p33p3d']?.toString();
        final starterList3p3d =
            (objectMap['starterList3p3d'] as List<dynamic>?)?.map((e) => e.toString()).toList();
        final consolidateList3p3d =
            (objectMap['consolidateList3p3d'] as List<dynamic>?)?.map((e) => e.toString()).toList();

        // Combine list to form full4dList
        final full6dList = List<String>.empty(growable: true);
        if (starterList3p3d != null) full6dList.addAll(starterList3p3d);
        if (consolidateList3p3d != null) full6dList.addAll(consolidateList3p3d);
        if (p13p3d != null) full6dList.add(p13p3d);
        if (p23p3d != null) full6dList.add(p23p3d);
        if (p33p3d != null) full6dList.add(p33p3d);

        // Map objects map to correct String / int map
        final dmcEntityData = DmcEntityData(
            id: objectMap['id'].toString().toIntOrNull() ?? -1,
            status: objectMap['status'].toString(),
            drawDate: drawDate,
            drawNo: objectMap['drawNo'].toString(),
            p1: p1,
            p2: p2,
            p3: p3,
            starterList: starterList,
            consolidateList: consolidateList,
            zodiac3dp1: objectMap['zodiac3dp1'].toString(),
            zodiac3dp2: objectMap['zodiac3dp2'].toString(),
            zodiac3dp3: objectMap['zodiac3dp3'].toString(),
            full4dList: full4dList,
            p13p3d: p13p3d,
            p23p3d: p23p3d,
            p33p3d: p33p3d,
            starterList3p3d: starterList3p3d,
            consolidateList3p3d: consolidateList3p3d,
            full6dList: full6dList);

        return dmcEntityData;
      }));

      return dmcList;
    }
    return List.empty();
  }
}
