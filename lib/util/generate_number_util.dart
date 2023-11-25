import 'dart:math';

import 'package:analyzer_plugin/utilities/pair.dart';
import 'package:flutter/material.dart';
import 'package:lucky_generator/constant/constants.dart';

class GenerateNumberUtil {
  // Generate a number from lists of 13 month - 1 month ago + 1 month ago.
  String generateNumber(List<String> flat4dList, List<List<String>?> nested4dList) {
    // Get full outputList + latest pattern categories for later reference
    final pair = _getPatternOutputListAndCategoriesPair(flat4dList, nested4dList);
    final outputList = pair.first;
    final latestPatternCategories = pair.last;

    // Get most occurring output pattern from full outpuList
    final outputPattern = _getOutputPattern(outputList);

    debugPrint("JAY_LOG: GenerateNumberUtil, generateNumber, outputPattern = $outputPattern");

    // Get list of numbers for each digit to be used to generate 4d
    final numberMapToGenerate = _getNumberListForEachDigit(outputPattern, latestPatternCategories);

    // Generate random number for each digit using said map / list
    return _generate4d(numberMapToGenerate);
  }

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
    List<String> letters = pattern
        .replaceAll('[', '')
        .replaceAll(']', '')
        .replaceAll(' ', '')
        .split(',');

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

