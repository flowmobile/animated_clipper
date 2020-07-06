import 'package:flutter/material.dart';

import '../path_builder.dart';

class PathBuilderSplitVerticalOut extends PathBuilder {
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
