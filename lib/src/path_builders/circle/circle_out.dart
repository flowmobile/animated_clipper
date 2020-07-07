import 'package:flutter/widgets.dart';

import '../path_builder.dart';
import 'circle_in.dart';

class PathBuilderCircleOut extends PathBuilder {
  /// Abstract const constructor to enable subclasses to provide
  /// const constructors so that they can be used in const expressions.
  const PathBuilderCircleOut();

  @override
  Path buildPath(Size size, double value) {
    return PathBuilderCircleIn().buildPath(size, 1 - value)
      ..addRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height))
      ..fillType = PathFillType.evenOdd;
  }
}
