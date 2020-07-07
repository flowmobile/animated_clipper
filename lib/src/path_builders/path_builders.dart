// TODO - Documentation
// TODO - SlideAngle
// TODO - Split(In|Out)Angle
// TODO - More circle fun - https://motionarray.com/after-effects-templates/10-circle-transitions-32553
// TODO - Water
// TODO - Can / Should we add a `center` property to the builders? - https://pub.dev/packages/circular_clip_route

import 'circle/circle.dart';
import 'slide/slide_down.dart';
import 'slide/slide_left.dart';
import 'slide/slide_right.dart';
import 'slide/slide_up.dart';
import 'path_builder.dart';
import 'split/split_horizontal.dart';
import 'split/split_vertical.dart';

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
      PathBuilderSplitHorizontal(invert: false);

  /// Like a the sky and earth swallowing you whole
  static const PathBuilder splitHorizontalOut =
      PathBuilderSplitHorizontal(invert: true);

  /// Like running into a sewage pipe... ooh, sewage!
  static const PathBuilder circleIn = PathBuilderCircle(invert: false);

  /// Like running backwards out of a sewage pipe... ooh, fresh air!
  static const PathBuilder circleOut = PathBuilderCircle(invert: true);
}
