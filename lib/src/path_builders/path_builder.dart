import 'package:flutter/material.dart';

// TODO - refactor to use a `typedef` like `AnimatedSwitcherLayoutBuilder`?

abstract class PathBuilder {
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
