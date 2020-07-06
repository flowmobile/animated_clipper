import 'package:flutter/material.dart';

import '../path_builder.dart';

class PathBuilderSlideRight extends PathBuilder {
  @override
  Path buildPath(Size size, double value) {
    return Path()
      ..addRect(Rect.fromLTWH(
        0,
        0,
        size.width * value,
        size.height,
      ));
  }
}
