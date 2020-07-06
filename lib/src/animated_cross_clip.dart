import 'package:flutter/material.dart';

import '../animated_clipper.dart';
import 'path_builders/path_builder.dart';

// TODO - Refactor this to look / act more like AnimatedCrossFade
// TODO - Documentation
// TODO - Add a default pathBuilder and duration

enum AnimatedCrossClipState {
  showFirst,
  showSecond,
}

class AnimatedCrossClip extends StatefulWidget {
  final Widget firstChild;
  final Widget secondChild;
  final Duration duration;
  final PathBuilder pathBuilder;
  final AnimatedCrossClipState crossClipState;
  final Curve curve;
  final Clip clipBehavior;

  const AnimatedCrossClip({
    Key key,
    @required this.firstChild,
    @required this.secondChild,
    @required this.duration,
    @required this.pathBuilder,
    this.crossClipState = AnimatedCrossClipState.showFirst,
    this.clipBehavior = Clip.antiAlias,
    this.curve,
  }) : super(key: key);

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
        widget.crossClipState == AnimatedCrossClipState.showFirst ? 0 : 1;
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
        case AnimatedCrossClipState.showFirst:
          _controller.reverse();
          break;
        case AnimatedCrossClipState.showSecond:
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
