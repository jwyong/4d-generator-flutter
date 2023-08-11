import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lucky_generator/pages/home_page/home_page_vm.dart';

import '../../../generated/l10n.dart';

class BottomNavModule {
  const BottomNavModule(this._vm);

  final HomePageVM _vm;

  // TODO: JAY_LOG - include slop UX
  void init() {
    final tabController = _vm.homeTabController;
    bool swipeIsInProgress = false;
    bool tapIsBeingExecuted = false;
    int prevIndex = 1;

    tabController.animation?.addListener(() {
      if (!tapIsBeingExecuted &&
          !swipeIsInProgress &&
          (tabController.offset >= 0.5 || tabController.offset <= -0.5)) {
        // detects if a swipe is being executed. limits set to 0.5 and -0.5 to make sure the swipe gesture triggered
        int newIndex =
            tabController.offset > 0 ? tabController.index + 1 : tabController.index - 1;
        swipeIsInProgress = true;
        prevIndex = _vm.currentTabIndex;
        _vm.currentTabIndex = newIndex;
      } else {
        if (!tapIsBeingExecuted &&
            swipeIsInProgress &&
            ((tabController.offset < 0.5 && tabController.offset > 0) ||
                (tabController.offset > -0.5 && tabController.offset < 0))) {
          // detects if a swipe is being reversed
          swipeIsInProgress = false;
          _vm.currentTabIndex = prevIndex;
        }
      }
    });

    tabController.addListener(() {
      swipeIsInProgress = false;
      _vm.currentTabIndex = tabController.index;

      if (tapIsBeingExecuted == true) {
        tapIsBeingExecuted = false;
      } else {
        if (tabController.indexIsChanging) {
          // this is only true when the tab is changed via tap
          tapIsBeingExecuted = true;
        }
      }
    });
  }

  // BottomNav bar
  List<BottomNavigationBarItem> getHomeTabItems() => <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          activeIcon: const Icon(Icons.local_fire_department),
          icon: const Icon(Icons.local_fire_department_outlined),
          label: S().tab_title_hot,
        ),
        BottomNavigationBarItem(
          activeIcon: const Icon(Icons.analytics),
          icon: const Icon(Icons.analytics_outlined),
          label: S().tab_title_analytics,
        ),
        BottomNavigationBarItem(
          activeIcon: const Icon(Icons.featured_play_list_rounded),
          icon: const Icon(Icons.featured_play_list_outlined),
          label: S().tab_title_past_results,
        ),
        BottomNavigationBarItem(
          activeIcon: const Icon(Icons.history_rounded),
          icon: const Icon(Icons.history_outlined),
          label: S().tab_title_my_history,
        ),
      ];
}
