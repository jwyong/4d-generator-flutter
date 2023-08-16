import 'package:flutter/material.dart';

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
    debugPrint("Top $topCount most frequent 4-digit combinations:");
    for (int i = 0; i < topCount; i++) {
      debugPrint("${sortedCombinations[i].key}: ${sortedCombinations[i].value} occurrences");
    }

    return sortedCombinations.sublist(0, topCount);
  }

  // Hot numbers: pau (any sequence). Output: <hotNumberPau>, <occurrences> e.g. "3524", 354
  List<MapEntry<String, int>> getHotNumbersPau(List<String> list, int topCount) {
    Map<String, int> combinationCounts = {};

    for (String digits in list) {
      if (digits.length == 4) {
        List<int> sortedDigits =
        digits.runes.map((rune) => int.parse(String.fromCharCode(rune))).toList();
        sortedDigits.sort();
        String sortedCombination = sortedDigits.join();

        combinationCounts[sortedCombination] = combinationCounts.containsKey(sortedCombination)
            ? combinationCounts[sortedCombination]! + 1
            : 1;
      }
    }

    List<MapEntry<String, int>> sortedCombinations = combinationCounts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    if (sortedCombinations.length < topCount) {
      topCount = sortedCombinations.length;
    }

    debugPrint("Top $topCount most frequent 4-digit combinations:");
    for (int i = 0; i < topCount; i++) {
      debugPrint("${sortedCombinations[i].key}: ${sortedCombinations[i].value} occurrences");
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

    debugPrint(
        "Top $topCount most frequent combinations based on permutations of $inputCombination:");
    for (int i = 0; i < topCount; i++) {
      debugPrint("${sortedCombinations[i].key}: ${sortedCombinations[i].value} occurrences");
    }

    return sortedCombinations.sublist(0, topCount);
  }

  // 6x6x, 66xx, 6xx6, ..., only DOUBLES, meaning 666x, 66x6 are NOT included. Output: <hotDouble>, <occurrences> e.g. "6", 35435
  List<MapEntry<String, int>> getHotDoubles(List<String> list, int topCount) {
    Map<String, int> digitOccurrences = {};

    for (String digits in list) {
      Set<int> countedDigits = <int>{};
      bool validCombination = true;

      for (int digit in digits.runes.map((rune) => int.parse(String.fromCharCode(rune)))) {
        if (countedDigits.contains(digit)) {
          validCombination = false;
          break;
        }

        int count = digits.split(digit.toString()).length - 1;
        if (count == 1) {
          if (digitOccurrences.containsKey(digit)) {
            digitOccurrences[digit.toString()] = digitOccurrences[digit]! + 1;
          } else {
            digitOccurrences[digit.toString()] = 1;
          }
          countedDigits.add(digit);
        }
      }

      if (!validCombination) {
        for (var digit in countedDigits) {
          digitOccurrences.remove(digit);
        }
      }
    }

    List<MapEntry<String, int>> sortedOccurrences = digitOccurrences.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    if (sortedOccurrences.length < topCount) {
      topCount = sortedOccurrences.length;
    }

    debugPrint("Top $topCount digits where a digit repeated exactly once:");
    for (int i = 0; i < topCount; i++) {
      debugPrint("${sortedOccurrences[i].key}, occurrences: ${sortedOccurrences[i].value}");
    }

    return sortedOccurrences.sublist(0, topCount);
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

    // Display the top x occurring patterns
    for (int i = 0; i < topCount && i < sortedPatterns.length; i++) {
      debugPrint("${sortedPatterns[i].key} : occurred ${sortedPatterns[i].value} times");
    }

    return sortedPatterns.sublist(0, topCount);
  }

  // 66x6, 6x66, ..., only TRIPLES, meaning 6666 NOT included. Output: <hotTriple>, <occurrences> e.g. "9", 35432
  List<MapEntry<String, int>> getHotTriples(List<String> list, int topCount) {
    Map<String, int> digitCounts = {};

    for (String digits in list) {
      Set<int> countedDigits = {};

      for (int digit in digits.runes.map((rune) => int.parse(String.fromCharCode(rune)))) {
        if (!countedDigits.contains(digit)) {
          if (digits.indexOf(digit.toString()) != digits.lastIndexOf(digit.toString())) {
            if (digitCounts.containsKey(digit)) {
              digitCounts[digit.toString()] = digitCounts[digit]! + 1;
            } else {
              digitCounts[digit.toString()] = 1;
            }
            countedDigits.add(digit);
          }
        }
      }
    }

    List<MapEntry<String, int>> sortedDigits = digitCounts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    if (sortedDigits.length < topCount) {
      topCount = sortedDigits.length;
    }

    debugPrint("Top $topCount digits that repeated themselves exactly twice:");
    for (int i = 0; i < topCount; i++) {
      debugPrint("${sortedDigits[i].key}: ${sortedDigits[i].value} occurrences");
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

    // Display the top x occurring patterns
    for (int i = 0; i < topCount && i < sortedPatterns.length; i++) {
      debugPrint("${sortedPatterns[i].key} : occurred ${sortedPatterns[i].value} times");
    }

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