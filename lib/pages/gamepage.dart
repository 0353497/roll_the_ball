import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/route_manager.dart';
import 'package:roll_the_ball/components/map_painter.dart';
import 'package:roll_the_ball/components/next_level_widget.dart';
import 'package:roll_the_ball/components/player_painter.dart';
import 'package:roll_the_ball/components/polygon_clipper.dart';
import 'package:roll_the_ball/components/restart_dialog.dart';
import 'package:roll_the_ball/components/rotating_wall.dart';
import 'package:roll_the_ball/models/game.dart';
import 'package:roll_the_ball/models/player.dart';
import 'package:roll_the_ball/models/rotating_wall.dart';
import 'package:sensors_plus/sensors_plus.dart';

class Gamepage extends StatefulWidget {
  const Gamepage({super.key, required this.game});
  final Game game;
  @override
  State<Gamepage> createState() => _GamepageState();
}

class _GamepageState extends State<Gamepage>
    with SingleTickerProviderStateMixin {
  static const double _maxPlayerSpeed = 28;
  static const double _frameMs = 16;
  static const double _wallNormalPush = 0.35;
  static const double _wallTangentialPush = 0.25;
  int attempts = 1;

  late final Ticker ticker;
  StreamSubscription<GyroscopeEvent>? _gyroSub;
  List<Rotatingwall> rotatingWalls = [];

  Player player = Player(
    color: Colors.red,
    position: Offset.zero,
    velocity: Offset.zero,
    radius: 16,
  );
  @override
  void initState() {
    super.initState();
    initGame();
  }

  void initGame() {
    player = player.copyWith(position: widget.game.playerStartPos);
    rotatingWalls = widget.game.rotatingWalls;
    setState(() {});
    ticker = createTicker(_onTick);
    ticker.start();

    _gyroSub = gyroscopeEventStream().listen((event) => _onGyroEvent(event));
  }

  void _onTick(dur) {
    if (widget.game.polygon.containsOffset(player.position)) {
      player = player.copyWith(color: Colors.green.shade900);
    } else {
      stopGame();
      player = player.copyWith(color: Colors.red);
      Get.dialog(
        barrierDismissible: false,

        RestartDialog(onResetTap: resetGame),
      );
      attempts++;
    }
    if ((player.position - widget.game.endHolePos).distanceSquared < 100) {
      stopGame();
      Get.dialog(
        NextLevelWidget(nextLevelIndex: widget.game.index, attempts: attempts),
        barrierDismissible: false,
      );
    }

    _applyRotatingWallForces();

    final double speed = player.velocity.distance;
    if (speed > _maxPlayerSpeed) {
      player = player.copyWith(
        velocity: player.velocity / speed * _maxPlayerSpeed,
      );
    }

    if (!player.playerOutMapBounds) {
      player = player.copyWith(position: player.position + player.velocity);
    }
    setState(() {});
  }

  void _applyRotatingWallForces() {
    Offset updatedPosition = player.position;
    Offset updatedVelocity = player.velocity;

    for (final wall in rotatingWalls) {
      final Offset wallStart = wall.bottomPoint;
      final Offset wallEnd = wall.topPoint;
      final Offset closest = _closestPointOnSegment(
        point: updatedPosition,
        segmentStart: wallStart,
        segmentEnd: wallEnd,
      );

      final Offset toBall = updatedPosition - closest;
      final double distance = toBall.distance;
      final double minDistance = player.radius + wall.width / 2;

      if (distance >= minDistance) {
        continue;
      }

      final Offset wallDirection = wallEnd - wallStart;
      Offset normal;
      if (distance > 0.0001) {
        normal = toBall / distance;
      } else {
        final double wallLength = wallDirection.distance;
        if (wallLength > 0.0001) {
          normal = Offset(-wallDirection.dy, wallDirection.dx) / wallLength;
        } else {
          normal = const Offset(0, -1);
        }
      }

      final double penetration = minDistance - distance;
      updatedPosition += normal * penetration;

      final double inwardVelocity = _dot(updatedVelocity, normal);
      if (inwardVelocity < 0) {
        updatedVelocity -= normal * inwardVelocity;
      }

      final double angularVelocity =
          wall.rotationForce * (wall.reverseRotation ? -1 : 1);
      final Offset radial = closest - wall.center;
      final Offset tangential =
          Offset(-radial.dy, radial.dx) * angularVelocity * _frameMs;

      updatedVelocity += normal * (penetration * _wallNormalPush);
      updatedVelocity += tangential * _wallTangentialPush;
    }

    player = player.copyWith(
      position: updatedPosition,
      velocity: updatedVelocity,
    );
  }

  Offset _closestPointOnSegment({
    required Offset point,
    required Offset segmentStart,
    required Offset segmentEnd,
  }) {
    final Offset segment = segmentEnd - segmentStart;
    final double segmentLengthSquared =
        segment.dx * segment.dx + segment.dy * segment.dy;

    if (segmentLengthSquared == 0) {
      return segmentStart;
    }

    final double projected =
        _dot(point - segmentStart, segment) / segmentLengthSquared;
    final double t = projected.clamp(0.0, 1.0);

    return segmentStart + segment * t;
  }

  double _dot(Offset a, Offset b) => a.dx * b.dx + a.dy * b.dy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Level ${widget.game.index}",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/bg.png', fit: BoxFit.cover),
          ),

          Positioned.fill(
            child: CustomPaint(
              painter: MapPainter(points: widget.game.polygon.points),
              child: ClipPath(
                clipper: PolygonClipper(points: widget.game.polygon.points),
                child: Image.asset(
                  "assets/bg-field.png",
                  repeat: ImageRepeat.repeatY,
                ),
              ),
            ),
          ),

          Positioned(
            top: widget.game.endHolePos.dy - 25,
            left: widget.game.endHolePos.dx - 25,
            child: Center(
              child: Image.asset("assets/hole.png", width: 50, height: 50),
            ),
          ),
          for (final wall in rotatingWalls) RotatingWall(wall: wall),

          Positioned.fill(
            child: CustomPaint(painter: PlayerPainter(player: player)),
          ),
        ],
      ),
    );
  }

  void stopGame() {
    if (ticker.isActive) {
      ticker.stop();
      setState(() {
        player = player.copyWith(velocity: Offset.zero);
      });
    }
  }

  void resetGame() {
    setState(() {
      ticker.stop();
      ticker.start();
      player = player.copyWith(
        position: widget.game.playerStartPos,
        velocity: Offset.zero,
      );
    });
  }

  void _onGyroEvent(GyroscopeEvent? event) {
    if (event == null) return;
    player = player.copyWith(
      velocity: player.velocity + Offset(event.y, event.x),
    );
  }

  @override
  void dispose() {
    _gyroSub?.cancel();
    ticker.dispose();
    super.dispose();
  }
}
