import 'package:flutter/widgets.dart';

import '../path_builder.dart';

class PathBuilderSlideUp extends PathBuilder {
  /// Abstract const constructor to enable subclasses to provide
  /// const constructors so that they can be used in const expressions.
  const PathBuilderSlideUp();

  @override
  Path buildPath(Size size, double value) {
    return Path()
      ..addRect(Rect.fromLTWH(
        0,
        size.height * (1 - value),
        size.width,
        size.height * value,
      ));
  }
}
