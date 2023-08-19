import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/generated/l10n.dart';
import 'package:lucky_generator/model/hot_number_type.dart';
import 'package:lucky_generator/pages/home_page/hot_numbers/widget/hot_number_card.dart';

class HotNumberCardsModule {
  /// Hot numbers
  List<HotNumberCard> getHotNumberCards(List<DmcHotEntityData>? items) {
    if (items != null && items.isNotEmpty == true) {
      return items
          .where((e) => e.hotNumberTypeIndex == HotNumberType.hotNumber.index)
          .map((item) => HotNumberCard(
                title: item.number,
                subTitle: "#${item.occurrences}",
                rearTitle: item.number,
                rearLabelsList: _getHotNumberDrawDates(items, item.number),
              ))
          .toList();
    } else {
      // Skeleton
      return _getSkeletons();
    }
  }

  // Exact drawDate of a hotNumber
  List<String> _getHotNumberDrawDates(List<DmcHotEntityData> items, String number) => items
          .where((element) =>
              element.hotNumberTypeIndex == HotNumberType.hotNumberDrawDate.index && element.parentNumber == number)
          .map((e) {
        final drawDate = e.drawDate;

        // dd/MM/yyyy
        return "${drawDate?.day}/${drawDate?.month}/${drawDate?.year}";
      }).toList();

  /// Hot numbers pau
  List<HotNumberCard> getHotNumberPauCards(List<DmcHotEntityData>? items) {
    if (items != null && items.isNotEmpty == true) {
      return items
          .where((e) => e.hotNumberTypeIndex == HotNumberType.hotNumberPau.index)
          .map((item) => HotNumberCard(
              title: item.number,
              subTitle: "#${item.occurrences}",
              rearLabelsList: _getHotOccurrenceStringList(HotNumberType.hotNumberPauOccurrence, items, item.number)))
          .toList();
    } else {
      // Skeleton
      return _getSkeletons();
    }
  }

  /// Hot doubles
  List<HotNumberCard> getHotDoubleCards(List<DmcHotEntityData>? items) {
    if (items != null && items.isNotEmpty == true) {
      return items
          .where((e) => e.hotNumberTypeIndex == HotNumberType.hotDouble.index)
          .map((item) => HotNumberCard(
                title: S().double,
                subTitle: "${item.number} (#${item.occurrences})",
                rearLabelsList: _getHotOccurrenceStringList(HotNumberType.hotDoubleOccurrence, items, item.number),
              ))
          .toList();
    } else {
      // Skeleton
      return _getSkeletons();
    }
  }

  /// Hot triples
  List<HotNumberCard> getHotTripleCards(List<DmcHotEntityData>? items) {
    if (items != null && items.isNotEmpty == true) {
      return items
          .where((e) => e.hotNumberTypeIndex == HotNumberType.hotTriple.index)
          .map((item) => HotNumberCard(
                title: S().triple,
                subTitle: "${item.number} (#${item.occurrences})",
                rearLabelsList: _getHotOccurrenceStringList(HotNumberType.hotTripleOccurrence, items, item.number),
              ))
          .toList();
    } else {
      // Skeleton
      return _getSkeletons();
    }
  }

  // Occurrences list string: <number> #<occurrences> (for card rear)
  List<String> _getHotOccurrenceStringList(
          HotNumberType hotNumberType, List<DmcHotEntityData> items, String parentNumber) =>
      items
          .where((element) => element.hotNumberTypeIndex == hotNumberType.index && element.parentNumber == parentNumber)
          .map((e) => "${e.number} #${e.occurrences}")
          .toList();

  /// Skeleton (3 cards)
  List<HotNumberCard> _getSkeletons() => [const HotNumberCard(), const HotNumberCard(), const HotNumberCard()].toList();
}
