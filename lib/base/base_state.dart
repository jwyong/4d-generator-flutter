import 'package:flutter/cupertino.dart';

// TODO: JAY_LOG - can be used to dispose normal controllers
/// The base state with universal functions e.g. binding and disposing 
/// controllers to this state's lifecycle.
// class BaseState<T extends StatefulWidget> extends State<T> {
//   final List<Contoller> _controllers = List.empty(growable: true);
//
//   @override
//   Widget build(BuildContext context) => Container();
//
//   @override
//   void dispose() {
//     _controllers.clea
//     super.dispose();
//   }
// }
//
// class BaseController {
//   void bind(BaseState baseState) {
//     baseState._controllers.add(this);
//   }
// }