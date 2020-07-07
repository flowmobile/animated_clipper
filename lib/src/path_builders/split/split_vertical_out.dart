import 'package:flutter/widgets.dart';

import '../path_builder.dart';

class PathBuilderSplitVerticalOut extends PathBuilder {
  /// Abstract const constructor to enable subclasses to provide
  /// const constructors so that they can be used in const expressions.
  const PathBuilderSplitVerticalOut();

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
