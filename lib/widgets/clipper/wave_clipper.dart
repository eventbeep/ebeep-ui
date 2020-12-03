import 'package:flutter/material.dart';

class ClipShadowShadowPainter extends CustomPainter {
  ClipShadowShadowPainter({@required this.shadow, @required this.clipper});

  final CustomClipper<Path> clipper;
  final Shadow shadow;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  const BottomWaveClipper() : super();

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 50);
    path.cubicTo(
      size.width / 3,
      size.height,
      1.5 * size.width / 3,
      size.height - 80,
      size.width,
      size.height - 30,
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class BottomWaveContainer extends StatelessWidget {
  BottomWaveContainer({
    this.child,
    this.shadowColor,
  });

  final Widget child;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      key: UniqueKey(),
      painter: ClipShadowShadowPainter(
        clipper: const BottomWaveClipper(),
        shadow: Shadow(
          blurRadius: 12,
          offset: const Offset(0, 4),
          color: shadowColor,
        ),
      ),
      child: ClipPath(child: child, clipper: const BottomWaveClipper()),
    );
  }
}

class BottomCurveContainer extends StatelessWidget {
  BottomCurveContainer({
    this.child,
    this.shadowColor,
  });

  final Widget child;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      key: UniqueKey(),
      painter: ClipShadowShadowPainter(
        clipper: const BottomWaveClipper(),
        shadow: Shadow(
          blurRadius: 12,
          offset: const Offset(0, 4),
          color: shadowColor,
        ),
      ),
      child: ClipPath(child: child, clipper: const BottomCurveClipper()),
    );
  }
}

class BottomCurveClipper extends CustomClipper<Path> {
  const BottomCurveClipper() : super();

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 75);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 75);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
