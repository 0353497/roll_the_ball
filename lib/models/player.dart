import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Player {
  final Color color;
  final Offset position;
  final Offset velocity;
  final double radius;

  Player({
    required this.color,
    required this.position,
    required this.velocity,
    required this.radius,
  });

  bool get playerOutMapBounds {
    return position.dx < 10 ||
        position.dx > Get.width - 10 ||
        position.dy < 10 ||
        position.dy > Get.height;
  }

  Player copyWith({
    Color? color,
    Offset? position,
    Offset? velocity,
    double? radius,
  }) {
    return Player(
      color: color ?? this.color,
      position: position ?? this.position,
      velocity: velocity ?? this.velocity,
      radius: radius ?? this.radius,
    );
  }
}
