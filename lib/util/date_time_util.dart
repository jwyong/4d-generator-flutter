import 'package:intl/intl.dart';

final ddMMyyyyFormat = DateFormat('dd/MM/yyyy');
final yyyyMMddFormat = DateFormat('yyyyMMdd');

extension DateTimeUtil on Object? {
  DateTime toDateTimeFromddMMyyyy() => ddMMyyyyFormat.parse(toString());
}

extension DateFormatUtil on DateTime {
  String toFormattedString(DateFormat dateFormat) => dateFormat.format(this);
}