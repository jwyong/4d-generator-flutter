import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucky_generator/constant/shared_prefs_constants.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/generated/l10n.dart';
import 'package:lucky_generator/model/universal/module_type.dart';
import 'package:lucky_generator/singleton/module_type_stream.dart';
import 'package:lucky_generator/singleton/shared_prefs_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Base state with convenient functions e.g. disposing mobx or flutter controllers.
abstract class BaseState<T extends StatefulWidget> extends State<T> {
  final List<BaseViewModel> _mobxControllers = List.empty(growable: true);
  final List<Listenable> _controllers = List.empty(growable: true);
  late final s = S();

  static late final SharedPreferences sharedPrefs;

  @override
  void dispose() {
    _mobxControllers.clear();
    super.dispose();
  }
}

class BaseViewModel {
  late final s = S();
  late final MyDatabase database = Get.find<MyDatabase>();
  late final SharedPreferences sharedPrefs = SharedPreferencesManager().sharedPrefs;

  // Currently selected module (e.g. dmc, toto, magnum...)
  // TODO: JAY_LOG - figure out how to observe from anywhere (sharedPrefs?)
  final selectedModuleTypeController = ModuleTypeStreamController();

  ModuleType get selectedModuleType {
    final sharedPrefsSelectedTypeId = sharedPrefs.getInt(spKeySelectedModuleTypeId) ?? ModuleType.dmc.id;
    return _getModuleTypeFromId(sharedPrefsSelectedTypeId);
  }

  void bind(BaseState baseState) async {
    // Initialise stream controllers
    selectedModuleTypeController
      ..updateData(selectedModuleType.id)
      ..dataStream.listen((moduleTypeId) {
        onModuleTypeChanged(_getModuleTypeFromId(moduleTypeId));
      });

    baseState._mobxControllers.add(this);
  }

  ModuleType _getModuleTypeFromId(moduleTypeId) =>
      ModuleType.values.firstWhereOrNull((element) => element.id == moduleTypeId) ?? ModuleType.dmc;

  // Update selectedModuleType to sharedPrefs + stream
  void updateSelectedModuleType(ModuleType moduleType) {
    sharedPrefs.setInt(spKeySelectedModuleTypeId, moduleType.id);
    selectedModuleTypeController.updateData(moduleType.id);
  }

  // Open function for overriding when moduleType is changed
  void onModuleTypeChanged(ModuleType moduleType) {}
}

extension BaseListenable on Listenable {
  void bind(BaseState baseState) {
    baseState._controllers.add(this);
  }
}
