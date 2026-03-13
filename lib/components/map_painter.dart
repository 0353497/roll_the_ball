import 'package:flutter/material.dart';

class MapPainter extends CustomPainter {
  final List<Offset> points;

  MapPainter({super.repaint, required this.points});
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;
    final Paint borderPaint = Paint()
      ..color = const Color(0xff804f00)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    final Path path = Path();
    path.moveTo(points.first.dx, points.first.dy);
    for (var i = 0; i < points.length; i++) {
      final Offset point = points[i];
      path.lineTo(point.dx, point.dy);
    }

    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
