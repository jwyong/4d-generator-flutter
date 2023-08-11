import 'package:flutter/material.dart';
import 'package:lucky_generator/database/dao/dmc_dao.dart';
import 'package:lucky_generator/database/my_database.dart';

class DmcRepository {
  DmcRepository(this._db);

  final MyDatabase _db;
  late final DmcDao _dmcDao = _db.dmcDao;

  /// insert
  // insert bulk
  Future<void> insertDmcList(List<DmcEntityData> list) async {
    await _dmcDao.insertDmcList(list);
  }

  /// get
  // Check if data exists
  Future<bool> checkExistDmcTable() async {
    final data = await _dmcDao.checkExistDmc();
    debugPrint("JAY_LOG: DmcRepository, checkExistDmcTable, data = $data");
    return data != null;
  }

  Stream<List<DmcEntityData>> getDmcListStream() => _dmcDao.getDmcListStream();
}
