import 'package:flutter/widgets.dart';

import '../path_builder.dart';

class PathBuilderSplitHorizontalIn extends PathBuilder {
  /// Abstract const constructor to enable subclasses to provide
  /// const constructors so that they can be used in const expressions.
  const PathBuilderSplitHorizontalIn();

  @override
  Path buildPath(Size size, double value) {
    return Path()
      ..addRect(Rect.fromLTWH(
        0,
        0,
        size.width / 2 * value,
        size.height,
      ))
      ..addRect(Rect.fromLTWH(
        size.width - (size.width / 2 * value),
        0,
        size.width,
        size.height,
      ));
  }
}
