import 'package:flutter/material.dart';

import '../path_builder.dart';

class PathBuilderSplitHorizontalOut extends PathBuilder {
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
