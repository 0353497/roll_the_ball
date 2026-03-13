import 'dart:ui';

import 'package:get/get_utils/src/extensions/export.dart';
import 'package:get/route_manager.dart';
import 'package:roll_the_ball/models/game.dart';
import 'package:roll_the_ball/models/polygon.dart';
import 'package:roll_the_ball/models/rotating_wall.dart';

List<Game> levels = [
  Game.fromSize(Size(Get.width - 24, Get.height - 128)),
  Game(
    index: 2,
    playerStartPos: Offset(Get.width * .5, Get.height * .6),
    polygon: Polygon(
      points: [
        Offset(32, 100),
        Offset(Get.width * .4, Get.height * .5),
        Offset(32, Get.height - 100),
        Offset(Get.width - 32, Get.height - 100),
        Offset(Get.width * .6, Get.height * .5),
        Offset(Get.width - 32, 100),
      ],
    ),
    endHolePos: Offset(Get.width * .5, Get.height * .15),
  ),
  Game(
    index: 3,
    playerStartPos: Offset(Get.width * .7, Get.height * .75),
    polygon: Polygon(
      points: [
        Offset(32, 100),
        Offset(32, Get.height - 100),
        Offset(Get.width - 32, Get.height - 100),
        Offset(Get.width - 32, Get.height * .5),
        Offset(Get.width * .4, Get.height * .5),
        Offset(Get.width * .4, Get.height * .3),
        Offset(Get.width - 32, Get.height * .3),
        Offset(Get.width - 32, 100),
      ],
    ),
    rotatingWalls: [
      Rotatingwall(
        position: Offset(Get.width * .5, Get.height * .6),
        singleRotationDuration: 5.seconds,
        length: 150,
      ),
    ],
    endHolePos: Offset(Get.width * .7, Get.height * .2),
  ),
  Game(
    index: 4,
    playerStartPos: Offset(Get.width * .5, Get.height * .8),
    polygon: Polygon(
      points: [
        Offset(32, 100),
        Offset(32, Get.height * .3),
        Offset(Get.width * .5, Get.height * .7),
        Offset(32, Get.height * .7),
        Offset(32, Get.height - 100),
        Offset(Get.width - 32, Get.height - 100),
        Offset(Get.width - 32, Get.height * .7),
        Offset(Get.width * .5, Get.height * .3),
        Offset(Get.width - 32, Get.height * .3),
        Offset(Get.width - 32, 100),
      ],
    ),
    endHolePos: Offset(Get.width * .7, Get.height * .2),
    rotatingWalls: [
      Rotatingwall(
        position: Offset(Get.width * .3, Get.height * .8),
        singleRotationDuration: 3.seconds,
        length: 100,
      ),
      Rotatingwall(
        position: Offset(Get.width * .3, Get.height * .2),
        singleRotationDuration: 3.seconds,
        length: 130,
        reverseRotation: true,
      ),
    ],
  ),
  Game(
    index: 5,
    playerStartPos: Offset(Get.width * .8, Get.height * .85),
    polygon: Polygon(
      points: [
        Offset(32, 100),
        Offset(32, Get.height - 100),
        Offset(Get.width - 32, Get.height - 100),
        Offset(Get.width - 32, Get.height * .8),
        Offset(Get.width * .2, Get.height * .8),
        Offset(Get.width * .2, Get.height * .3),
        Offset(Get.width * .4, Get.height * .3),
        Offset(Get.width * .4, Get.height * .65),
        Offset(Get.width - 32, Get.height * .65),
        Offset(Get.width - 32, 100),
      ],
    ),
    endHolePos: Offset(Get.width * .7, Get.height * .6),
    rotatingWalls: [
      Rotatingwall(
        position: Offset(Get.width * .75, Get.height * .18),
        singleRotationDuration: 3.seconds,
        length: 150,
      ),
    ],
  ),
  Game(
    index: 6,
    playerStartPos: Offset(Get.width * .8, Get.height * .85),
    polygon: Polygon(
      points: [
        Offset(32, 100),
        Offset(32, Get.height - 100),
        Offset(Get.width - 32, Get.height - 100),
        Offset(Get.width - 32, Get.height * .8),
        Offset(Get.width * .2, Get.height * .8),
        Offset(Get.width * .2, Get.height * .3),
        Offset(Get.width * .4, Get.height * .3),
        Offset(Get.width * .4, Get.height * .65),
        Offset(Get.width - 32, Get.height * .65),
        Offset(Get.width - 32, 100),
      ],
    ),
    endHolePos: Offset(Get.width * .7, Get.height * .6),
    rotatingWalls: [
      Rotatingwall(
        position: Offset(Get.width * .75, Get.height * .18),
        singleRotationDuration: 3.seconds,
        length: 200,
      ),
      Rotatingwall(
        position: Offset(Get.width * .25, Get.height * .6),
        singleRotationDuration: 2.seconds,
        length: 200,
      ),
    ],
  ),

  Game(
    index: 7,
    playerStartPos: Offset(Get.width * .82, 140),
    polygon: Polygon(
      points: LevelHelper.drawZ(
        Rect.fromLTWH(32, 100, Get.width - 64, Get.height - 200),
        32,
      ),
    ),
    endHolePos: Offset(Get.width * .18, Get.height - 140),
    rotatingWalls: [
      Rotatingwall(
        position: Offset(Get.width * .5, Get.height * .45),
        singleRotationDuration: 4.seconds,
        length: 180,
      ),
      Rotatingwall(
        position: Offset(Get.width * .35, Get.height * .75),
        singleRotationDuration: 3.seconds,
        length: 140,
        reverseRotation: true,
      ),
    ],
  ),
  Game(
    index: 8,
    playerStartPos: Offset(Get.width * .78, Get.height * .85),
    polygon: Polygon(
      points: [
        Offset(32, 100),
        Offset(32, Get.height - 100),
        Offset(Get.width - 32, Get.height - 100),
        Offset(Get.width - 32, Get.height * .74),
        Offset(Get.width * .72, Get.height * .74),
        Offset(Get.width * .72, Get.height * .60),
        Offset(Get.width - 32, Get.height * .60),
        Offset(Get.width - 32, Get.height * .40),
        Offset(Get.width * .52, Get.height * .40),
        Offset(Get.width * .52, Get.height * .26),
        Offset(Get.width - 32, Get.height * .26),
        Offset(Get.width - 32, 100),
      ],
    ),
    endHolePos: Offset(Get.width * .86, Get.height * .18),
    rotatingWalls: [
      Rotatingwall(
        position: Offset(Get.width * .3, Get.height * .5),
        singleRotationDuration: 1.seconds,
        length: Get.width * .5,
        reverseRotation: true,
      ),
      Rotatingwall(
        position: Offset(Get.width * .7, Get.height * .5),
        singleRotationDuration: 3.seconds,
        length: Get.width * .3,
      ),
      Rotatingwall(
        position: Offset(Get.width * .3, Get.height * .15),
        singleRotationDuration: 1.seconds,
        length: Get.width * .4,
      ),
    ],
  ),
  Game(
    index: 9,
    playerStartPos: Offset(Get.width * .5, Get.height * .86),
    polygon: Polygon(
      points: [
        Offset(32, 100),
        Offset(32, Get.height * .24),
        Offset(Get.width * .52, Get.height * .62),
        Offset(32, Get.height * .62),
        Offset(32, Get.height - 100),
        Offset(Get.width - 32, Get.height - 100),
        Offset(Get.width - 32, Get.height * .62),
        Offset(Get.width * .48, Get.height * .24),
        Offset(Get.width - 32, Get.height * .24),
        Offset(Get.width - 32, 100),
      ],
    ),
    endHolePos: Offset(Get.width * .5, Get.height * .15),
    rotatingWalls: [
      Rotatingwall(
        position: Offset(Get.width * .25, Get.height * .78),
        singleRotationDuration: 3.seconds,
        length: 150,
      ),
      Rotatingwall(
        position: Offset(Get.width * .75, Get.height * .78),
        singleRotationDuration: 3.seconds,
        length: 150,
        reverseRotation: true,
      ),
      Rotatingwall(
        position: Offset(Get.width * .5, Get.height * .46),
        singleRotationDuration: 2.seconds,
        length: 170,
      ),
    ],
  ),
  Game(
    index: 10,
    playerStartPos: Offset(Get.width * .82, Get.height * .86),
    polygon: Polygon(
      points: [
        Offset(32, 100),
        Offset(32, Get.height - 100),
        Offset(Get.width - 32, Get.height - 100),
        Offset(Get.width - 32, Get.height * .84),
        Offset(Get.width * .18, Get.height * .84),
        Offset(Get.width * .18, Get.height * .32),
        Offset(Get.width * .38, Get.height * .32),
        Offset(Get.width * .38, Get.height * .68),
        Offset(Get.width - 32, Get.height * .68),
        Offset(Get.width - 32, 100),
      ],
    ),
    endHolePos: Offset(Get.width * .7, Get.height * .6),
    rotatingWalls: [
      Rotatingwall(
        position: Offset(Get.width * .65, Get.height * .2),
        singleRotationDuration: 2.seconds,
        length: 190,
      ),
      Rotatingwall(
        position: Offset(Get.width * .28, Get.height * .6),
        singleRotationDuration: 2.seconds,
        length: 210,
      ),
      Rotatingwall(
        position: Offset(Get.width * .55, Get.height * .76),
        singleRotationDuration: 3.seconds,
        length: 150,
      ),
    ],
  ),
  Game(
    index: 11,
    playerStartPos: Offset(Get.width * .5, Get.height * .86),
    polygon: Polygon(
      points: [
        Offset(32, 100),
        Offset(32, Get.height - 100),
        Offset(Get.width - 32, Get.height - 100),
        Offset(Get.width - 32, 100),
      ],
    ),
    endHolePos: Offset(Get.width * .5, 150),
    rotatingWalls: [
      Rotatingwall(
        position: Offset(Get.width * .5, Get.height * .7),
        singleRotationDuration: 2.seconds,
        length: 220,
      ),
      Rotatingwall(
        position: Offset(Get.width * .3, Get.height * .56),
        singleRotationDuration: 2.seconds,
        length: 170,
        reverseRotation: true,
      ),
      Rotatingwall(
        position: Offset(Get.width * .7, Get.height * .56),
        singleRotationDuration: 2.seconds,
        length: 170,
      ),
      Rotatingwall(
        position: Offset(Get.width * .5, Get.height * .36),
        singleRotationDuration: 1.seconds,
        length: 210,
        reverseRotation: true,
      ),
    ],
  ),
  Game(
    index: 12,
    playerStartPos: Offset(Get.width * .2, 140),
    polygon: Polygon(
      points: LevelHelper.drawZ(
        Rect.fromLTWH(32, 100, Get.width - 64, Get.height - 200),
        40,
      ),
    ),
    endHolePos: Offset(Get.width * .8, Get.height - 140),
    rotatingWalls: [
      Rotatingwall(
        position: Offset(Get.width * .6, Get.height * .55),
        singleRotationDuration: 5.seconds,
        length: 300,
        reverseRotation: true,
      ),
    ],
  ),
];

