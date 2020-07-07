import 'package:flutter/widgets.dart';

import 'path_builder.dart';

class PathBuilderClipper extends CustomClipper<Path> {
  final double value;
  final PathBuilder pathBuilder;

  PathBuilderClipper({
    @required this.value,
    @required this.pathBuilder,
  });

  @override
  Path getClip(Size size) {
    return pathBuilder(size, value);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
