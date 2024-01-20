import 'dart:async';

import 'package:analyzer_plugin/utilities/pair.dart';
import 'package:lucky_generator/base/base_state.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/model/universal/module_type.dart';
import 'package:lucky_generator/repository/dmc_repo.dart';
import 'package:lucky_generator/repository/universal/my_history_repo.dart';
import 'package:lucky_generator/util/my_history_util.dart';
import 'package:lucky_generator/widget/generic_filter_list_view/generic_filter_list_view.dart';
import 'package:mobx/mobx.dart';

part 'my_history_vm.g.dart';

class MyHistoryVM = AMyHistoryVM with _$MyHistoryVM;

// MyHistory items per page to fetch from DB
const myHistoryItemsPerPage = 30;

abstract class AMyHistoryVM extends BaseViewModel with Store {
  late final MyHistoryRepository _myHistoryRepository = MyHistoryRepository(database);
  late final DmcRepository _dmcRepository = DmcRepository(database);
  late final MyHistoryUtil _myHistoryUtil = MyHistoryUtil();

  /// Paging related
  // Paging current page
  int _currentPage = 0;

  /// Sorting related
  // Currently selected sorting - defaults to generated number, desc
  FilterItemType _currentFilterType = FilterItemType.number;
  bool _isSortingDesc = true;

  /// History list related
  // MyHistory paged list stream
  final StreamController<List<MyHistoryEntityData>> _myHistoryListController =
  StreamController<List<MyHistoryEntityData>>();

  Stream<List<MyHistoryEntityData>> get myHistoryListStream => _myHistoryListController.stream;

  // Observe when moduleType changed (dmc, toto, etc)
  @override
  void onModuleTypeChanged(ModuleType moduleType) {
    super.onModuleTypeChanged(moduleType);
    updateMyHistoryListStream();
  }

  // Sync latest results with myHistory list in DB
  void syncMyHistoryWithLatestResults({ModuleType? moduleType}) async {
    // Get myHistory list without win status and not expired yet
    final List<MyHistoryEntityData> unwonHistoryList =
    await _myHistoryRepository.getUnwonHistoryList(moduleType?? selectedModuleType);

    // Get list of past results up to earliest generated number in myHistory list
    final MyHistoryEntityData? earliestUnwonItem = unwonHistoryList.lastOrNull;
    if (earliestUnwonItem == null) return;
    final List<Pair<String, String>> pastResultsList =
    await _dmcRepository.getDmc4dFlatPairListSinceDate(earliestUnwonItem.dateGenerated);

    // Map a list new historyEntity data items with hit / pau statuses
    final hitOrPauList = _myHistoryUtil.getHitOrPauList(unwonHistoryList, pastResultsList);

    // Bulk insert hit / pau list to MyHistory DB
    _myHistoryRepository.insertMyHistoryList(hitOrPauList);
  }

  // Update history list stream with new params
  void updateMyHistoryListStream({FilterItemType sortType = FilterItemType.number, bool isDesc = true}) {
    _currentFilterType = sortType;
    _isSortingDesc = isDesc;

    _myHistoryRepository
        .getMyHistoryPagedList(selectedModuleType, _currentFilterType, _isSortingDesc, _currentPage)
        .listen((event) {
      _myHistoryListController.add(event);
    });
  }

  /// My history detail related
  // Get a pastResult item for a history item (which pastResult got hit / pau for this generated history number)
  Future<DmcEntityData?> getPastResultForHistoryItem(String drawNo) =>_dmcRepository.getPastResultForDrawNo(drawNo);

  void dispose() {
    _myHistoryListController.close();
  }
}
