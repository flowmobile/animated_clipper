import 'package:flutter/widgets.dart';

import '../animated_clipper.dart';
import 'animated_cross_clip.dart';

class ClipSwitch extends StatelessWidget {
  const ClipSwitch({
    Key key,
    @required this.value,
    @required this.onChanged,
    @required this.activeWidget,
    @required this.inactiveWidget,
  }) : super(key: key);

  /// Whether this switch is on or off.
  ///
  /// This property must not be null.
  final bool value;

  /// Called when the user toggles the switch on or off.
  ///
  /// The switch passes the new value to the callback but does not actually
  /// change state until the parent widget rebuilds the switch with the new
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

  /// The widget to show when this switch is on.
  final Widget activeWidget;

  /// The widget to show when this switch is off.
  final Widget inactiveWidget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: AnimatedCrossClip(
        duration: Duration(milliseconds: 300),
        pathBuilder: PathBuilders.circleIn,
        firstChild: inactiveWidget,
        secondChild: activeWidget,
        crossClipState: value
            ? AnimatedCrossClipState.showSecond
            : AnimatedCrossClipState.showFirst,
        curve: Curves.easeInOut,
        clipBehavior: Clip.hardEdge,
      ),
    );
  }
}
