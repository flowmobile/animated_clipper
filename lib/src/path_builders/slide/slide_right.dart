import 'package:flutter/widgets.dart';

import '../../../animated_clipper.dart';

class PathBuilderSlideRight extends PathBuilder {
  /// Abstract const constructor to enable subclasses to provide
  /// const constructors so that they can be used in const expressions.
  const PathBuilderSlideRight();

  @override
  Path buildPath(Size size, double value) {
    return Path()
      ..addRect(Rect.fromLTWH(
        0,
        0,
        size.width * value,
        size.height,
      ));
  }
}
