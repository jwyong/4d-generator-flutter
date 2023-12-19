import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucky_generator/database/my_database.dart';
import 'package:lucky_generator/model/universal/module_type.dart';

/// Base state with convenient functions e.g. disposing mobx or flutter controllers.
abstract class BaseState<T extends StatefulWidget> extends State<T> {
  final List<BaseViewModel> _mobxControllers = List.empty(growable: true);
  final List<Listenable> _controllers = List.empty(growable: true);

  @override
  void dispose() {
    _mobxControllers.clear();
    super.dispose();
  }
}

class BaseViewModel {
  late final MyDatabase database = Get.find<MyDatabase>();

  // Currently selected module (e.g. dmc, toto, magnum...)
  // TODO: JAY_LOG - figure out how to observe from anywhere (sharedPrefs?)
  ModuleType selectedModuleType = ModuleType.dmc;

  void bind(BaseState baseState) {
    baseState._mobxControllers.add(this);
  }
}

extension BaseListenable on Listenable {
  void bind(BaseState baseState) {
    baseState._controllers.add(this);
  }
}