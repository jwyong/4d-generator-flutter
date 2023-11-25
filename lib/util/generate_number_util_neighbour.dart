import 'dart:math';

import 'package:analyzer_plugin/utilities/pair.dart';
import 'package:flutter/material.dart';
import 'package:lucky_generator/constant/constants.dart';

class GenerateNumberNeighbourUtil {
  // Generate a number from lists of 13 month - 1 month ago + 1 month ago.
  String? generateNumber(List<String> flat4dList, List<List<String>?> nested4dList) {
    // Get digit 1
    final digit1List = _getTopOccurringDigits(flat4dList, 3);
    final digit1 = _generateRandom(digit1List);

    // Get digit 2 based on neighbour of digit 1
    final digit2List = _getTopOccurringNeighbours(flat4dList, digit1, 3);
    final digit2 = _generateRandom(digit2List);

    // Get digit 3 based on neighbour of digit 2
    final digit3List = _getTopOccurringNeighbours(flat4dList, digit2, 3);
    final digit3 = _generateRandom(digit3List);

    // Get digit 4 based on neighbour of digit 3
    final digit4List = _getTopOccurringNeighbours(flat4dList, digit3, 3);
    final digit4 = _generateRandom(digit4List);

    //
    //
    // // Get top neighbours of that digit
    // List<String> digit2List = _getTopOccurringNeighbours(flat4dList, digit1, 3);
    //
    // // Remove dupes and that digit
    // digit2List = digit2List.toSet().toList();
    // digit2List.remove(digit1);
    //
    // // Get top neighbours of those digits
    // List<String> digit3List = List.empty(growable: true);
    // digit2List.forEach((element) {
    //   final list = _getTopOccurringNeighbours(flat4dList, element, 3);
    //   digit3List.addAll(list);
    // });
    //
    // // Remove dupes and parent digits
    // digit3List = digit3List.toSet().toList();
    // digit2List.forEach((element) {
    //   digit3List.remove(element);
    // });
    //
    // // Get top neighbours of those digits
    // List<String> digit4List = List.empty(growable: true);
    // digit3List.forEach((element) {
    //   final list = _getTopOccurringNeighbours(flat4dList, element, 3);
    //   digit4List.addAll(list);
    // });
    //
    // // Remove dupes and parent digit
    // digit4List = digit4List.toSet().toList();
    // digit3List.forEach((element) {
    //   digit4List.remove(element);
    // });
    //
    // final digit2 = _generateRandom(digit2List);
    // final digit3 = _generateRandom(digit3List);
    // final digit4 = _generateRandom(digit4List);
    //
    debugPrint("JAY_LOG: GenerateNumberNeighbourUtil, generateNumber, digit1List = $digit1List");
    debugPrint("JAY_LOG: GenerateNumberNeighbourUtil, generateNumber, digit2List = $digit2List");
    debugPrint("JAY_LOG: GenerateNumberNeighbourUtil, generateNumber, digit3List = $digit3List");
    debugPrint("JAY_LOG: GenerateNumberNeighbourUtil, generateNumber, digit4List = $digit4List");


    return "$digit1$digit2$digit3$digit4";
  }

  // Get top occurring digit
  List<String> _getTopOccurringDigits(List<String> combinations, int topCount) {
    // Count occurrences of each digit
    Map<String, int> digitCount = {};

    for (String combination in combinations) {
      for (int i = 0; i < combination.length; i++) {
        String digit = combination[i];
        digitCount[digit] = (digitCount[digit] ?? 0) + 1;
      }
    }

    // Sort the digits by occurrence count in descending order
    List<MapEntry<String, int>> sortedDigits =
    digitCount.entries.toList()..sort((a, b) => b.value.compareTo(a.value));

    // Get the top 3 most frequent digits and their occurrence counts
    List<String> topDigits = [];
    List<int> topCounts = [];

    for (int i = 0; i < topCount && i < sortedDigits.length; i++) {
      topDigits.add(sortedDigits[i].key);
      topCounts.add(sortedDigits[i].value);
    }

    print('Top $topCount most frequent digits: $topDigits');
    print('Their occurrence counts: $topCounts');

    return topDigits;
  }

