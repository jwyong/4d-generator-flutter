import 'package:flutter/material.dart';
import 'package:lucky_generator/constant/constants.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/widget/past_results_widget/dmc/past_results_dmc_widget.dart';

class PastResultsModule {
  Widget buildPastResultsPageWidget(DmcEntityData item, int index) {
    // Show empty space on first item in list if there are still previous items to be loaded
    if (index == 0 && item.drawNo != dmcFirstDrawNo) return const SizedBox.shrink();

    // TODO: JAY_LOG - how to differentiate between moduleTypes? DMC / TOTO etc
    return SingleChildScrollView(child: PastResultsDmcWidget(item));
  }
}
