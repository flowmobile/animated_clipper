import 'package:flutter/material.dart';

import '../path_builder.dart';

class PathBuilderSlideDown extends PathBuilder {
  @override
  Path buildPath(Size size, double value) {
    return Path()
      ..addRect(Rect.fromLTWH(
        0,
        0,
        size.width,
        size.height * value,
      ));
  }
}
