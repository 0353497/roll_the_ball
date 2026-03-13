import 'package:flutter/material.dart';

class Polygon {
  final List<Offset> points;

  Polygon({required this.points}) {
    if (points.length < 3) throw "Polygon needs atleast 3 points";
    //add first to last bc of path.draw later
    points.add(points.first);
  }

  bool containsOffset(Offset point) {
    int crossingCount = 0;
    int vertexCount = points.length;

    for (int i = 0; i < vertexCount; i++) {
      Offset edgeStart = points[i];
      Offset edgeEnd = points[(i + 1) % vertexCount];

      // Determine if point.y is between the edge's y-coordinates
      bool isPointBetweenEdgeYs =
          (edgeStart.dy > point.dy) != (edgeEnd.dy > point.dy);

      if (isPointBetweenEdgeYs) {
        double edgeDeltaX = edgeEnd.dx - edgeStart.dx;
        double edgeDeltaY = edgeEnd.dy - edgeStart.dy;

        double slopeOfEdge = edgeDeltaX / edgeDeltaY;

        double distanceFromEdgeStartToPointY = point.dy - edgeStart.dy;

        double intersectionX =
            edgeStart.dx + (slopeOfEdge * distanceFromEdgeStartToPointY);

        bool isIntersectionRightOfPoint = point.dx < intersectionX;

        if (isIntersectionRightOfPoint) {
          crossingCount++;
        }
      }
    }

    bool isInside = (crossingCount % 2 == 1);
    return isInside;
  }

  Path buildRoundedPath(double radius) {
    final Path path = Path();
    final List<Offset> vertices =
        points.length > 1 && points.first == points.last
        ? points.sublist(0, points.length - 1)
        : points;

    if (vertices.length < 3) {
      if (vertices.isNotEmpty) {
        path.moveTo(vertices.first.dx, vertices.first.dy);
        for (var i = 1; i < vertices.length; i++) {
          path.lineTo(vertices[i].dx, vertices[i].dy);
        }
      }
      return path;
    }

    for (var i = 0; i < vertices.length; i++) {
      final prev = vertices[(i - 1 + vertices.length) % vertices.length];
      final curr = vertices[i];
      final next = vertices[(i + 1) % vertices.length];

      final toPrev = prev - curr;
      final toNext = next - curr;
      final prevLen = toPrev.distance;
      final nextLen = toNext.distance;

      if (prevLen == 0 || nextLen == 0) {
        continue;
      }

      final double r = radius.clamp(
        0.0,
        (prevLen < nextLen ? prevLen : nextLen) / 2,
      );

      final start = curr + toPrev / prevLen * r;
      final end = curr + toNext / nextLen * r;

      if (i == 0) {
        path.moveTo(start.dx, start.dy);
      } else {
        path.lineTo(start.dx, start.dy);
      }

      path.quadraticBezierTo(curr.dx, curr.dy, end.dx, end.dy);
    }

    path.close();
    return path;
  }
}
