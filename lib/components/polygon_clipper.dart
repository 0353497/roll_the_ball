import 'package:flutter/material.dart';

class PolygonClipper extends CustomClipper<Path> {
  final List<Offset> points;

  PolygonClipper({super.reclip, required this.points});
  @override
  Path getClip(Size size) {
    if (points.isEmpty) {
      return Path()..addRect(Offset.zero & size);
    }

    final Path path = Path()..moveTo(points.first.dx, points.first.dy);
    for (final Offset point in points.skip(1)) {
      path.lineTo(point.dx, point.dy);
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
