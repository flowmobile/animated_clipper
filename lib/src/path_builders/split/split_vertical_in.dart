import 'package:flutter/widgets.dart';

import '../path_builder.dart';

class PathBuilderSplitVerticalIn extends PathBuilder {
  /// Abstract const constructor to enable subclasses to provide
  /// const constructors so that they can be used in const expressions.
  const PathBuilderSplitVerticalIn();

  @override
  Path buildPath(Size size, double value) {
    return Path()
      ..addRect(Rect.fromLTWH(
        0,
        0,
        size.width,
        size.height / 2 * value,
      ))
      ..addRect(Rect.fromLTWH(
        0,
        size.height - (size.height / 2 * value),
        size.width,
        size.height,
      ));
  }
}
