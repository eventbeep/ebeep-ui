import 'dart:math';

import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:flutter/material.dart';
import 'utils.dart';

class BeepBadge extends StatelessWidget {
  const BeepBadge({
    Key key,
    @required this.icon,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Center(child: Icon(icon)),
      painter: BadgePainter(),
    );
  }
}

SizeUtil get _sizeUtil {
  return SizeUtil.getInstance(key: SizeKeyConst.ROUND_ANGLE_KEY);
}

class BadgePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = BeepColors.primary
      ..isAntiAlias = true;
    final List<Point<double>> list1 = <Point<double>>[
      const Point<double>(250.0, 0.0),
      const Point<double>(425.0, 75.0),
      const Point<double>(500.0, 250.0),
      const Point<double>(425.0, 425.0),
      const Point<double>(250.0, 500.0),
      const Point<double>(75.0, 426.0),
      const Point<double>(0.0, 250.0),
      const Point<double>(75.0, 75.0),
    ];
    paint.color = BeepColors.primary;
    _drawWithPoint(canvas, paint, list1);
    /*
    if (size.width > 1.0 && size.height > 1.0) {
      print('>1.9');
      _sizeUtil.logicSize = size;
    }
    final Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..color = BeepColors.primary250
      ..isAntiAlias = true;
    final List<Point<double>> list1 = <Point<double>>[
      const Point<double>(250.0, 0.0),
      const Point<double>(425.0, 75.0),
      const Point<double>(500.0, 250.0),
      const Point<double>(425.0, 425.0),
      const Point<double>(250.0, 500.0),
      const Point<double>(75.0, 426.0),
      const Point<double>(0.0, 250.0),
      const Point<double>(75.0, 75.0),
    ];
    paint.color = BeepColors.primary500;
    _drawWithPoint(canvas, paint, list1);
    final List<Point<double>> list2 = <Point<double>>[
      const Point<double>(250.0, 53.0),
      const Point<double>(392.0, 108.0),
      const Point<double>(449.0, 250.0),
      const Point<double>(392.0, 390.0),
      const Point<double>(250.0, 448.0),
      const Point<double>(110.0, 390.0),
      const Point<double>(54.0, 250.0),
      const Point<double>(110.0, 108.0),
    ];
    paint.color = BeepColors.primary750;
    _drawWithPoint(canvas, paint, list2, hasShadow: true);

    final List<Point<double>> list3 = <Point<double>>[
      const Point<double>(250.0, 100.0),
      const Point<double>(358.0, 143.0),
      const Point<double>(400.0, 250.0),
      const Point<double>(355.0, 355.0),
      const Point<double>(250.0, 400.0),
      const Point<double>(144.0, 357.0),
      const Point<double>(100.0, 250.0),
      const Point<double>(144.0, 144.0),
    ];
    paint.color = BeepColors.primary;
    _drawWithPoint(canvas, paint, list3, hasShadow: true);

    List<Point> list4 = [
      Point(250.0, 150.0),
      Point(320.0, 180.0),
      Point(348.0, 250.0),
      Point(320.0, 320.0),
      Point(250.0, 348.0),
      Point(180.0, 320.0),
      Point(150.0, 250.0),
      Point(180.0, 180.0),
    ];
    paint.color = BeepColors.secondary;
    _drawWithPoint(canvas, paint, list4, hasShadow: true);

    List<Point> list5 = [
      Point(250.0, 202.0),
      Point(286.0, 217.0),
      Point(300.0, 250.0),
      Point(284.0, 284.0),
      Point(250.0, 300.0),
      Point(214.0, 282.0),
      Point(202.0, 250.0),
      Point(216.0, 216.0),
    ];
    paint.color = BeepColors.tertiary;
    _drawWithPoint(canvas, paint, list5, hasShadow: true);

    List<Point> listYellow = [
      Point(110.0, 104.0),
      Point(250.0, 153.0),
      Point(358.0, 143.0),
      Point(450.0, 252.0),
      Point(369.0, 349.0),
      Point(250.0, 504.0),
      Point(140.0, 353.0),
      Point(100.0, 250.0),
    ];
    paint.color = BeepColors.success;
    _drawWithPoint(canvas, paint, listYellow);
    */
    canvas.save();
    canvas.restore();
  }

  void _drawWithPoint(Canvas canvas, Paint paint, List<Point<double>> list,
      {bool hasShadow = false}) {
    list = _resizePoint(list);
    final Path path = _drawRoundPolygon(list, 4.0, canvas, paint);
    if (hasShadow) {
      canvas.drawShadow(path, Colors.black26, 10.0, true);
    }
    canvas.drawPath(path, paint);
  }

  Path _drawRoundPolygon(
      List<Point<double>> ps, double distance, Canvas canvas, Paint paint) {
    final Path path = Path();
    ps.add(ps[0]);
    ps.add(ps[1]);
    final Point<double> p0 =
        LineInterCircle.intersectionPoint(ps[1], ps[0], distance);
    path.moveTo(p0.x, p0.y);
    for (int i = 0; i < ps.length - 2; i++) {
      final Point<double> p1 = ps[i];
      final Point<double> p2 = ps[i + 1];
      final Point<double> p3 = ps[i + 2];
      final Point<double> interP1 =
          LineInterCircle.intersectionPoint(p1, p2, distance);
      final Point<double> interP2 =
          LineInterCircle.intersectionPoint(p3, p2, distance);
      path.lineTo(interP1.x, interP1.y);
      path.arcToPoint(
        Offset(interP2.x, interP2.y),
        radius: Radius.circular(distance * 6),
      );
    }
    return path;
  }

  List<Point<double>> _resizePoint(List<Point<double>> list) {
    final List<Point<double>> l = <Point<double>>[];
    for (Point<double> p in list) {
      l.add(Point<double>(_sizeUtil.getAxisX(p.x), _sizeUtil.getAxisY(p.y)));
    }
    return l;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
