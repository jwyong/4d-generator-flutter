import 'package:flutter/material.dart';
import 'package:lucky_generator/generated/l10n.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
  BaseStatelessWidget({super.key});

  late final s = S();
}