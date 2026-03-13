import 'dart:math';

import 'package:flutter/material.dart';
import 'package:roll_the_ball/models/rotating_wall.dart';

class RotatingWall extends StatefulWidget {
  const RotatingWall({super.key, required this.wall});

  final Rotatingwall wall;

  @override
  State<RotatingWall> createState() => _RotatingWallState();
}

class _RotatingWallState extends State<RotatingWall>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.wall.singleRotationDuration,
    )..repeat();
    _rotationAnimation = Tween<double>(
      begin: 0,
      end: pi * 2,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.wall.position.dx - (widget.wall.width / 2),
      top: widget.wall.position.dy - (widget.wall.length / 2),
      child: AnimatedBuilder(
        animation: _rotationAnimation,
        builder: (context, child) {
          final double angle = widget.wall.reverseRotation
              ? -_rotationAnimation.value
              : _rotationAnimation.value;
          widget.wall.currentRotation = angle;
          return Transform.rotate(
            angle: angle,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xff804F00),
              ),
              width: widget.wall.width,
              height: widget.wall.length,
              child: Center(
                child: Container(
                  width: widget.wall.width * .5,
                  height: widget.wall.width * .5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
