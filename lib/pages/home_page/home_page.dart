import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lucky_generator/base/base_state.dart';
import 'package:lucky_generator/constant/constants.dart';
import 'package:lucky_generator/pages/home_page/analytics/analytics_page.dart';
import 'package:lucky_generator/pages/home_page/hot_numbers/hot_numbers_page.dart';
import 'package:lucky_generator/pages/home_page/module/bottom_nav_module.dart';
import 'package:lucky_generator/pages/home_page/my_history/my_history_page.dart';
import 'package:lucky_generator/pages/home_page/past_results/past_results_page.dart';

import 'home_page_vm.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> with SingleTickerProviderStateMixin {
  late final HomePageVM _vm = HomePageVM()..bind(this);

  // Tab bar + bottom nav bar
  late final BottomNavModule _bottomNavModule = BottomNavModule(_vm);

  @override
  void initState() {
    _vm.homeTabController = TabController(length: 4, vsync: this)..bind(this);
    _bottomNavModule.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: Stack(
            children: [
              Container(
                color: Colors.redAccent,
                child: const Text(dmcShort),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 20,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                  ))
            ],
          ),
        ),
        body: _HomeTabBarView(_vm),
        floatingActionButton: FloatingActionButton.small(
            elevation: 0,
            backgroundColor: Colors.yellowAccent,
            onPressed: () {
              _vm.generateBtnOnClick(context);
            },
            child: const Icon(Icons.adb)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Observer(builder: (ctx) {
          return BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: _bottomNavModule.getHomeTabItems(),
            currentIndex: _vm.currentTabIndex,
            type: BottomNavigationBarType.fixed,
            onTap: _vm.onBottomTabItemClicked,

            // selectedFontSize: textTheme.caption!.fontSize!,
            // unselectedFontSize: textTheme.caption!.fontSize!,
            // selectedItemColor: colorScheme.onPrimary,
            // unselectedItemColor: colorScheme.onPrimary.withOpacity(0.38),
            // backgroundColor: grey1,
          );
        }));
    // ));
  }
}

class _HomeTabBarView extends StatelessWidget {
  const _HomeTabBarView(this._vm);

  final HomePageVM _vm;

  @override
  Widget build(BuildContext context) => TabBarView(
        physics: const BouncingScrollPhysics(),
        controller: _vm.homeTabController,
        children: const [HotNumbersPage(), AnalyticsPage(), PastResultsPage(), MyHistoryPage()],
      );
}
