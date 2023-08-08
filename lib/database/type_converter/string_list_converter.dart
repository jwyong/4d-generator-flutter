import 'dart:convert';

import 'package:drift/drift.dart';

class StringListConverter extends TypeConverter<List<String>, String> {
  const StringListConverter();

  @override
  List<String> fromSql(String fromDb) {
    final jsonFile = json.decode(fromDb);
    List<String> list = List.from(jsonFile['list']);
    // .map((String e) => e)
    // .toList();

    return list;
  }

  @override
  String toSql(List<String> value) {
    final data = <String, dynamic>{};
    data.addAll({'list': value});
    return json.encode(data);
  }
}