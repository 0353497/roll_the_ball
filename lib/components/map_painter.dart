import 'package:flutter/material.dart';
import 'package:roll_the_ball/models/polygon.dart';

class MapPainter extends CustomPainter {
  Polygon polygon;
  final double cornerRadius;

  MapPainter({super.repaint, required this.polygon, this.cornerRadius = 24});
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;
    final Paint borderPaint = Paint()
      ..color = const Color(0xff804f00)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    final Path path = polygon.buildRoundedPath(16);

    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