class LevelHelper {
  static List<Offset> drawRect(Rect rect) {
    return [
      Offset(rect.left, rect.top),
      Offset(rect.left, rect.bottom),
      Offset(rect.right, rect.bottom),
      Offset(rect.right, rect.top),
    ];
  }

  static List<Offset> generatePath({
    required Offset lastPosition,
    required Offset targetPosition,
    required double pathWidth,
  }) {
    final delta = targetPosition - lastPosition;
    final distance = delta.distance;

    if (distance == 0) {
      return List.generate(4, (_) => lastPosition);
    }

    final normal = Offset(-delta.dy / distance, delta.dx / distance);
    final halfWidth = pathWidth * .5;

    final startLeft = lastPosition + normal * halfWidth;
    final startRight = lastPosition - normal * halfWidth;
    final endLeft = targetPosition + normal * halfWidth;
    final endRight = targetPosition - normal * halfWidth;

    return [startLeft, startRight, endRight, endLeft];
  }

  static List<Offset> drawZ(Rect size, double pathWidth) {
    final halfWidth = pathWidth * .5;
    final margin = pathWidth;

    final topLeft = Offset(size.left + margin, size.top + margin);
    final topRight = Offset(size.right - margin, size.top + margin);
    final bottomLeft = Offset(size.left + margin, size.bottom - margin);
    final bottomRight = Offset(size.right - margin, size.bottom - margin);

    final centerLine = [topLeft, topRight, bottomLeft, bottomRight];

    Offset normalize(Offset vector) {
      final length = vector.distance;
      if (length == 0) return Offset.zero;
      return Offset(vector.dx / length, vector.dy / length);
    }

    Offset leftNormal(Offset start, Offset end) {
      final direction = normalize(end - start);
      return Offset(-direction.dy, direction.dx);
    }

    Offset lineIntersection(Offset a1, Offset a2, Offset b1, Offset b2) {
      final r = a2 - a1;
      final s = b2 - b1;
      final denominator = r.dx * s.dy - r.dy * s.dx;

      if (denominator.abs() < 1e-6) {
        return a2;
      }

      final diff = b1 - a1;
      final t = (diff.dx * s.dy - diff.dy * s.dx) / denominator;
      return a1 + r * t;
    }

    List<Offset> buildSide(double sideSign) {
      final sidePoints = <Offset>[];
      final normals = <Offset>[];

      for (int i = 0; i < centerLine.length - 1; i++) {
        normals.add(leftNormal(centerLine[i], centerLine[i + 1]) * sideSign);
      }

      sidePoints.add(centerLine.first + normals.first * halfWidth);

      for (int i = 1; i < centerLine.length - 1; i++) {
        final prevDirection = normalize(centerLine[i] - centerLine[i - 1]);
        final nextDirection = normalize(centerLine[i + 1] - centerLine[i]);

        final prevOffsetStart = centerLine[i - 1] + normals[i - 1] * halfWidth;
        final prevOffsetEnd = centerLine[i] + normals[i - 1] * halfWidth;
        final nextOffsetStart = centerLine[i] + normals[i] * halfWidth;
        final nextOffsetEnd = centerLine[i + 1] + normals[i] * halfWidth;

        final isParallel =
            (prevDirection.dx * nextDirection.dy -
                    prevDirection.dy * nextDirection.dx)
                .abs() <
            1e-6;

        if (isParallel) {
          sidePoints.add(prevOffsetEnd);
        } else {
          sidePoints.add(
            lineIntersection(
              prevOffsetStart,
              prevOffsetEnd,
              nextOffsetStart,
              nextOffsetEnd,
            ),
          );
        }
      }

      sidePoints.add(centerLine.last + normals.last * halfWidth);
      return sidePoints;
    }

    final leftSide = buildSide(1);
    final rightSide = buildSide(-1).reversed.toList();

    return [...leftSide, ...rightSide];
  }
}
