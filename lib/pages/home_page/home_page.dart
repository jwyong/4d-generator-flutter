import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lucky_generator/base/base_state.dart';
import 'package:lucky_generator/pages/home_page/module/bottom_nav_module.dart';
import 'package:lucky_generator/pages/hot_numbers_page/hot_numbers_page.dart';

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
    _vm.homeTabController = TabController(length: 4, vsync: this)..bind(this);;
    _bottomNavModule.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _HomeTabBarView(_vm),
        bottomNavigationBar: Observer(
            builder: (ctx) {
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
// disable blue animation on scroll end
        physics: const BouncingScrollPhysics(),
        controller: _vm.homeTabController,
        children: const [
          HotNumbersPage(),
          Text("tab 2"),
          Text("tab 3"),
          Text("tab 4"),
        ],
      );
}
