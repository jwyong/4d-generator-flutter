import 'package:flutter/material.dart';

class GenericTitleWidget extends StatelessWidget {
  const GenericTitleWidget(this.imgLabel, this.title, {super.key, this.horizontalPadding, this.bgImagePath});

  final String imgLabel, title;
  final double? horizontalPadding;
  final String? bgImagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: horizontalPadding?? 0),
        child: Row(
          children: [
            // Text + bg
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.amberAccent,
              backgroundImage: bgImagePath != null? AssetImage(bgImagePath.toString()): null,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  imgLabel,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(width: 5),

            // Title text
            Text(
              title.toUpperCase(),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            )
          ],
        ));
  }
}
