import 'package:flutter/widgets.dart';

import '../animated_clipper.dart';

/// Uses a [PathBuilder] to return a [CustomClipper] for a given [value]
class PathBuilderClipper extends CustomClipper<Path> {
  /// Creates an [PathBuilderClipper].
  ///
  /// [value] and [pathBuilder] must not be null.
  PathBuilderClipper({
    @required this.value,
    @required this.pathBuilder,
  });

  /// The value to render, will be between `0` and `1`, where:
  ///
  ///   * `0` should render nothing
  ///   * `1` should render everything
  ///   * Intermediate values should render a partial amount
  final double value;

  /// The logic for rendering the [Path]
  ///
  /// See [PathBuilders]
  final PathBuilder pathBuilder;

  @override
  Path getClip(Size size) {
    return pathBuilder(size, value);
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
