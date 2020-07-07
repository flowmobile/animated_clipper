import 'package:flutter/widgets.dart';

import '../path_builder.dart';

class PathBuilderSlideLeft extends PathBuilder {
  /// Abstract const constructor to enable subclasses to provide
  /// const constructors so that they can be used in const expressions.
  const PathBuilderSlideLeft();

  @override
  Path buildPath(Size size, double value) {
    return Path()
      ..addRect(Rect.fromLTWH(
        size.width * (1 - value),
        0,
        size.width * value,
        size.height,
      ));
  }
}
