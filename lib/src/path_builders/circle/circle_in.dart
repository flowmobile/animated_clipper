import 'dart:math';

import 'package:flutter/widgets.dart';

import '../path_builder.dart';

class PathBuilderCircleIn extends PathBuilder {
  /// Abstract const constructor to enable subclasses to provide
  /// const constructors so that they can be used in const expressions.
  const PathBuilderCircleIn();

  @override
  Path buildPath(Size size, double value) {
    double w = size.width;
    double h = size.height;
    double centreX = w / 2;
    double centreY = h / 2;
    Offset center = Offset(centreX, centreY);
    double maxRadius = sqrt(w * w + h * h);
    double radius = value * maxRadius;
    print(value);
    return Path()
      ..addOval(
        Rect.fromCenter(center: center, width: radius, height: radius),
      );
  }
}
