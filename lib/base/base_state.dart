import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucky_generator/constant/shared_prefs_constants.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/model/universal/module_type.dart';
import 'package:lucky_generator/util/shared_prefs_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Base state with convenient functions e.g. disposing mobx or flutter controllers.
abstract class BaseState<T extends StatefulWidget> extends State<T> {
  final List<BaseViewModel> _mobxControllers = List.empty(growable: true);
  final List<Listenable> _controllers = List.empty(growable: true);

  static late final SharedPreferences sharedPrefs;

  @override
  void dispose() {
    _mobxControllers.clear();
    super.dispose();
  }
}

class BaseViewModel {
  late final MyDatabase database = Get.find<MyDatabase>();
  late final SharedPreferences sharedPrefs = SharedPreferencesManager().sharedPrefs;

  // Currently selected module (e.g. dmc, toto, magnum...)
  // TODO: JAY_LOG - figure out how to observe from anywhere (sharedPrefs?)
  final selectedModuleTypeController = StreamController<int>.broadcast();

  ModuleType get selectedModuleType {
    final sharedPrefsSelectedTypeId = sharedPrefs.getInt(spKeySelectedModuleTypeId) ?? ModuleType.dmc.id;
    return _getModuleTypeFromId(sharedPrefsSelectedTypeId);
  }

  void bind(BaseState baseState) async {
    // Initialise stream controllers
    selectedModuleTypeController
      ..add(selectedModuleType.id)
      ..stream.listen((moduleTypeId) {onModuleTypeChanged(_getModuleTypeFromId(moduleTypeId));
      });

    baseState._mobxControllers.add(this);
  }

  ModuleType _getModuleTypeFromId(moduleTypeId) =>
      ModuleType.values.firstWhereOrNull((element) => element.id == moduleTypeId) ?? ModuleType.dmc;

  /// Open callback functions
  void onSharedPrefsInitialised() {}
  void onModuleTypeChanged(ModuleType moduleType) {}
}

extension BaseListenable on Listenable {
  void bind(BaseState baseState) {
    baseState._controllers.add(this);
  }
}
