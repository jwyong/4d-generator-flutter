import 'package:flutter/cupertino.dart';
import 'package:lucky_generator/generated/l10n.dart';
import 'package:lucky_generator/pages/home_page/base_home_state.dart';

class MyHistoryPage extends StatefulWidget {
  const MyHistoryPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHistoryPage();
}

class _MyHistoryPage extends BaseHomeState<MyHistoryPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: Text(S().tab_title_my_history),
    );
  }
}
