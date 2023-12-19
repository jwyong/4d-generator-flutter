import 'package:flutter/material.dart';
import 'package:lucky_generator/widget/generate_number_dialog/generate_number_dialog.dart';
import 'package:mobx/mobx.dart';

import '../../base/base_state.dart';

part 'home_page_vm.g.dart';

class HomePageVM = AHomePageVM with _$HomePageVM;

abstract class AHomePageVM extends BaseViewModel with Store {
  late final TabController homeTabController;

  @observable
  int currentTabIndex = 0;

  void onBottomTabItemClicked(int index) {
    homeTabController.index = index;
    currentTabIndex = index;
  }

  void generateBtnOnClick(BuildContext context) {
    showDialog(context: context, builder: (ctx) => const GenerateNumberDialog());
  }
}
