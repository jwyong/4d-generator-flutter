

/// Util for getting hot numbers / doubles / etc from any platform
/// TODO: optimise calls
class HotNumbersUtil {
  /// Hot numbers: no pau (exact). Output: <hotNumber>, <occurrences> e.g. "3524", 354
  List<MapEntry<String, int>> getHotNumbers(List<String> list, int topCount) {
    Map<String, int> combinationCounts = {};

    for (String digits in list) {
      if (digits.length == 4) {
        for (int i = 0; i <= digits.length - 4; i++) {
          String combination = digits.substring(i, i + 4);
          combinationCounts[combination] =
              combinationCounts.containsKey(combination) ? combinationCounts[combination]! + 1 : 1;
        }
      }
    }

    List<MapEntry<String, int>> sortedCombinations = combinationCounts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    if (sortedCombinations.length < topCount) {
      topCount = sortedCombinations.length;
    }

    return sortedCombinations.sublist(0, topCount);
  }

  // Hot numbers: pau (any sequence). Output: <hotNumberPau>, <occurrences> e.g. "3524", 354
  List<MapEntry<String, int>> getHotNumbersPau(List<String> list, int topCount) {
    Map<String, int> combinationCounts = {};

    for (String digits in list) {
      if (digits.length == 4) {
        List<int> sortedDigits = digits.runes.map((rune) => int.parse(String.fromCharCode(rune))).toList();
        sortedDigits.sort();
        String sortedCombination = sortedDigits.join();

        combinationCounts[sortedCombination] =
            combinationCounts.containsKey(sortedCombination) ? combinationCounts[sortedCombination]! + 1 : 1;
      }
    }

    List<MapEntry<String, int>> sortedCombinations = combinationCounts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    if (sortedCombinations.length < topCount) {
      topCount = sortedCombinations.length;
    }

    return sortedCombinations.sublist(0, topCount);
  }

  // Get the number of occurrences for hotNumbers pau. Output: <hotNumber exact>, <occurrences> e.g. "3524", 354
  List<MapEntry<String, int>> getHotNumbersPauOccurrences(List<String> list, int topCount, String inputCombination) {
    Map<String, int> combinationCounts = {};

    List<String> permutations = _generatePermutations(inputCombination);

    for (String digits in list) {
      for (String permutation in permutations) {
        if (digits.contains(permutation)) {
          combinationCounts[permutation] =
              combinationCounts.containsKey(permutation) ? combinationCounts[permutation]! + 1 : 1;
        }
      }
    }

    List<MapEntry<String, int>> sortedCombinations = combinationCounts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    if (sortedCombinations.length < topCount) {
      topCount = sortedCombinations.length;
    }

    return sortedCombinations.sublist(0, topCount);
  }

  // 6x6x, 66xx, 6xx6, ..., only DOUBLES, meaning 666x, 66x6 are NOT included. Output: <hotDouble>, <occurrences> e.g. "6", 35435
  List<MapEntry<String, int>> getHotDoubles(List<String> list, int topCount) {
    Map<String, int> digitCounts = {};

    for (String digits in list) {
      Set<String> countedDigits = {};

      for (String digit in digits.runes.map((rune) => String.fromCharCode(rune))) {
        if (!countedDigits.contains(digit)) {
          if (digitCounts.containsKey(digit)) {
            digitCounts[digit] = digitCounts[digit]! + 1;
          } else {
            digitCounts[digit] = 1;
          }
          countedDigits.add(digit);
        }
      }
    }

    List<MapEntry<String, int>> sortedDigits = digitCounts.entries.toList()..sort((a, b) => b.value.compareTo(a.value));

    int topCount = 3;
    if (sortedDigits.length < topCount) {
      topCount = sortedDigits.length;
    }

    return sortedDigits.sublist(0, topCount);
  }

  // Get top x occurrences of a hot double digit. Output: <hotDouble pattern>, <occurrences> e.g. "x66x", 354
  List<MapEntry<String, int>> getHotDoublesOccurrences(List<String> list, int topCount, String targetDigit) {
    Map<String, int> patternOccurrences = {};

    for (String combinationStr in list) {
      // Check if target digit repeats exactly once in the combination
      if (combinationStr.split(targetDigit).length - 1 == 2) {
        String pattern = combinationStr.replaceAll(RegExp('[^$targetDigit]'), "x");
        patternOccurrences[pattern] = (patternOccurrences[pattern] ?? 0) + 1;
      }
    }

    // Sort patterns by occurrence count in descending order
    List<MapEntry<String, int>> sortedPatterns = patternOccurrences.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return sortedPatterns.sublist(0, topCount);
  }

  // 66x6, 6x66, ..., only TRIPLES, meaning 6666 NOT included. Output: <hotTriple>, <occurrences> e.g. "9", 35432
  List<MapEntry<String, int>> getHotTriples(List<String> list, int topCount) {
    Map<String, int> digitCounts = {};

    for (String digits in list) {
      Set<String> countedDigits = {};

      for (String digit in digits.runes.map((rune) => String.fromCharCode(rune))) {
        if (!countedDigits.contains(digit)) {
          if (digits.indexOf(digit.toString()) != digits.lastIndexOf(digit.toString())) {
            if (digitCounts.containsKey(digit)) {
              digitCounts[digit] = digitCounts[digit]! + 1;
            } else {
              digitCounts[digit] = 1;
            }
            countedDigits.add(digit);
          }
        }
      }
    }

    List<MapEntry<String, int>> sortedDigits = digitCounts.entries.toList()..sort((a, b) => b.value.compareTo(a.value));

    int topCount = 3;
    if (sortedDigits.length < topCount) {
      topCount = sortedDigits.length;
    }

    return sortedDigits.sublist(0, topCount);
  }

  // Get top x occurrences of a hot triple digit. Output: <hotTriple pattern>, <occurrences> e.g. "9x9x", 354
  List<MapEntry<String, int>> getHotTriplesOccurrences(List<String> list, int topCount, String targetDigit) {
    Map<String, int> patternOccurrences = {};

    for (String combinationStr in list) {
      // Check if target digit repeats exactly twice in the combination
      if (combinationStr.split(targetDigit).length - 1 == 3) {
        String pattern = combinationStr.replaceAll(RegExp('[^$targetDigit]'), "x");
        patternOccurrences[pattern] = (patternOccurrences[pattern] ?? 0) + 1;
      }
    }

    // Sort patterns by occurrence count in descending order
    List<MapEntry<String, int>> sortedPatterns = patternOccurrences.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return sortedPatterns.sublist(0, topCount);
  }

  // Generate permutations on out a provided input (can be any digits 4d / 6d / etc)
  List<String> _generatePermutations(String input) {
    List<String> permutations = [];

    void permute(String prefix, String remaining) {
      if (remaining.isEmpty) {
        permutations.add(prefix);
        return;
      }
      for (int i = 0; i < remaining.length; i++) {
        permute(prefix + remaining[i], remaining.substring(0, i) + remaining.substring(i + 1));
      }
    }

    permute('', input);
    return permutations;
  }
}
