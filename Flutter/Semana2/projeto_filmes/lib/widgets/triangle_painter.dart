import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class TrianglePainter extends CustomPainter {
  final Color color;
  final double elevation;

  TrianglePainter({required this.color, this.elevation = 0});

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    final double baseWidth = size.width;
    final double triangleHeight = size.height;

    path.moveTo(size.width / 2, 0);
    path.lineTo(0, triangleHeight);
    path.lineTo(baseWidth, triangleHeight);
    path.close();

    final shadowPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.3)
      ..maskFilter = MaskFilter.blur(ui.BlurStyle.normal, elevation * 0.3);
    final shadowPath = path.shift(Offset(elevation * 0.2, elevation * 0.2));
    canvas.drawPath(shadowPath, shadowPaint);

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}