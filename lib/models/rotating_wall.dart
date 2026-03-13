import 'package:flutter/rendering.dart';
import 'dart:math' as math;

class Rotatingwall {
  final Offset position;
  final bool reverseRotation;
  final Duration singleRotationDuration;
  final double length;
  final double width;

  //0-2pi
  double currentRotation;

  Rotatingwall({
    required this.position,
    required this.singleRotationDuration,
    this.currentRotation = 0,
    this.length = 100,
    this.width = 10,
    this.reverseRotation = false,
  });
  Offset get center => position;

  Offset get topPoint {
    final double halfLength = length / 2;
    return Offset(
      center.dx + math.sin(currentRotation) * halfLength,
      center.dy - math.cos(currentRotation) * halfLength,
    );
  }

  Offset get bottomPoint {
    final double halfLength = length / 2;
    return Offset(
      center.dx - math.sin(currentRotation) * halfLength,
      center.dy + math.cos(currentRotation) * halfLength,
    );
  }

  double get rotationForce {
    return (2 * math.pi) / singleRotationDuration.inMilliseconds;
  }
}