  List<String> _getTopOccurringNeighbours(List<String> combinations, String givenDigit, int topCount) {
    // Count occurrences of each digit when the given digit is present
    Map<String, int> digitCount = {};

    for (String combination in combinations) {
      if (combination.contains(givenDigit)) {
        for (int i = 0; i < combination.length; i++) {
          if (combination[i] != givenDigit) {
            String digit = combination[i];
            digitCount[digit] = (digitCount[digit] ?? 0) + 1;
          }
        }
      }
    }

    // Sort the digits by occurrence count in descending order
    List<MapEntry<String, int>> sortedDigits = digitCount.entries.toList()..sort((a, b) => b.value.compareTo(a.value));

    // Get the top x most occurring digits
    List<MapEntry<String, int>> topDigits = sortedDigits.take(topCount).toList();

    // Remove givenDigit from list
    // topDigits.removeWhere((element) => element.key == givenDigit);

    // Print the top x most occurring digits and their occurrence counts
    print('Top $topCount most frequent digits when $givenDigit is present:');
    for (var entry in topDigits) {
      print('${entry.key}: ${entry.value} occurrences');
    }

    return topDigits.map((e) => e.key).toList();
  }

  String _generateRandom(List<String> digitsList) {
    Random random = Random();

    int randomIndex = random.nextInt(digitsList.length);
    String selectedValue = digitsList[randomIndex];

    return selectedValue;
  }






  // OLD CODES
  // Get the full patterns output list and latest pattern categories
  Pair<List<Map<int, List<String>>>, Map<int, Map<String, List<String>>>> _getPatternOutputListAndCategoriesPair(
      List<String> fullFlatList, List<List<String>?> fullNestedList) {
    List<Map<int, List<String>>> outputList = [];

    // Get count of each digit
    Map<int, Map<String, int>> digitCounts = {
      0: {}, // First digit
      1: {}, // Second digit
      2: {}, // Third digit
      3: {}, // Fourth digit
    };

    for (String combination in fullFlatList) {
      for (int i = 0; i < combination.length; i++) {
        String digit = combination[i];
        digitCounts[i]?[digit] = (digitCounts[i]?[digit] ?? 0) + 1;
      }
    }

    // Categorise each digit's count to high, mid and low: high = ranks 1,2,3, mid = ranks 4,5,6, low = ranks 7,8,9,10
    Map<int, Map<String, List<String>>> categorizedDigits = {};
    for (int i = 0; i < 4; i++) {
      categorizedDigits[i] = {
        high: [],
        mid: [],
        low: [],
      };

      digitCounts[i]?.entries.toList()
        ?..sort((a, b) => b.value.compareTo(a.value))
        ..forEach((entry) {
          if ((categorizedDigits[i]?[high]?.length ?? 0) < 3) {
            categorizedDigits[i]?[high]?.add(entry.key);
          } else if ((categorizedDigits[i]?[mid]!.length ?? 0) < 3) {
            categorizedDigits[i]?[mid]?.add(entry.key);
          } else {
            categorizedDigits[i]?[low]?.add(entry.key);
          }
        });
    }

    // Loop nested list, which are the most recent 4d results (23 items each draw)
    for (List<String>? numberCombinations in fullNestedList) {
      if (numberCombinations == null) continue;

      Map<int, List<String>> output = {};

      // Compare each item in the nested list to last pattern category and add to final output list
      for (String combination in numberCombinations) {
        List<String> combinationCategories = [];

        for (int i = 0; i < combination.length; i++) {
          String digit = combination[i];
          String category;

          if (categorizedDigits[i]?[high]?.contains(digit) == true) {
            category = high;
          } else if (categorizedDigits[i]?[mid]?.contains(digit) == true) {
            category = mid;
          } else {
            category = low;
          }

          combinationCategories.add(category);
        }

        output[int.parse(combination)] = combinationCategories;
      }
      outputList.add(output);

      // Add current nested list to full flat list in order to re-calculate all digitCounts and categories.
      fullFlatList.addAll(numberCombinations);

      digitCounts = {
        0: {}, // First digit
        1: {}, // Second digit
        2: {}, // Third digit
        3: {}, // Fourth digit
      };

      for (String combination in fullFlatList) {
        for (int i = 0; i < combination.length; i++) {
          String digit = combination[i];
          digitCounts[i]?[digit] = (digitCounts[i]?[digit] ?? 0) + 1;
        }
      }

      categorizedDigits = {};

      // Re-calculate categories so that next iteration of nestedList will be able to use this updated pattern categories.
      for (int i = 0; i < 4; i++) {
        categorizedDigits[i] = {
          high: [],
          mid: [],
          low: [],
        };

        digitCounts[i]?.entries.toList()
          ?..sort((a, b) => b.value.compareTo(a.value))
          ..forEach((entry) {
            if ((categorizedDigits[i]?[high]?.length ?? 0) < 3) {
              categorizedDigits[i]?[high]?.add(entry.key);
            } else if ((categorizedDigits[i]?[mid]?.length ?? 0) < 3) {
              categorizedDigits[i]?[mid]?.add(entry.key);
            } else {
              categorizedDigits[i]?[low]?.add(entry.key);
            }
          });
      }

      // TODO: JAY_LOG - get the last iterated categorizedDigits
    }

    // Return full outputList to process most occurring pattern and also the latest patterns categories for mapping
    // back to respective numbers
    return Pair(outputList, categorizedDigits);
  }

