import 'package:flutter/widgets.dart';

import '../../../animated_clipper.dart';

class PathBuilderSplitHorizontal extends PathBuilder {
  /// Abstract const constructor to enable subclasses to provide
  /// const constructors so that they can be used in const expressions.
  const PathBuilderSplitHorizontal({
    this.invert = false,
  });

  final bool invert;

  @override
  Path buildPath(Size size, double value) {
    return Path()
      ..addRect(Rect.fromLTWH(
        0,
        (size.height / 2) - (size.height / 2 * value),
        size.width,
        size.height * value,
      ));
  }
}
