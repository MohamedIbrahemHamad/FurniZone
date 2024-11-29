import 'package:flutter/material.dart';

class RegisterCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    //double startPoint = size.height * .3;
    path.moveTo(0, 0);
    path.lineTo(0, size.height * .87);
    path.quadraticBezierTo(size.width * 1 / 20, size.height * 3 / 5,
        size.width * 2 / 5, size.height * 3 / 5);
    path.lineTo(size.width, size.height * 3 / 5);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
