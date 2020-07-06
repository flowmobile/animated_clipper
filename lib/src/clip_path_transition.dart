import 'package:flutter/material.dart';

import '../animated_clipper.dart';
import 'path_builders/path_builder.dart';

// Based on RotationTransition / SizeTransition etc.
// TODO - add a default `pathBuilder` value (see AnimatedSwitcher for an example)

/// Animates the ClipPath of a widget
class ClipPathTransition extends AnimatedWidget {
  /// Creates a ClipPath transition.
  ///
  /// The [animation] argument must not be null.
  /// The [pathBuilder] argument must not be null.
  const ClipPathTransition({
    Key key,
    @required Animation<double> animation,
    @required this.pathBuilder,
    this.clipBehavior = Clip.antiAlias,
    this.child,
  })  : assert(animation != null),
        assert(pathBuilder != null),
        super(key: key, listenable: animation);

  /// The animation that controls the ClipPath of the child.
  Animation<double> get value => listenable as Animation<double>;

  // The path builder
  final PathBuilder pathBuilder;

  /// {@macro flutter.clipper.clipBehavior}
  ///
  /// Defaults to [Clip.antiAlias].
  final Clip clipBehavior;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.child}
  final Widget child;

  @override
  Widget build(BuildContext context) {
    print(clipBehavior);
    return ClipPath(
      child: child,
      clipBehavior: clipBehavior,
      clipper: PathBuilderClipper(
        value: value.value,
        pathBuilder: pathBuilder,
      ),
    );
  }
}
