import 'package:flutter/widgets.dart';

import '../animated_clipper.dart';

/// Toggles between two widgets with an animated clip path
///
/// Used to toggle the on/off state of a single setting.
///
/// The ClipSwitch itself does not maintain any state. Instead, when the state
/// of the ClipSwitch changes, the widget calls the [onChanged] callback. Most
/// widgets that use a ClipSwitch will listen for the [onChanged] callback and
/// rebuild the ClipSwitch with a new [value] to toggle between widgets.
///
/// See also:
///
///  * [ClipPathTransition], which drives the [ClipSwitch]
class ClipSwitch extends StatelessWidget {
  const ClipSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.activeWidget,
    required this.inactiveWidget,
    this.duration = ClipSwitch.defaultDuration,
    this.pathBuilder = PathBuilders.slideUp,
    this.curve = Curves.linear,
    this.clipBehavior = Clip.antiAlias,
    this.fit = StackFit.loose,
  }) : super(key: key);

  /// Whether this ClipSwitch is active.
  ///
  /// This property must not be null.
  final bool value;

  /// Called when the user taps the ClipSwitch.
  ///
  /// The ClipSwitch passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the ClipSwitch with the new
  /// value.
  ///
  /// The callback provided to [onChanged] should update the state of the parent
  /// [StatefulWidget] using the [State.setState] method, so that the parent
  /// gets rebuilt; for example:
  ///
  /// ```dart
  /// ClipSwitch(
  ///   ...
  ///   value: _switchIsActive,
  ///   onChanged: (bool newValue) {
  ///     setState(() {
  ///       _switchIsActive = newValue;
  ///     });
  ///   },
  /// )
  /// ```
  final ValueChanged<bool> onChanged;

  /// The widget to show when this ClipSwitch value is [true].
  final Widget activeWidget;

  /// The widget to show when this ClipSwitch value is [false].
  final Widget inactiveWidget;

  /// The duration of the animation.
  ///
  /// Defaults to [ClipSwitch.defaultDuration].
  final Duration duration;

  /// The path builder
  ///
  /// Defaults to [PathBuilders.slideUp].
  final PathBuilder pathBuilder;

  /// The animation curve
  ///
  /// Defaults to [Curves.linear].
  final Curve curve;

  /// {@macro flutter.clipper.clipBehavior}
  ///
  /// Defaults to [Clip.antiAlias].
  final Clip clipBehavior;

  /// How to size the non-positioned [activeWidget] and [inactiveWidget].
  ///
  /// Defaults to [StackFit.loose]
  final StackFit fit;

  static const Duration defaultDuration = Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: AnimatedCrossClip(
        duration: duration,
        pathBuilder: pathBuilder,
        firstChild: inactiveWidget,
        secondChild: activeWidget,
        crossClipState:
            value ? CrossClipState.showSecond : CrossClipState.showFirst,
        curve: curve,
        clipBehavior: clipBehavior,
        fit: fit,
      ),
    );
  }
}
