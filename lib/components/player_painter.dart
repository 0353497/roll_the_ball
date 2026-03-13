import 'package:flutter/material.dart';
import 'package:roll_the_ball/models/player.dart';

class PlayerPainter extends CustomPainter {
  final Player player;

  PlayerPainter({super.repaint, required this.player});
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = player.color
      ..style = PaintingStyle.fill;

    canvas.drawCircle(player.position, player.radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
