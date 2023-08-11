import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../base/base_state.dart';

part 'home_page_vm.g.dart';

class HomePageVM = AHomePageVM with _$HomePageVM;

abstract class AHomePageVM with Store, BaseController {
  late final TabController homeTabController;

  @observable
  int currentTabIndex = 0;

  void onBottomTabItemClicked(int index) {
    homeTabController.index = index;
    currentTabIndex = index;
  }
}
