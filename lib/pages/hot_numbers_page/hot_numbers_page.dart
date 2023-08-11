import 'package:flutter/cupertino.dart';
import 'package:lucky_generator/base/base_state.dart';

import '../../generated/l10n.dart';

class HotNumbersPage extends StatefulWidget {
  const HotNumbersPage({super.key});

  @override
  State<StatefulWidget> createState() => _HotNumbersPage();
}

class _HotNumbersPage extends BaseState<HotNumbersPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(S().tab_title_hot),
    );
  }
}