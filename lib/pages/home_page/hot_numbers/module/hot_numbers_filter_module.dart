import 'package:flutter/material.dart';
import 'package:lucky_generator/generated/l10n.dart';
import 'package:lucky_generator/model/universal/time_period.dart';
import 'package:lucky_generator/pages/home_page/hot_numbers/hot_numbers_vm.dart';
import 'package:lucky_generator/util/dialog_util.dart';

class HotNumbersFilterModule {
  HotNumbersFilterModule(this._vm);

  final DialogUtil _dialogUtil = DialogUtil();

  final HotNumbersVM _vm;

  // Get dropdown text based on selected timePeriod
  String getDropdownText(TimePeriod selectedTimePeriod) {
    switch (selectedTimePeriod) {
      case TimePeriod.year_1:
        return S().last_year_1;

      case TimePeriod.year_2:
        return S().last_year_2;

      case TimePeriod.year_3:
        return S().last_year_3;

      case TimePeriod.year_5:
        return S().last_year_5;

      case TimePeriod.year_10:
        return S().last_year_10;

      case TimePeriod.year_15:
        return S().last_year_15;
      case TimePeriod.all:
        return S().all;
    }
  }

  // Show timePeriod selection dropdown
  void timePeriodDropdownOnTap(BuildContext context) {
    // Prep list of dropdown selection items
    final List<Widget> widgets = TimePeriod.values
        .map((e) => _DialogItem(
              label: getDropdownText(e),
              isSelected: _vm.selectedTimePeriod == e,
              onTap: () {
                // Close btmSheetDialog
                Navigator.pop(context);

                // Do vm logics
                _vm.onTimePeriodSelected(e);
              },
            ))
        .toList();

    _dialogUtil.showGenericBottomSheetDialog(context, widgets);
  }
}

class _DialogItem extends StatelessWidget {
  const _DialogItem({this.isSelected = false, required this.label, required this.onTap});

  final String label;
  final bool isSelected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          color: isSelected ? Colors.black12 : null,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal),
          ),
        ));
  }
}
