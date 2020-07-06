import 'package:flutter/material.dart';

import '../path_builder.dart';

class PathBuilderSplitVerticalIn extends PathBuilder {
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
