import 'package:drift/drift.dart';
import 'package:lucky_generator/database/entity/dmc_entity.dart';
import 'package:lucky_generator/database/my_database.dart';

part 'dmc_dao.g.dart';

@DriftAccessor(tables: [DmcEntity])
class DmcDao extends DatabaseAccessor<MyDatabase> with _$DmcDaoMixin {
  DmcDao(MyDatabase db) : super(db);

  Future<void> insertDmcList(List<DmcEntityCompanion> list) async =>
      db.batch((batch) => batch.insertAllOnConflictUpdate(db.dmcEntity, list));

  /// insert
// single
// Future<int> insertContact(ContactCompanion contact) async =>
//     db.into(db.contact).insert(contact);
//
// // bulk

//
// /// get
// Stream<List<ContactData>> getAllContactsStream() =>
//     customSelect('SELECT * FROM contact ORDER BY contactName COLLATE NOCASE',
//         readsFrom: {contact})
//         .watch()
//         .map((contacts) => contacts
//         .map((QueryRow contact) => ContactData.fromJson(contact.data))
//         .toList());
//
// /// delete
// Future<int> deleteAllContacts() async => db.delete(db.contact).go();
}
