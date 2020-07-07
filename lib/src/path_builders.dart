// TODO - SlideAngle
// TODO - SplitAngle
// TODO - More circle fun - https://motionarray.com/after-effects-templates/10-circle-transitions-32553
// TODO - Water
// TODO - Can / Should we add a `center` property to the builders? - https://pub.dev/packages/circular_clip_route
// TODO - Review the `PhysicalShape` widget, can we swap for ClipRect to add elevation / shadows?

import 'path_builders/circle/circle.dart';
import 'path_builders/slide/slide_down.dart';
import 'path_builders/slide/slide_left.dart';
import 'path_builders/slide/slide_right.dart';
import 'path_builders/slide/slide_up.dart';
import 'path_builder.dart';
import 'path_builders/split/split_horizontal.dart';
import 'path_builders/split/split_vertical.dart';

/// A collection of pathBuilders
///
/// See also:
///
///  * [PathBuilder], the interface implemented by the constants available from
///    the [PathBuilders] class.
class PathBuilders {
  // This class is not meant to be instatiated or extended; this constructor
  // prevents instantiation and extension.
  // ignore: unused_element
  PathBuilders._();

  /// Slides up from the bottom
  static const PathBuilder slideUp = PathBuilderSlideUp();

  /// Slides down from the top
  static const PathBuilder slideDown = PathBuilderSlideDown();

  /// Slides left from the right
  static const PathBuilder slideLeft = PathBuilderSlideLeft();

  /// Slides right from the left
  static const PathBuilder slideRight = PathBuilderSlideRight();

  /// Like a curtain closing, time for bed
  static const PathBuilder splitVerticalIn =
      PathBuilderSplitVertical(invert: true);

  /// Like a curtain opening, hello beautiful day
  static const PathBuilder splitVerticalOut =
      PathBuilderSplitVertical(invert: false);

  /// Like the flying to the horizon and touching the sun with your mind
  static const PathBuilder splitHorizontalIn =
      PathBuilderSplitHorizontal(invert: true);

  /// Like a the sky and earth swallowing you whole
  static const PathBuilder splitHorizontalOut =
      PathBuilderSplitHorizontal(invert: false);

  /// Like running into a sewage pipe... ooh, sewage!
  static const PathBuilder circleIn = PathBuilderCircle(invert: true);

  /// Like running backwards out of a sewage pipe... ooh, fresh air!
  static const PathBuilder circleOut = PathBuilderCircle(invert: false);
}
