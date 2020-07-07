// TODO - Documentation
// TODO - SlideAngle
// TODO - Split(In|Out)Angle
// TODO - Consider a generic `inverse` - see circleOut - this could work for splitXOut
// TODO - More circle fun - https://motionarray.com/after-effects-templates/10-circle-transitions-32553
// TODO - Water
// TODO - Can / Should we add a `center` property to the builders? - https://pub.dev/packages/circular_clip_route

import 'circle/circle_in.dart';
import 'circle/circle_out.dart';
import 'slide/slide_down.dart';
import 'slide/slide_left.dart';
import 'slide/slide_right.dart';
import 'slide/slide_up.dart';
import 'path_builder.dart';
import 'split/split_horizontal_in.dart';
import 'split/split_horizontal_out.dart';
import 'split/split_vertical_in.dart';
import 'split/split_vertical_out.dart';

class PathBuilders {
  // This class is not meant to be instatiated or extended; this constructor
  // prevents instantiation and extension.
  // ignore: unused_element
  PathBuilders._();

  static const PathBuilder slideUp = PathBuilderSlideUp();
  static const PathBuilder slideDown = PathBuilderSlideDown();
  static const PathBuilder slideLeft = PathBuilderSlideLeft();
  static const PathBuilder slideRight = PathBuilderSlideRight();
  static const PathBuilder splitHorizontalIn = PathBuilderSplitHorizontalIn();
  static const PathBuilder splitHorizontalOut = PathBuilderSplitHorizontalOut();
  static const PathBuilder splitVerticalIn = PathBuilderSplitVerticalIn();
  static const PathBuilder splitVerticalOut = PathBuilderSplitVerticalOut();
  static const PathBuilder circleIn = PathBuilderCircleIn();
  static const PathBuilder circleOut = PathBuilderCircleOut();
}
