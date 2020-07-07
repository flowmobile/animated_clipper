import 'package:flutter/widgets.dart';

import '../animated_clipper.dart';
import 'path_builders/path_builder.dart';

AnimatedCrossFade t;

/// Specifies which of two children to show. See [AnimatedCrossClip].
enum CrossClipState {
  /// Show the first child ([AnimatedCrossClip.firstChild]).
  showFirst,

  /// Show the second child ([AnimatedCrossClip.secondChild]).
  showSecond,
}

/// A widget that does a an animated clip path reveal betweentwo given children.
///
/// The animation is controlled through the [crossClipState] parameter.
///
/// This widget is intended to be used to switch between a pair of widgets with
/// the same width and height.
///
/// The animation is automatically triggered when an existing
/// [AnimatedCrossClip] is rebuilt with a different value for the
/// [crossClipState] property.
///
/// See also:
///
///  * [AnimatedClipReveal], which animated between children.
///  * [ClipPathTransition], which [AnimatedCrossClip] uses to perform the
///    clip animation.
class AnimatedCrossClip extends StatefulWidget {
  /// Creates an [AnimatedCrossClip].
  ///
  /// All the arguments other than [key] must be non-null.
  const AnimatedCrossClip({
    Key key,
    @required this.firstChild,
    @required this.secondChild,
    this.crossClipState = CrossClipState.showFirst,
    this.duration = AnimatedCrossClip.defaultDuration,
    this.pathBuilder = PathBuilders.slideUp,
    this.curve = Curves.linear,
    this.clipBehavior = Clip.antiAlias,
  }) : super(key: key);

  /// The child that is visible when [crossClipState] is
  /// [CrossClipState.showFirst].
  final Widget firstChild;

  /// The child that is visible when [crossClipState] is
  /// [CrossClipState.showSecond].
  final Widget secondChild;

  /// The duration of the animation.
  ///
  /// Defaults to [AnimatedCrossClip.defaultDuration].
  final Duration duration;

  /// The path builder
  ///
  /// Defaults to [PathBuilders.slideUp].
  final PathBuilder pathBuilder;

  /// The animation curve
  ///
  /// Defaults to [Curves.linear].
  final Curve curve;

  /// The clipBehavior of the [ClipPathTransition] applied to the new [child].
  ///
  /// {@macro flutter.clipper.clipBehavior}
  ///
  /// Defaults to [Clip.antiAlias].
  final Clip clipBehavior;

  /// The child that will be shown when the animation has completed.
  final CrossClipState crossClipState;

  static const Duration defaultDuration = Duration(milliseconds: 300);

  @override
  _AnimatedCrossClipState createState() => _AnimatedCrossClipState();
}

class _AnimatedCrossClipState extends State<AnimatedCrossClip>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _controller.value =
        widget.crossClipState == CrossClipState.showFirst ? 0 : 1;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(AnimatedCrossClip oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.crossClipState != oldWidget.crossClipState) {
      switch (widget.crossClipState) {
        case CrossClipState.showFirst:
          _controller.reverse();
          break;
        case CrossClipState.showSecond:
          _controller.forward();
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        widget.firstChild,
        ClipPathTransition(
          animation: _controller.drive(CurveTween(curve: widget.curve)),
          pathBuilder: widget.pathBuilder,
          child: widget.secondChild,
          clipBehavior: widget.clipBehavior,
        ),
      ],
    );
  }
}
