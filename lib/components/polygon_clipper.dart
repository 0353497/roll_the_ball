import 'package:flutter/material.dart';
import 'package:roll_the_ball/models/polygon.dart';

class PolygonClipper extends CustomClipper<Path> {
  Polygon polygon;

  PolygonClipper({super.reclip, required this.polygon});
  @override
  Path getClip(Size size) {
    if (polygon.points.isEmpty) {
      return Path()..addRect(Offset.zero & size);
    }

    final Path path = polygon.buildRoundedPath(12);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
