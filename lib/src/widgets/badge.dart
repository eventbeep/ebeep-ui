import 'package:flutter/material.dart';
import 'polygon_path.dart';

class BeepBadge extends StatelessWidget {
  const BeepBadge({
    @required this.child,
    @required this.sides,
    this.rotate = 0.0,
    this.borderRadius = 0.0,
    this.size = double.infinity,
  });

  final Widget child;
  final int sides;
  final double rotate;
  final double borderRadius;
  final double size;

  @override
  Widget build(BuildContext context) {
    final List<PolygonBoxShadow> boxShadows = <PolygonBoxShadow>[
      PolygonBoxShadow(color: Colors.grey, elevation: 5.0)
    ];

    final PolygonPathSpecs specs = PolygonPathSpecs(
      sides: sides < 3 ? 3 : sides,
      rotate: rotate,
      borderRadiusAngle: borderRadius,
    );

    return Container(
      height: size,
      width: size,
      child: CustomPaint(
        painter: BoxShadowPainter(specs, boxShadows),
        child: ClipPath(
          clipper: Polygon(specs),
          child: child,
        ),
      ),
    );
  }
}

class Polygon extends CustomClipper<Path> {
  Polygon(this.specs);

  final PolygonPathSpecs specs;

  @override
  Path getClip(Size size) {
    return PolygonPathDrawer(size: size, specs: specs).draw();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class BoxShadowPainter extends CustomPainter {
  BoxShadowPainter(this.specs, this.boxShadows);

  final PolygonPathSpecs specs;
  final List<PolygonBoxShadow> boxShadows;

  @override
  void paint(Canvas canvas, Size size) {
    final Path path = PolygonPathDrawer(size: size, specs: specs).draw();

    boxShadows.forEach((PolygonBoxShadow shadow) {
      canvas.drawShadow(path, shadow.color, shadow.elevation, false);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class PolygonBoxShadow {
  PolygonBoxShadow({
    @required this.color,
    @required this.elevation,
  });

  final Color color;
  final double elevation;
}
