import 'package:flutter/widgets.dart';

import '../../../animated_clipper.dart';

class PathBuilderSlideDown extends PathBuilder {
  /// Abstract const constructor to enable subclasses to provide
  /// const constructors so that they can be used in const expressions.
  const PathBuilderSlideDown();

  @override
  Path buildPath(Size size, double value) {
    return Path()
      ..addRect(Rect.fromLTWH(
        0,
        0,
        size.width,
        size.height * value,
      ));
  }
}
