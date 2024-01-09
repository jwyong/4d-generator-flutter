import 'package:flutter/material.dart';
import 'package:lucky_generator/constant/color_constants.dart';

class DmcGenericRoundBg extends StatelessWidget {
  const DmcGenericRoundBg({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          color: color_dmcDarkBlue, // Set your desired background color
          shape: BoxShape.circle, // Set border radius
        ),
        child: child,
      );
}
