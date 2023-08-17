import 'package:flutter/cupertino.dart';
import 'package:lucky_generator/base/base_state.dart';
import 'package:lucky_generator/generated/l10n.dart';

class MyHistoryPage extends StatefulWidget {
  const MyHistoryPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHistoryPage();
}

class _MyHistoryPage extends BaseState<MyHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(S().tab_title_my_history),
    );
  }
}