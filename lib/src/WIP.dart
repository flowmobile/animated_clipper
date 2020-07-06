/// Signature for builders used to generate custom transitions for
/// [AnimatedSwitcher].
///
/// The `child` should be transitioning in when the `animation` is running in
/// the forward direction.
///
/// The function should return a widget which wraps the given `child`. It may
/// also use the `animation` to inform its transition. It must not return null.
typedef PathBuilder2 = Path Function(Size size, Animation<double> animation);

class PathBuilders {
  Path slideDown(Size size, Animation<double> animation) {
    return Path()
      ..addRect(Rect.fromLTWH(
        0,
        0,
        size.width,
        size.height * animation.value,
      ));
  }
}

extension SlideDown on PathBuilders {}
/*
(Widget child, Animation<double> animation) {
              return ClipPathTransition(
                value: animation,
                child: child,
                pathBuilder: PathBuilderSplitHorizontalOut(),
              );
            },
            */
