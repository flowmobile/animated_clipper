import 'package:flutter/widgets.dart';

import '../../../animated_clipper.dart';

class PathBuilderSplitVertical extends PathBuilder {
  /// Abstract const constructor to enable subclasses to provide
  /// const constructors so that they can be used in const expressions.
  const PathBuilderSplitVertical({
    this.invert = false,
  });

  final bool invert;

  @override
  Path buildPath(Size size, double value) {
    return Path()
      ..addRect(Rect.fromLTWH(
        (size.width / 2) - (size.width / 2 * value),
        0,
        size.width * value,
        size.height,
      ));
  }
}
