import 'dart:convert';

import 'package:drift/drift.dart';

class IntListConverter extends TypeConverter<List<int>, String> {
  const IntListConverter();

  @override
  List<int> fromSql(String fromDb) {
    final jsonFile = json.decode(fromDb);
    List<int> list = List.from(jsonFile['list']);
    return list;
  }

  @override
  String toSql(List<int> value) {
    final data = <String, dynamic>{};
    data.addAll({'list': value});
    return json.encode(data);
  }
}