import 'package:collection/collection.dart';

/// Number conversion util
extension NumberStringExt on String? {
  int? toIntOrNull() => int.tryParse(toString());
  int toIntOrZero() => int.tryParse(toString())?? 0;
}

extension IntToNonNullExtension<int> on int? {
  toNonNull() => this?? 0;
}

// Whether 2 given strings a permutations of each other
bool arePermutations(String str1, String str2) {
  if (str1.length != str2.length) {
    return false;
  }

  List<String> chars1 = str1.split('')..sort();
  List<String> chars2 = str2.split('')..sort();

  return const ListEquality().equals(chars1, chars2);
}


