import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/generated/l10n.dart';
import 'package:lucky_generator/pages/home_page/base_home_state.dart';
import 'package:lucky_generator/pages/home_page/hot_numbers/hot_numbers_vm.dart';
import 'package:lucky_generator/pages/home_page/hot_numbers/module/hot_numbers_card_module.dart';
import 'package:lucky_generator/pages/home_page/hot_numbers/module/hot_numbers_filter_module.dart';
import 'package:lucky_generator/util/image_util.dart';
import 'package:lucky_generator/widget/generic_dropdown.dart';
import 'package:lucky_generator/widget/generic_title_widget.dart';

class HotNumbersPage extends StatefulWidget {
  const HotNumbersPage({super.key});

  @override
  State<StatefulWidget> createState() => _HotNumbersPage();
}

class _HotNumbersPage extends BaseHomeState<HotNumbersPage> {
  late final HotNumbersVM _vm = HotNumbersVM()..bind(this);

  late final HotNumberCardsModule _hotNumberCardsModule = HotNumberCardsModule();
  late final HotNumbersFilterModule _hotNumbersFilterModule = HotNumbersFilterModule(_vm);

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Padding(
        padding: const EdgeInsets.only(right: 15, left: 15, bottom: 10),
        child: StreamBuilder<List<DmcHotEntityData>>(
            stream: _vm.dmcHotListStream,
            builder: (context, snapshot) {
              final List<DmcHotEntityData>? items = snapshot.data;
              return ListView(physics: const BouncingScrollPhysics(), children: [
                // Options row
                Row(
                  children: [
                    // Top 3 / all prizes dropdown
                    // TODO: JAY_LOG
                    GenericDropdown(title: "Top 3"),

                    const Spacer(),

                    // TimePeriod dropdown
                    Observer(
                        builder: (ctx) =>
                            GenericDropdown(
                              title: _hotNumbersFilterModule.getDropdownText(_vm.selectedTimePeriod),
                              iconData: Icons.access_time_outlined,
                              onTap: () {
                                _hotNumbersFilterModule.timePeriodDropdownOnTap(ctx);
                              },
                            ))
                  ],
                ),
                const SizedBox(height: 10),

                // Hot numbers
                GenericTitleWidget("1234", S().hot_numbers, horizontalPadding: 5),
                Row(children: _hotNumberCardsModule.getHotNumberCards(items)),
                const SizedBox(height: 15),

                // Hot numbers pau
                GenericTitleWidget("1234", S().hot_numbers_pau, horizontalPadding: 5, bgImagePath: "pau".toIconPath()),
                Row(children: _hotNumberCardsModule.getHotNumberPauCards(items)),
                const SizedBox(height: 15),

                // Hot doubles
                GenericTitleWidget("11xx", S().hot_doubles, horizontalPadding: 5),
                Row(children: _hotNumberCardsModule.getHotDoubleCards(items)),
                const SizedBox(height: 15),

                // Hot triples
                GenericTitleWidget("111x", S().hot_triples, horizontalPadding: 5),
                Row(children: _hotNumberCardsModule.getHotTripleCards(items)),
                const SizedBox(height: 15)
              ]);
            }));
  }
}
