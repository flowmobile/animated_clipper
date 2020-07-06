import 'package:flutter/material.dart';

import '../path_builder.dart';

class PathBuilderSlideUp extends PathBuilder {
  @override
  Path buildPath(Size size, double value) {
    return Path()
      ..addRect(Rect.fromLTWH(
        0,
        size.height * (1 - value),
        size.width,
        size.height * value,
      ));
  }
}
