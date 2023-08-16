import 'package:intl/intl.dart';

extension DateTimeUtil on Object? {
  static final ddMMyyyyFormat = DateFormat('dd/MM/yyyy');

  DateTime toDateTimeInddMMyyyy() => ddMMyyyyFormat.parse(toString());
}