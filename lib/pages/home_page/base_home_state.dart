import 'package:flutter/material.dart';
import 'package:lucky_generator/base/base_state.dart';

/// Base state for home page tabs
abstract class BaseHomeState<T extends StatefulWidget> extends BaseState<T> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
}