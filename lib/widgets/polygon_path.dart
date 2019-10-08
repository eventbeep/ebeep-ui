import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class PolygonPathDrawer {
  PolygonPathDrawer({
    @required this.size,
    @required this.specs,
  }) : path = Path();

  final Path path;
  final Size size;
  final PolygonPathSpecs specs;

  Path draw() {
    final double anglePerSide = 360 / specs.sides;

    final double radius = (size.width - specs.borderRadiusAngle) / 2;
    final double arcLength =
        (radius * _angleToRadian(specs.borderRadiusAngle)) + (specs.sides * 2);

    final Path path = Path();

    for (int i = 0; i <= specs.sides; i++) {
      final double currentAngle = anglePerSide * i;
      final bool isFirst = i == 0;

      if (specs.borderRadiusAngle > 0) {
        _drawLineAndArc(path, currentAngle, radius, arcLength, isFirst);
      } else {
        _drawLine(path, currentAngle, radius, isFirst);
      }
    }

    return path;
  }

  void _drawLine(Path path, double currentAngle, double radius, bool move) {
    final Offset current = _getOffset(currentAngle, radius);

    if (move)
      path.moveTo(current.dx, current.dy);
    else
      path.lineTo(current.dx, current.dy);
  }

  void _drawLineAndArc(Path path, double currentAngle, double radius,
      double arcLength, bool isFirst) {
    final double prevAngle = currentAngle - specs.halfBorderRadiusAngle;
    final double nextAngle = currentAngle + specs.halfBorderRadiusAngle;

    final Offset previous = _getOffset(prevAngle, radius);
    final Offset next = _getOffset(nextAngle, radius);

    if (isFirst) {
      path.moveTo(next.dx, next.dy);
    } else {
      path.lineTo(previous.dx, previous.dy);
      path.arcToPoint(next, radius: Radius.circular(arcLength));
    }
  }

  double _angleToRadian(double angle) {
    return angle * (pi / 180);
  }

  Offset _getOffset(double angle, double radius) {
    final double rotationAwareAngle = angle - 90 + specs.rotate;

    final double radian = _angleToRadian(rotationAwareAngle);
    final double x =
        cos(radian) * radius + radius + specs.halfBorderRadiusAngle;
    final double y =
        sin(radian) * radius + radius + specs.halfBorderRadiusAngle;

    return Offset(x, y);
  }
}

class PolygonPathSpecs {
  PolygonPathSpecs({
    @required this.sides,
    @required this.rotate,
    @required this.borderRadiusAngle,
  }) : halfBorderRadiusAngle = borderRadiusAngle / 2;

  final int sides;
  final double rotate;
  final double borderRadiusAngle;
  final double halfBorderRadiusAngle;
}
