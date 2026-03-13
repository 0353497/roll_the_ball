import 'package:flutter/widgets.dart';
import 'package:roll_the_ball/models/polygon.dart';
import 'package:roll_the_ball/models/rotating_wall.dart';

class Game {
  final Offset playerStartPos;
  final Polygon polygon;
  final Offset endHolePos;
  final int index;
  final List<Rotatingwall> rotatingWalls;

  Game({
    required this.playerStartPos,
    required this.polygon,
    required this.endHolePos,
    required this.index,
    this.rotatingWalls = const [],
  });

  factory Game.fromSize(Size size) {
    const double padding = 64;
    final double left = padding;
    final double top = padding;
    final double right = size.width - padding;
    final double bottom = size.height - padding;

    final Polygon map = Polygon(
      points: [
        Offset(left, top),
        Offset(right, top),
        Offset(right, bottom),
        Offset(left, bottom),
      ],
    );

    return Game(
      index: 1,
      playerStartPos: Offset(size.width / 2, size.height * .8),
      polygon: map,
      endHolePos: Offset(size.width / 2, top + 48),
      rotatingWalls: [],
    );
  }
  factory Game.fromPoints({
    required int index,
    required List<Offset> points,
    required Offset playerStartPos,
    required Offset endHolePos,
    List<Rotatingwall>? rotatingWalls,
  }) {
    final Polygon map = Polygon(points: points);

    return Game(
      index: index,
      playerStartPos: playerStartPos,
      polygon: map,
      endHolePos: endHolePos,
      rotatingWalls: rotatingWalls ?? [],
    );
  }
}
