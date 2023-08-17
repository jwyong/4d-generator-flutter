import 'package:flutter/cupertino.dart';
import 'package:lucky_generator/base/base_state.dart';
import 'package:lucky_generator/generated/l10n.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<StatefulWidget> createState() => _AnalyticsPage();
}

class _AnalyticsPage extends BaseState<AnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(S().tab_title_analytics),
    );
  }
}