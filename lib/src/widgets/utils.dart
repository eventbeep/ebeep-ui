import 'dart:math';

import 'package:flutter/material.dart';

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class Line {
  ///y = kx + c
  static double normalLine(double x, {double k = 0, double c = 0}) {
    return k * x + c;
  }

  ///Calculate the param K in y = kx +c
  static double paramK(Point<double> p1, Point<double> p2) {
    if (p1.x == p2.x) {
      return 0;
    }
    return (p2.y - p1.y) / (p2.x - p1.x);
  }

  ///Calculate the param C in y = kx +c
  static double paramC(Point<double> p1, Point<double> p2) {
    return p1.y - paramK(p1, p2) * p1.x;
  }
}

/// start point p1, end point p2,p2 is center of the circle,r is its radius.
class LineInterCircle {
  /// start point p1, end point p2,p2 is center of the circle,r is its radius.
  /// param a: y = kx +c intersect with circle,which has the center with point2 and radius R .
  /// when derive to x2+ ax +b = 0 equation. the param a is here.
  static double paramA(Point<double> p1, Point<double> p2) {
    return (2 * Line.paramK(p1, p2) * Line.paramC(p1, p2) -
            2 * Line.paramK(p1, p2) * p2.y -
            2 * p2.x) /
        (Line.paramK(p1, p2) * Line.paramK(p1, p2) + 1);
  }

  /// start point p1, end point p2,p2 is center of the circle,r is its radius.
  /// param b: y = kx +c intersect with circle,which has the center with point2 and radius R .
  /// when derive to x2+ ax +b = 0 equation. the param b is here.
  static double paramB(Point<double> p1, Point<double> p2, double r) {
    return (p2.x * p2.x -
            r * r +
            (Line.paramC(p1, p2) - p2.y) * (Line.paramC(p1, p2) - p2.y)) /
        (Line.paramK(p1, p2) * Line.paramK(p1, p2) + 1);
  }

  ///the circle has the intersection or not
  static bool isIntersection(Point<double> p1, Point<double> p2, double r) {
    final double delta =
        sqrt(paramA(p1, p2) * paramA(p1, p2) - 4 * paramB(p1, p2, r));
    return delta >= 0.0;
  }

  ///the x coordinate whether or not is between two point we give.
  static bool _betweenPoint(double x, Point<double> p1, Point<double> p2) {
    if (p1.x > p2.x) {
      return x > p2.x && x < p1.x;
    } else {
      return x > p1.x && x < p2.x;
    }
  }

  static Point<double> _equalX(Point<double> p1, Point<double> p2, double r) {
    if (p1.y > p2.y) {
      return Point<double>(p2.x, p2.y + r);
    } else if (p1.y < p2.y) {
      return Point<double>(p2.x, p2.y - r);
    } else {
      return p2;
    }
  }

  static Point<double> _equalY(Point<double> p1, Point<double> p2, double r) {
    if (p1.x > p2.x) {
      return Point<double>(p2.x + r, p2.y);
    } else if (p1.x < p2.x) {
      return Point<double>(p2.x - r, p2.y);
    } else {
      return p2;
    }
  }

  ///intersection point
  static Point<double> intersectionPoint(
      Point<double> p1, Point<double> p2, double r) {
    if (p1.x == p2.x) {
      return _equalX(p1, p2, r);
    }
    if (p1.y == p2.y) {
      return _equalY(p1, p2, r);
    }
    final double delta =
        sqrt(paramA(p1, p2) * paramA(p1, p2) - 4 * paramB(p1, p2, r));
    if (delta < 0.0) {
      //when no intersection, i will return the center of the circ  le.
      return p2;
    }
    final double a_2 = -paramA(p1, p2) / 2.0;
    final double x1 = a_2 + delta / 2;
    if (_betweenPoint(x1, p1, p2)) {
      final double y1 = Line.paramK(p1, p2) * x1 + Line.paramC(p1, p2);
      return Point<double>(x1, y1);
    }
    final double x2 = a_2 - delta / 2;
    final double y2 = Line.paramK(p1, p2) * x2 + Line.paramC(p1, p2);
    return Point<double>(x2, y2);
  }
}

class SizeKeyConst {
  static const String DEVICE_KEY = 'device_size';
  static const String ROUND_ANGLE_KEY = 'round_angle_size';
  static const String REGULAR_POLYGON_KEY = 'regular_angle_size';
  static const String CIRCLE_KEY = 'circle custom painter';
  static const String CIRCLE_TRIANGLE_KEY = 'circle triangle painter';
  static const String LOGO_KEY = 'logo_page_size';
}

class SizeUtil {
  static final Map<String, SizeUtil> _keyValues = <String, SizeUtil>{};

  static void initDesignSize() {
    getInstance(key: SizeKeyConst.ROUND_ANGLE_KEY).designSize =
        const Size(500.0, 500.0);
    getInstance(key: SizeKeyConst.REGULAR_POLYGON_KEY).designSize =
        const Size(500.0, 500.0);
    getInstance(key: SizeKeyConst.LOGO_KEY).designSize = const Size(580, 648.0);
    getInstance(key: SizeKeyConst.CIRCLE_KEY).designSize =
        const Size(500.0, 500.0);
    getInstance(key: SizeKeyConst.CIRCLE_TRIANGLE_KEY).designSize =
        const Size(500.0, 500.0);
  }

  static SizeUtil getInstance({String key = SizeKeyConst.DEVICE_KEY}) {
    if (_keyValues.containsKey(key)) {
      return _keyValues[key];
    } else {
      _keyValues[key] = SizeUtil();
      return _keyValues[key];
    }
  }

  Size _designSize;

  set designSize(Size size) {
    _designSize = size;
  }

  //logic size in device
  Size _logicalSize;

  //device pixel radio.

  double get width => _logicalSize.width;

  double get height => _logicalSize.height;

  set logicSize(Size size) => _logicalSize = size;

  //@param w is the design w;
  double getAxisX(double w) {
    return (w * width) / _designSize.width;
  }

// the y direction
  double getAxisY(double h) {
    return (h * height) / _designSize.height;
  }

  // diagonal direction value with design size s.
  double getAxisBoth(double s) {
    return s *
        sqrt((width * width + height * height) /
            (_designSize.width * _designSize.width +
                _designSize.height * _designSize.height));
  }
}
