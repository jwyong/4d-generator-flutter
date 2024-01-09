import 'package:flutter/material.dart';
import 'package:lucky_generator/base/base_stateless_widget.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/util/date_time_util.dart';
import 'package:lucky_generator/util/image_util.dart';
import 'package:lucky_generator/widget/dmc/dmc_generic_round_bg.dart';

class PastResultsDmcWidget extends BaseStatelessWidget {
  PastResultsDmcWidget(this.item, {super.key});

  final DmcEntityData item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeaderText(),
        _build4dHeader(),
        _buildTop3List()
      ],
    );
  }

  // draw date: 20/12/2023 (Wed) | draw no.: 5681/23
  Widget _buildHeaderText() =>
      RichText(
        text: TextSpan(
          children: [
            // Draw date
            TextSpan(text: s.draw_date),
            TextSpan(
              text: item.drawDate.toFormattedString(ddMMyyyyEEEFormat),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),

            // Draw no.
            TextSpan(text: " | ${s.draw_no}: "),
            TextSpan(
              text: item.drawNo,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );

  // 4d title
  Widget _build4dHeader() =>
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image(image: AssetImage('dmc_1plus3d'.toImgPath())),
          Image(image: AssetImage('dmc_super_1plus3d'.toImgPath())),
        ],
      );

  // 1st - 3rd prize list
  Widget _buildTop3List() =>
      Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildTop3Item(item.p1 ?? ''),
          _buildTop3Item(item.p2 ?? ''),
          _buildTop3Item(item.p3 ?? '')
        ],
      );

  // Top 3 item
  Widget _buildTop3Item(String label) =>
      Expanded(child: Column(
          children: [
            DmcGenericRoundBg(child: Text(
                label, style: const TextStyle(color: Colors.white)))
          ]
      ));
}