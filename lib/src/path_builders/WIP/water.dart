/*
import 'package:flutter/widgets.dart';

import '../path_builder.dart';

// To review
//  Potion Explosion (Game) - the fluid is is *just right*
//  https://www.programmersought.com/article/211595756/
//  https://medium.com/agileops/flutter-wave-clipper-animation-dc2017ddfcf3

class PathBuilderWater extends PathBuilder {
  @override
  Path buildPath(Size size, double value) {
    Path path = Path();
    path.lineTo(0.0, size.height - 20);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 40);

    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }
}
*/
