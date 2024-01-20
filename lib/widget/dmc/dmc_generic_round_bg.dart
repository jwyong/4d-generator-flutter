import 'package:flutter/material.dart';
import 'package:lucky_generator/constant/color_constants.dart';

class DmcGenericRoundBg extends StatelessWidget {
  const DmcGenericRoundBg({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Container(
          decoration: BoxDecoration(
            color: colorDmcDarkBlue, // Set your desired background color
            borderRadius: BorderRadius.circular(20), // Set half of the height as the border radius
          ),
          child: child,
        ),
      );
}
