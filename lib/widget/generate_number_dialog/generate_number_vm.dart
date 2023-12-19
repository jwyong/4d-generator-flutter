import 'dart:math';

import 'package:lucky_generator/base/base_state.dart';
import 'package:lucky_generator/generated/l10n.dart';
import 'package:lucky_generator/repository/dmc_repo.dart';
import 'package:lucky_generator/repository/universal/my_history_repo.dart';
import 'package:lucky_generator/util/generate_number_util.dart';
import 'package:lucky_generator/util/generate_number_util_neighbour.dart';
import 'package:mobx/mobx.dart';

part 'generate_number_vm.g.dart';

class GenerateNumberVM = AGenerateNumberVM with _$GenerateNumberVM;

abstract class AGenerateNumberVM extends BaseViewModel with Store {
  late final DmcRepository _dmcRepository = DmcRepository(database);
  late final MyHistoryRepository _myHistoryRepository = MyHistoryRepository(database);

  late final GenerateNumberUtil _generateNumberUtil = GenerateNumberUtil();
  late final GenerateNumberNeighbourUtil _generateNumberNeighbourUtil = GenerateNumberNeighbourUtil();

  @observable
  double indicatorPercent = 0;

  @observable
  late GenerateState generateState = GenerateState.notGenerated;

  @computed
  bool get isGenerating => generateState == GenerateState.generating;

  @observable
  String? generatedNumber;

  // List of generating texts
  late final List<String> _generatingTextList = [
    S().generating_text_1,
    S().generating_text_2,
    S().generating_text_3,
    S().generating_text_4,
    S().generating_text_5,
  ];
  late final Random _random = Random();

  // TODO: JAY_LOG - figure out threading for smooth UI updates
  void onGenerateButtonPressed() async {
    // Update UI state
    generateState = GenerateState.generating;

    // Get full flat list of 4d between 2 years and 1 year ago
    final flat4dList2YearsAgo = await _dmcRepository.getDmc4dFlatList2yearsAgo();

    // Get list of 4d 1 year ago (nested)
    final nested4dList1YearAgo = await _dmcRepository.getDmc4dListNested1Year();

    // Pass both lists to util to start calculations
    // TODO: JAY_LOG - improve generating algorithm
    final generated = _generateNumberUtil.generateNumber(flat4dList2YearsAgo, nested4dList1YearAgo);
    // generatedNumber = _generateNumberNeighbourUtil.generateNumber(flat4dList2YearsAgo, nested4dList1YearAgo);

    // Add to myHistory db
    _myHistoryRepository.insertGeneratedNumber(generated);

    // Update to UI
    generatedNumber = generated;

    // Update generated number to UI
    generateState = GenerateState.generated;
  }

  String getGeneratingText(GenerateState generateState) {
    switch (generateState) {
      case GenerateState.notGenerated:
        return S().generate_start_text;

      case GenerateState.generating:
        return _getGeneratingText();

      case GenerateState.generated:
        return S().generate_end_text;
    }
  }

  String _getGeneratingText() => _generatingTextList[_random.nextInt(_generatingTextList.length)];
}

enum GenerateState {
  notGenerated,
  generating,
  generated
}