import 'package:flutter/cupertino.dart';
import 'package:lucky_generator/generated/l10n.dart';
import 'package:lucky_generator/pages/home_page/base_home_state.dart';

class PastResultsPage extends StatefulWidget {
  const PastResultsPage({super.key});

  @override
  State<StatefulWidget> createState() => _PastResultsPage();
}

class _PastResultsPage extends BaseHomeState<PastResultsPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Center(
      child: Text(S().tab_title_past_results),
    );
  }
}
