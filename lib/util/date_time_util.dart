import 'package:intl/intl.dart';

final ddMMyyyyFormat = DateFormat('dd/MM/yyyy');
final ddMMyyyyEEEFormat = DateFormat('dd/MM/yyyy (EEE)');
final ddMMMyyyyhhmmaFormat = DateFormat('dd MMM yyyy\nhh:mm a');
final yyyyMMddFormat = DateFormat('yyyyMMdd');

extension DateTimeUtil on Object? {
  DateTime toDateTimeFromddMMyyyy() => ddMMyyyyFormat.parse(toString());
}

extension DateFormatUtil on DateTime {
  String toFormattedString(DateFormat dateFormat) => dateFormat.format(this);
}