import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lucky_generator/constant/constants.dart';
import 'package:lucky_generator/pages/home_page/base_home_state.dart';
import 'package:lucky_generator/pages/home_page/past_results/past_results_module.dart';
import 'package:lucky_generator/pages/home_page/past_results/past_results_page_vm.dart';
import 'package:lucky_generator/text_style/text_styles.dart';
import 'package:lucky_generator/widget/generic_paging_page_view/generic_paging_page_view.dart';

class PastResultsPage extends StatefulWidget {
  const PastResultsPage({super.key});

  @override
  State<StatefulWidget> createState() => _PastResultsPageState();
}

class _PastResultsPageState extends BaseHomeState<PastResultsPage> {
  late final _vm = PastResultsPageVM()..bind(this);

  late final _pastResultsModule = PastResultsModule();

  @override
  void initState() {
    super.initState();

    // TODO: JAY_LOG - init for a particular drawNo
    _vm.initPastResultsStream();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        // Title
        Text(s.tab_title_past_results, style: TextStyles.title,),

        // TODO: JAY_LOG - switch widget according to moduleType
        // PageView
        _buildContentPageView()
      ],
    );
  }

  Widget _buildContentPageView() {
    return Expanded(
      child: Observer(
        builder: (ctx) => _vm.pastResultsStream == null
            ? const Text("Empty")
            : GenericPagingPageView(
                dataStream: _vm.pastResultsStream,
                dataId: _vm.initialDrawNo,
                setInitialPageCallback: _vm.setInitialPage,
                firstItemId: dmcFirstDrawNo,
                onPreviousPaging: _vm.onPreviousPaging,
                onNextPaging: _vm.onNextPaging,
                itemBuilder: _pastResultsModule.buildPastResultsPageWidget,
                fetchCount: pastResultsFetchCount,
              ),
      ),
    );
  }
}
