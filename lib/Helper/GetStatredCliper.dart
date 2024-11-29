import 'package:flutter/material.dart';

class GetStatredCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double startPoint = size.height * .3;
    path.moveTo(0, startPoint);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.width);
    path.lineTo(0, startPoint);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
