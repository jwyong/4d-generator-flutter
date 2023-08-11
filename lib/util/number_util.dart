/// Number conversion util
extension NumberUtil on String {
  int? toIntOrNull() => int.tryParse(this);
  int toIntOrZero() => int.tryParse(this)?? 0;
}
