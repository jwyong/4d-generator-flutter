import 'package:analyzer_plugin/utilities/pair.dart';
import 'package:collection/collection.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/model/universal/history/history_win_status.dart';
import 'package:lucky_generator/util/number_util.dart';

class MyHistoryUtil {
  // Get a list of MyHistoryEntityData with status of hit or pau
  List<MyHistoryEntityData> getHitOrPauList(
      List<MyHistoryEntityData> unwonHistoryList, List<Pair<String, String>> pastResultsList) {
    List<MyHistoryEntityData> hitOrPauList = List.empty(growable: true);
    for (var unwonItem in unwonHistoryList) {
      Pair<String, String>? hitPair = pastResultsList.firstWhereOrNull((pair) => pair.last == unwonItem.number);
      if (hitPair != null) {
        // Exact match - update as "hit" and add to list
        hitOrPauList.add(MyHistoryEntityData(
            id: unwonItem.id,
            moduleTypeId: unwonItem.moduleTypeId,
            dateGenerated: unwonItem.dateGenerated,
            number: unwonItem.number,
            drawNo: hitPair.first,
            winStatusId: HistoryWinStatus.hit.id));
      } else {
        // Not hit - check for pau
        Pair<String, String>? pauPair =
            pastResultsList.firstWhereOrNull((pair) => arePermutations(pair.last, unwonItem.number));

        // Add to list if pau
        if (pauPair != null) {
          hitOrPauList.add(MyHistoryEntityData(
              id: unwonItem.id,
              moduleTypeId: unwonItem.moduleTypeId,
              dateGenerated: unwonItem.dateGenerated,
              number: unwonItem.number,
              drawNo: pauPair.first,
              winStatusId: HistoryWinStatus.pau.id));
        }
      }
    }

    return hitOrPauList;
  }
}
