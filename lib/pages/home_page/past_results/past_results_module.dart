import 'package:flutter/material.dart';
import 'package:lucky_generator/constant/constants.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/util/date_time_util.dart';

class PastResultsModule {
  Widget buildPastResultsPageWidget(DmcEntityData item, int index) {
    // Show empty space on first item in list if there are still previous items to be loaded
    if (index == 0 && item.drawNo != dmcFirstDrawNo) return const SizedBox.shrink();

    final drawNo = item.drawNo;
    final drawDate = item.drawDate.toFormattedString(ddMMMyyyyhhmmaFormat);

    return Text("$drawNo | $drawDate");
  }
}