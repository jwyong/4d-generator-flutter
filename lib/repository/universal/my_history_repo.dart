import 'package:lucky_generator/database/dao/universal/my_history_dao.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/model/universal/module_type.dart';
import 'package:lucky_generator/widget/generic_filter_list_view/generic_filter_list_view.dart';

class MyHistoryRepository {
  MyHistoryRepository(this._db);

  final MyDatabase _db;
  late final MyHistoryDao _myHistoryDao = _db.myHistoryDao;

  // Insert newly generated number to myHistory db
  Future<void> insertGeneratedNumber(String generatedNumber) async {
    await _myHistoryDao.insertGeneratedNumber(generatedNumber);
  }

  // Insert list of myHistory items and replace if conflict
  Future<void> insertMyHistoryList(List<MyHistoryEntityData> list) async {
    await _myHistoryDao.insertMyHistoryList(list);
  }

  // Get list of myHistory items without winStatus and still valid
  Future<List<MyHistoryEntityData>> getUnwonHistoryList(ModuleType selectedModuleType) =>
      _myHistoryDao.getMyHistoryListByWinStatus(selectedModuleType);

  // Get full my history list stream
  Stream<List<MyHistoryEntityData>> getMyHistoryPagedList(
      ModuleType selectedModuleType, FilterItemType sortType, bool isDesc, int currentPage) {
    return _myHistoryDao.getMyHistoryPagedListStream(selectedModuleType, sortType, isDesc, currentPage);
  }
}
