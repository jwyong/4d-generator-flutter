import 'package:lucky_generator/database/dao/dmc_dao.dart';
import 'package:lucky_generator/database/my_database.dart';

class DmcRepository {
  DmcRepository(this._db);

  final MyDatabase _db;
  late final DmcDao _dmcDao = _db.dmcDao;


  /// insert
  // insert bulk (TODO: TEMP - clear all old contacts first)
  Future<void> insertDmcList(List<DmcEntityCompanion> list) async {
    await _dmcDao.insertDmcList(list);
  }

  here - // TODO: JAY_LOG: test insert and get dmc list
  /// get
  // Stream<List<ContactData>> getContactsStream() => _dmcDao.getAllContactsStream();
}