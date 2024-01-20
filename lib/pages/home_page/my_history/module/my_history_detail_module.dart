import 'package:flutter/cupertino.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/generated/l10n.dart';
import 'package:lucky_generator/pages/home_page/my_history/my_history_vm.dart';
import 'package:lucky_generator/text_style/text_styles.dart';
import 'package:lucky_generator/util/date_time_util.dart';
import 'package:lucky_generator/util/dialog_util.dart';
import 'package:lucky_generator/widget/past_results_widget/dmc/past_results_dmc_widget.dart';

class MyHistoryDetailModule {
  MyHistoryDetailModule(this._vm);

  late final DialogUtil _dialogUtil = DialogUtil();
  late final MyHistoryVM _vm;

  void onHistoryItemClicked(BuildContext context, MyHistoryEntityData item) {
    if (item.drawNo != null) {
      // Has drawNo - hit / pau, get pastResult and pass to dialog
      _vm.getPastResultForHistoryItem(item.drawNo!).then((pastResult) {
        final widgetList = [
          _buildMyHistoryRow1(item),
          _buildMyHistoryRow2(item),

          // Generated number row
          if (pastResult != null) PastResultsDmcWidget(pastResult, generatedNumber: item.number)
        ];
        _dialogUtil.showGenericBottomSheetDialog(context, widgetList,
            padding: const EdgeInsets.symmetric(horizontal: 10));
      });
    } else {
      // No drawNo - just build detail content
      _dialogUtil.showGenericBottomSheetDialog(context, [_buildMyHistoryRow1(item), _buildMyHistoryRow2(item)],
          padding: const EdgeInsets.symmetric(horizontal: 10));
    }
  }

  // Top row: generated history detail
  Widget _buildMyHistoryRow1(MyHistoryEntityData item) =>
      Text("${S().generated_number}: ${item.number}", style: TextStyles.title);

  Widget _buildMyHistoryRow2(MyHistoryEntityData item) =>
      Text("${S().date_generated}: ${item.dateGenerated.toFormattedString(ddMMMyyyyhhmmaFormat)}",
          style: TextStyles.title);
}
