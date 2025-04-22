import 'package:flutter/material.dart';

import 'arc_clipper.dart';

class CurvedContainer extends StatelessWidget {
  final Widget child;
  final double curveHeight;
  final Color color;

  const CurvedContainer({Key? key, required this.child, this.curveHeight = 50.0, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ArcClipper(curveHeight: curveHeight),
      child: Container(
        color: color,
        padding: const EdgeInsets.only(bottom: 100),
        child: child,
      ),
    );
  }
}