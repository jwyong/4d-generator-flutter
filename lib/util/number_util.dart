/// Number conversion util
extension NumberUtil on String? {
  int? toIntOrNull() => int.tryParse(toString());
  int toIntOrZero() => int.tryParse(toString())?? 0;
}
