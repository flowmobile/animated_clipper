import 'package:flutter/material.dart';

import '../path_builder.dart';

class PathBuilderSlideLeft extends PathBuilder {
  @override
  Path buildPath(Size size, double value) {
    return Path()
      ..addRect(Rect.fromLTWH(
        size.width * (1 - value),
        0,
        size.width * value,
        size.height,
      ));
  }
}
