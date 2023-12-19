import 'dart:async';

import 'package:lucky_generator/base/base_state.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/repository/universal/my_history_repo.dart';
import 'package:lucky_generator/widget/generic_filter_list_view/generic_filter_list_view.dart';
import 'package:mobx/mobx.dart';

part 'my_history_vm.g.dart';

class MyHistoryVM = AMyHistoryVM with _$MyHistoryVM;

// MyHistory items per page to fetch from DB
const myHistoryItemsPerPage = 30;

abstract class AMyHistoryVM extends BaseViewModel with Store {
  late final _myHistoryRepository = MyHistoryRepository(database);

  // Paging current page
  int _currentPage = 0;

  // Currently selected sorting - defaults to generated number, desc
  FilterItemType _currentFilterType = FilterItemType.number;
  bool _isSortingDesc = true;

  // MyHistory paged list stream
  final StreamController<List<MyHistoryEntityData>> _myHistoryListController =
      StreamController<List<MyHistoryEntityData>>.broadcast();
  Stream<List<MyHistoryEntityData>> get myHistoryListStream => _myHistoryListController.stream;

  void updateMyHistoryListStream({FilterItemType sortType = FilterItemType.number, bool isDesc = true}) {
    _currentFilterType = sortType;
    _isSortingDesc = isDesc;

    _myHistoryRepository.getMyHistoryPagedList(
        selectedModuleType, _currentFilterType, _isSortingDesc, _currentPage
    ).listen((event) {
      _myHistoryListController.add(event);
    });
  }

  // Update data list sorting when filter sorted
  void onSortItemClicked(FilterItemType sortType) {}

  void dispose() {
    _myHistoryListController.close();
  }
}
