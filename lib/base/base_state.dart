import 'package:flutter/material.dart';

/// Base state with convenient functions e.g. disposing mobx or flutter controllers.
abstract class BaseState<T extends StatefulWidget> extends State<T> {
  final List<BaseController> _mobxControllers = List.empty(growable: true);
  final List<Listenable> _controllers = List.empty(growable: true);

  @override
  void dispose() {
    _mobxControllers.clear();
    super.dispose();
  }
}

class BaseController {
  void bind(BaseState baseState) {
    baseState._mobxControllers.add(this);
  }
}

extension BaseListenable on Listenable {
  void bind(BaseState baseState) {
    baseState._controllers.add(this);
  }
}