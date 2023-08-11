import 'package:flutter/cupertino.dart';
import 'package:lucky_generator/base/base_state.dart';
import 'package:lucky_generator/generated/l10n.dart';
import 'package:lucky_generator/pages/home_page/hot_numbers/hot_numbers_vm.dart';

class HotNumbersPage extends StatefulWidget {
  const HotNumbersPage({super.key});

  @override
  State<StatefulWidget> createState() => _HotNumbersPage();
}

class _HotNumbersPage extends BaseState<HotNumbersPage> {
  late final HotNumbersVM _vm = HotNumbersVM()..bind(this);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

      ]
    );
  }
}