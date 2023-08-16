import 'package:flutter/cupertino.dart';
import 'package:lucky_generator/base/base_state.dart';
import 'package:lucky_generator/database/my_database.dart';
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
    return StreamBuilder<List<DmcHotEntityData>>(
        stream: _vm.dmcHotListStream,
        builder: (context, snapshot) {
      final List<DmcHotEntityData>? items = snapshot.data;

      return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: items?.length,
          itemBuilder: (context, index) {
            final DmcHotEntityData? item = items?[index];

            return Text("type: ${item?.hotNumberTypeIndex}, number: ${item?.number}, occurrence: ${item?.occurrences}");
          });

      //   Column(
      //   children: [
      //
      //   ]
      // );
    });
  }
}
