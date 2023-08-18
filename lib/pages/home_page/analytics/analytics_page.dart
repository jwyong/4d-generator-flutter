import 'package:flutter/cupertino.dart';
import 'package:lucky_generator/generated/l10n.dart';
import 'package:lucky_generator/pages/home_page/base_home_state.dart';

class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({super.key});

  @override
  State<StatefulWidget> createState() => _AnalyticsPage();
}

class _AnalyticsPage extends BaseHomeState<AnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Center(
      child: Text(S().tab_title_analytics),
    );
  }
}