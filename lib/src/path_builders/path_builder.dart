import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

@immutable
abstract class PathBuilder {
  /// Abstract const constructor to enable subclasses to provide
  /// const constructors so that they can be used in const expressions.
  const PathBuilder({
    this.invert = false,
  });

  final bool invert;

  Path call(Size size, double value) {
    if (value == 1) {
      return null; // ClipPath Renders nothing
    }
    if (value == 0) {
      return Path(); // ClipPath Renders everyhing
    }
    // All the values between
    if (!invert) {
      return buildPath(size, value);
    } else {
      // Grow the boundary a little to fix aliasing rounding that may occur
      Path boundary = Path()
        ..addRect(Rect.fromLTWH(-2, -2, size.width + 2, size.height + 2));
      // ...then invert
      return Path.combine(
        PathOperation.reverseDifference,
        buildPath(size, 1 - value),
        boundary,
      );
    }
  }

  Path buildPath(Size size, double value);
}
