/// Number conversion util
extension NumberStringExt on String? {
  int? toIntOrNull() => int.tryParse(toString());
  int toIntOrZero() => int.tryParse(toString())?? 0;
}

extension IntToNonNullExtension<int> on int? {
  toNonNull() => this?? 0;
}

