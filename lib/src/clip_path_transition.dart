import 'package:flutter/widgets.dart';

import '../animated_clipper.dart';

/// Wraps a widget with [ClipPath] and Animates [clipper] with a [PathBuilder].
class ClipPathTransition extends AnimatedWidget {
  /// Creates a [ClipPathTransition].
  ///
  /// All the arguments other than [key] must be non-null.
  const ClipPathTransition({
    Key key,
    @required Animation<double> animation,
    this.pathBuilder = PathBuilders.slideUp,
    this.clipBehavior = Clip.antiAlias,
    this.child,
  })  : assert(animation != null),
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
