import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lucky_generator/base/base_state.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/generated/l10n.dart';
import 'package:lucky_generator/model/hot_number_type.dart';
import 'package:lucky_generator/pages/home_page/hot_numbers/hot_numbers_vm.dart';
import 'package:lucky_generator/pages/home_page/hot_numbers/widgets/hot_number_card.dart';
import 'package:lucky_generator/util/image_util.dart';
import 'package:lucky_generator/widget/generic_title_widget.dart';

class HotNumbersPage extends StatefulWidget {
  const HotNumbersPage({super.key});

  @override
  State<StatefulWidget> createState() => _HotNumbersPage();
}

class _HotNumbersPage extends BaseState<HotNumbersPage> {
  late final HotNumbersVM _vm = HotNumbersVM()..bind(this);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 15, left: 15, bottom: 10),
        child: StreamBuilder<List<DmcHotEntityData>>(
            stream: _vm.dmcHotListStream,
            builder: (context, snapshot) {
              final List<DmcHotEntityData>? items = snapshot.data;
              return ListView(physics: const BouncingScrollPhysics(), children: [
                // Hot numbers
                GenericTitleWidget("1234", S().hot_numbers, horizontalPadding: 5),
                Row(children: _getHotNumberCards(items)),

                // Hot numbers pau
                GenericTitleWidget("1234", S().hot_numbers_pau, horizontalPadding: 5, bgImagePath: "pau".toIconPath()),
                Row(children: _getHotNumberPauCards(items)),

                // Hot doubles
                GenericTitleWidget("11xx", S().hot_doubles, horizontalPadding: 5),
                Row(children: _getHotDoubleCards(items)),
              ]);
            }));
  }

  // Functions for getting each hot number type widget list
  List<HotNumberCard> _getHotNumberCards(List<DmcHotEntityData>? items) {
    if (items != null && items.isNotEmpty == true) {
      return items
          .where((e) => e.hotNumberTypeIndex == HotNumberType.hotNumber.index)
          .map((item) => HotNumberCard(
                title: item.number,
                subTitle: "#${item.occurrences}",
              ))
          .toList();
    } else {
      // Skeleton
      return _getSkeletons();
    }
  }

  List<HotNumberCard> _getHotNumberPauCards(List<DmcHotEntityData>? items) {
    if (items != null && items.isNotEmpty == true) {
      return items
          .where((e) => e.hotNumberTypeIndex == HotNumberType.hotNumberPau.index)
          .map((item) => HotNumberCard(
                title: item.number,
                subTitle: "#${item.occurrences}",
              ))
          .toList();
    } else {
      // Skeleton
      return _getSkeletons();
    }
  }

  List<HotNumberCard> _getHotDoubleCards(List<DmcHotEntityData>? items) {
    if (items != null && items.isNotEmpty == true) {
      return items
          .where((e) => e.hotNumberTypeIndex == HotNumberType.hotDouble.index)
          .map((item) => HotNumberCard(
                title: S().double,
                subTitle: "${item.number} (#${item.occurrences})",
              ))
          .toList();
    } else {
      // Skeleton
      return _getSkeletons();
    }
  }

  List<HotNumberCard> _getSkeletons() => [const HotNumberCard(), const HotNumberCard(), const HotNumberCard()].toList();
}
