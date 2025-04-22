import 'package:flutter/material.dart';

class ArcClipper extends CustomClipper<Path> {
  final double curveHeight;

  ArcClipper({this.curveHeight = 50.0});

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - curveHeight);

    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - curveHeight,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}