import 'package:animated_clipper/animated_clipper.dart';
import 'package:flutter/material.dart';

import 'animation_playhead.dart';
import 'simple_box.dart';

class ClipPathTransitionExample extends StatefulWidget {
  const ClipPathTransitionExample({
    Key key,
  }) : super(key: key);

  @override
  _ClipPathTransitionExampleState createState() =>
      _ClipPathTransitionExampleState();
}

class _ClipPathTransitionExampleState extends State<ClipPathTransitionExample>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  PathBuilder _pathBuilder = PathBuilders.slideUp;

  List<DropdownMenuItem<PathBuilder>> _allPathBuilders = [
    DropdownMenuItem(
      value: PathBuilders.slideUp,
      child: Text('slideUp'),
    ),
    DropdownMenuItem(
      value: PathBuilders.slideDown,
      child: Text('slideDown'),
    ),
    DropdownMenuItem(
      value: PathBuilders.slideLeft,
      child: Text('slideLeft'),
    ),
    DropdownMenuItem(
      value: PathBuilders.slideRight,
      child: Text('slideRight'),
    ),
    DropdownMenuItem(
      value: PathBuilders.splitVerticalIn,
      child: Text('splitVerticalIn'),
    ),
    DropdownMenuItem(
      value: PathBuilders.splitVerticalOut,
      child: Text('splitVerticalOut'),
    ),
    DropdownMenuItem(
      value: PathBuilders.splitHorizontalIn,
      child: Text('splitHorizontalIn'),
    ),
    DropdownMenuItem(
      value: PathBuilders.splitHorizontalOut,
      child: Text('splitHorizontalOut'),
    ),
    DropdownMenuItem(
      value: PathBuilders.circleIn,
      child: Text('circleIn'),
    ),
    DropdownMenuItem(
      value: PathBuilders.circleOut,
      child: Text('circleOut'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DropdownButton<PathBuilder>(
          value: _pathBuilder,
          icon: Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (PathBuilder newValue) {
            setState(() {
              _pathBuilder = newValue;
            });
          },
          items: _allPathBuilders,
        ),
        ClipPathTransition(
          animation: _controller.drive(CurveTween(curve: Curves.easeInOut)),
          pathBuilder: _pathBuilder,
          child: SimpleBox(
            text: 'SECOND',
            color: Colors.orange.shade200,
          ),
          // clipBehavior: Clip.antiAlias,
        ),
        AnimationPlayhead(
          controller: _controller,
        ),
      ],
    );

    /*

    // To demonstrate, we render the AnimatedClipStack with random params
    Color randomColor =
        Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    Curve curve = ClipPathTransitionExample
        ._curves[widget.value % ClipPathTransitionExample._curves.length];
    Duration randomDuration =
        Duration(milliseconds: Random().nextInt(1000) + 1000);
    PathBuilder pathBuilder = ClipPathTransitionExample._pathBuilders[
        widget.value % ClipPathTransitionExample._pathBuilders.length];
    // ...whenever the `child` is changed, the stack animates
    // ...we must use a `key` since the Widget type is the same
    return AnimatedClipReveal(
      child: SimpleBox(
        key: ValueKey<int>(widget.value),
        text: '${widget.value}',
        color: randomColor,
      ),
      // ...optional params
      duration: randomDuration,
      pathBuilder: pathBuilder,
      clipBehavior: Clip.antiAlias,
      curve: curve,
      revealFirstChild: true,
    );
    */
  }
}
