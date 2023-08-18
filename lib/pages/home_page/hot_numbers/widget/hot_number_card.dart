import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucky_generator/base/base_state.dart';

/// TODO: JAY_LOG:
/// - update back UI with correct data
/// - disable tap when animating
/// - change widget to class
/// - check animation
class HotNumberCard extends StatefulWidget {
  const HotNumberCard({super.key, this.title, this.subTitle, this.width, this.rearTitle, this.rearLabelsList});

  final String? title, subTitle, rearTitle;
  final double? width;
  final List<String>? rearLabelsList;

  @override
  State<StatefulWidget> createState() => _HotNumberCardState();
}

class _HotNumberCardState extends BaseState<HotNumberCard> {
  bool _isShowingFront = true;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isShowingFront = !_isShowingFront;
                });
              },
              child: AnimatedSwitcher(
                transitionBuilder: __transitionBuilder,
                duration: const Duration(milliseconds: 600),
                child: _isShowingFront ? _getCardFront() : _getCardRear(),
                layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
              ),
            )));
  }

  AnimatedBuilder __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_isShowingFront) != widget?.key);
        final value = isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: Matrix4.rotationY(value),
          alignment: Alignment.center,
          child: widget,
        );
      },
    );
  }

  // Card front: title and subtitle
  Card _getCardFront() => Card(
      key: const ValueKey(true),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
          width: 0.333.sw - 20,
          height: 0.333.sw - 20,
          child:
              // Show skeleton loading if null
              widget.title == null
                  ? const Text("Loading...") // TODO: JAY_LOG
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
                    )));

  // Card rear: 3 labels
  Card _getCardRear() => Card(
      key: const ValueKey(false),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
          width: 0.333.sw - 20,
          height: 0.333.sw - 20,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: widget.rearLabelsList == null
                  ? []
                  : widget.rearLabelsList!
                      .map((element) => Text(
                            element,
                            style: const TextStyle(fontSize: 16),
                          ))
                      .toList())));
}
