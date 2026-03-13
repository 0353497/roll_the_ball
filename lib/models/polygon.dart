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
}
