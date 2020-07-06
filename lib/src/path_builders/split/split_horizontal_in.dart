import 'package:flutter/material.dart';

import '../path_builder.dart';

class PathBuilderSplitHorizontalIn extends PathBuilder {
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
