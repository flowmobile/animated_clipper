import 'package:animated_clipper/animated_clipper.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'simple_box.dart';

class AnimatedClipRevealExample extends StatelessWidget {
  const AnimatedClipRevealExample({
    Key key,
    @required this.value,
  }) : super(key: key);

  final int value;

  static List<Curve> _curves = [
    Curves.easeIn,
    Curves.easeOut,
    Curves.easeInOut,
    Curves.linear,
  ];

  static List<PathBuilder> _pathBuilders = [
    PathBuilders.circleIn,
    PathBuilders.circleIn,
    PathBuilders.circleIn,
    PathBuilders.circleIn,
    PathBuilders.circleIn,
    PathBuilders.circleIn,
    PathBuilders.circleIn,
    PathBuilders.circleOut,
    PathBuilders.circleOut,
    PathBuilders.circleOut,
    PathBuilders.circleOut,
    PathBuilders.circleOut,
    PathBuilders.slideUp,
    PathBuilders.slideUp,
    PathBuilders.slideLeft,
    PathBuilders.slideLeft,
    PathBuilders.slideDown,
    PathBuilders.slideDown,
    PathBuilders.slideRight,
    PathBuilders.slideRight,
    PathBuilders.splitHorizontalIn,
    PathBuilders.splitHorizontalIn,
    PathBuilders.splitVerticalIn,
    PathBuilders.splitVerticalIn,
    PathBuilders.splitHorizontalOut,
    PathBuilders.splitHorizontalOut,
    PathBuilders.splitVerticalOut,
    PathBuilders.splitVerticalOut,
  ];

  @override
  Widget build(BuildContext context) {
    // To demonstrate, we render the AnimatedClipStack with random params
    Color randomColor =
        Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    Curve curve = _curves[value % _curves.length];
    Duration randomDuration =
        Duration(milliseconds: Random().nextInt(1000) + 1000);
    PathBuilder pathBuilder = _pathBuilders[value % _pathBuilders.length];
    // ...whenever the `child` is changed, the stack animates
    // ...we must use a `key` since the Widget type is the same
    return AnimatedClipReveal(
      child: SimpleBox(
        key: Key('$value'),
        text: '$value',
        color: randomColor,
      ),
      duration: randomDuration,
      // ...optional params
      pathBuilder: pathBuilder,
      revealFirstChild: true,
      clipBehavior: Clip.antiAlias,
      curve: curve,
    );
  }
}