  // Get most occurring pattern based on full patterns list, to be used to generate random digits
  List<Map<String, dynamic>> _getOutputPattern(List<Map<int, List<String>>> outputList) {
    // Extract patterns from outputList
    List<List<String>> patterns = [];

    for (var output in outputList) {
      for (var pattern in output.values) {
        patterns.add(pattern);
      }
    }

    // Change to list of strings
    List<String> patternsStringList = patterns.map((e) => e.toString()).toList();

    // Count the occurrences of each pattern string
    Map<String, int> patternStringOccurrences = {};

    for (var patternString in patternsStringList) {
      if (patternStringOccurrences.containsKey(patternString)) {
        patternStringOccurrences[patternString] = patternStringOccurrences[patternString]! + 1;
      } else {
        patternStringOccurrences[patternString] = 1;
      }
    }

    List<MapEntry<String, int>> entries = patternStringOccurrences.entries.toList();
    entries.sort((a, b) => b.value.compareTo(a.value)); // Compare in descending order
    debugPrint("JAY_LOG: GenerateNumberUtil, _getOutputPattern, hot = $entries");

    entries.sort((a, b) => a.value.compareTo(b.value));
    debugPrint("JAY_LOG: GenerateNumberUtil, _getOutputPattern, cold = $entries");

    // Find the highest occurrence value
    int highestOccurrence =
        patternStringOccurrences.values.reduce((maxValue, value) => value > maxValue ? value : maxValue);

    // Filter patterns with highest occurrence
    List<String> filteredPatterns = patternStringOccurrences.keys
        .where((pattern) => patternStringOccurrences[pattern] == highestOccurrence)
        .toList();

    // Create a list of maps containing the filtered patterns and their occurrences
    List<Map<String, dynamic>> result = filteredPatterns.map((pattern) => {pattern: highestOccurrence}).toList();

    return result;
  }

  // Get the list of numbers to be used to generate each digit based on the top occurring pattern
  Map<int, List<String>?> _getNumberListForEachDigit(
      List<Map<String, dynamic>> outputPattern, Map<int, Map<String, List<String>>> patternCategory) {
    debugPrint("GenerateNumberUtil, _generateNumber, patternCategory = $patternCategory");

    final String pattern = outputPattern.first.keys.first;

    debugPrint("GenerateNumberUtil, _generateNumber, pattern = $pattern");

    Map<int, List<String>?> patternMapping = {};

    // Extract letters from the pattern
    List<String> letters = pattern.replaceAll('[', '').replaceAll(']', '').replaceAll(' ', '').split(',');

    for (int i = 0; i < letters.length; i++) {
      String letter = letters[i];
      int digit = i;

      patternMapping[digit] = patternCategory[i]?[letter];
    }

    print(patternMapping);

    return patternMapping;
  }

  String _generate4d(Map<int, List<String>?> digitMap) {
    Random random = Random();
    List<String> digits = [];

    for (int i = 0; i < 4; i++) {
      int digit = i;
      List<String>? possibleValues = digitMap[digit];

      if (possibleValues == null) continue;

      int randomIndex = random.nextInt(possibleValues.length);
      String selectedValue = possibleValues[randomIndex];
      digits.add(selectedValue);
    }

    String randomNumber = digits.join();

    return randomNumber;
  }
}
