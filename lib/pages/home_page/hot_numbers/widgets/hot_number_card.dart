import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucky_generator/base/base_state.dart';

class HotNumberCard extends StatefulWidget {
  const HotNumberCard({super.key, this.title, this.subTitle, this.width});

  final String? title, subTitle;
  final double? width;

  @override
  State<StatefulWidget> createState() => _HotNumberCardState();
}

class _HotNumberCardState extends BaseState<HotNumberCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
              height: 0.333.sw - 30,
              child:
                  // Show skeleton loading if null
                  widget.title == null
                      ? Text("Loading...") // TODO: JAY_LOG
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.title.toString(),
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 10),
                            Text(widget.subTitle.toString(), style: const TextStyle(fontSize: 14))
                          ],
                        ))),
    ));
  }
}
