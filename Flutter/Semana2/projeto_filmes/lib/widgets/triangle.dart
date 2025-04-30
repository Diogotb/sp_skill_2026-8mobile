import 'package:flutter/material.dart';
import 'package:projeto_filmes/widgets/triangle_painter.dart';

class Triangle extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  final double elevation;

  const Triangle({Key? key, required this.color, this.width = 100, this.height = 100, this.elevation = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: TrianglePainter(color: color, elevation: elevation),
      ),
    );
  }
}