import 'package:flutter/cupertino.dart';
import 'package:lucky_generator/base/base_state.dart';
import 'package:lucky_generator/generated/l10n.dart';

class PastResultsPage extends StatefulWidget {
  const PastResultsPage({super.key});

  @override
  State<StatefulWidget> createState() => _PastResultsPage();
}

class _PastResultsPage extends BaseState<PastResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(S().tab_title_past_results),
    );
  }
}
