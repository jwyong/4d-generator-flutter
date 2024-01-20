import 'package:flutter/material.dart';
import 'package:lucky_generator/base/base_stateless_widget.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/text_style/dmc_text_styles.dart';
import 'package:lucky_generator/util/date_time_util.dart';
import 'package:lucky_generator/util/image_util.dart';
import 'package:lucky_generator/util/list_util.dart';
import 'package:lucky_generator/util/number_util.dart';
import 'package:lucky_generator/util/string_util.dart';
import 'package:lucky_generator/widget/dmc/dmc_generic_round_bg.dart';

class PastResultsDmcWidget extends BaseStatelessWidget {
  PastResultsDmcWidget(this.item, {super.key, this.generatedNumber});

  final DmcEntityData item;

  // The generated history number which got hit / pau
  final String? generatedNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 5),
        _buildHeaderText(context),
        const SizedBox(height: 15),
        _build4dHeader(),
        const SizedBox(height: 10),
        _buildTop3List(),
        const SizedBox(height: 15),
        _buildStarterConsolationRow(),
        const SizedBox(height: 10)
      ],
    );
  }

  /// Draw date: 20/12/2023 (Wed) | draw no.: 5681/23
  Widget _buildHeaderText(BuildContext context) {
    final drawDate = item.drawDate.toFormattedString(ddMMyyyyEEEFormat);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyMedium,
          children: [
            // Draw date
            TextSpan(text: "${s.draw_date} : "),
            TextSpan(
              text: drawDate,
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
      ),
    );
  }

  /// Image titles (1+3D, SUPER 1+3D)
  Widget _build4dHeader() => Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            flex: 1,
            child: Image(image: AssetImage('dmc_1plus3d'.toImgPath()), height: 30),
          ),
          Flexible(
            flex: 1,
            child: Image(image: AssetImage('dmc_super_1plus3d'.toImgPath()), height: 30),
          ),
        ],
      );

  /// 1st - 3rd prize list
  Widget _buildTop3List() => Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildTop3Item(s.first_prize, item.p1.orEmpty()),
          _buildTop3Item(s.second_prize, item.p2.orEmpty()),
          _buildTop3Item(s.third_prize, item.p3.orEmpty())
        ],
      );

  // Top 3 item
  Widget _buildTop3Item(String label, String value) => Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        // Pill-shaped title
        DmcGenericRoundBg(child: Text(label, style: DmcTextStyles.pastResultsTitle, textAlign: TextAlign.center)),
        const SizedBox(height: 3),

        // Number
        _buildNumberRow(value),
      ]));

  /// Starter + consolation prizes row
  Widget _buildStarterConsolationRow() => Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildStarterConsolationColumn(s.starter_prize, item.starterList.orEmpty()),
          _buildStarterConsolationColumn(s.consolation_prize, item.consolidateList.orEmpty()),
        ],
      );

  // Starter / consolation column
  Widget _buildStarterConsolationColumn(String title, List<String> list) {
    // Split full list to 5 items
    final list1 = list.take(5).toList();
    final list2 = list.sublist(5).toList();
    return Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      // Pill-shaped title
      DmcGenericRoundBg(child: Text(title, style: DmcTextStyles.pastResultsTitle, textAlign: TextAlign.center)),
      const SizedBox(height: 3),

      // List
      Row(
        children: [_buildStartConsolationItem(list1), _buildStartConsolationItem(list2)],
      )
    ]));
  }

  // Starter / column item
  Widget _buildStartConsolationItem(List<String> list) =>
      Expanded(child: Column(children: list.map((e) => _buildNumberRow(e)).toList()));

  // Build number row with prefix hit / pau icon if applicable
  Widget _buildNumberRow(String value) {
    final prefixIcon = _getHitOrPauIcon(value);
    final textWidget = Text(value, style: DmcTextStyles.pastResultsBody, textAlign: TextAlign.center);
    return prefixIcon == null
        ? textWidget
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [prefixIcon, const SizedBox(width: 5), textWidget],
          );
  }

  Widget? _getHitOrPauIcon(String value) {
    if (generatedNumber == null) {
      // No number - null
      return null;
    } else if (generatedNumber == value) {
      // Hit
      return const Icon(Icons.star, size: 20);
    } else if (arePermutations(generatedNumber!, value)) {
      // Pau
      return Image.asset("pau".toIconPath(), height: 25);
    } else {
      // No match - null
      return null;
    }
  }
}
