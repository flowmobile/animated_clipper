import 'package:flutter/widgets.dart';

@immutable
abstract class PathBuilder {
  /// Abstract const constructor to enable subclasses to provide
  /// const constructors so that they can be used in const expressions.
  const PathBuilder();

  Path call(Size size, double value) {
    if (value == 1) {
      return null; // ClipPath Renders nothing
    }
    if (value == 0) {
      return Path(); // ClipPath Renders everyhing
    }
    return buildPath(size, value); // All the values between
  }

  Path buildPath(Size size, double value);
}
