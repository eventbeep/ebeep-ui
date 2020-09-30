import 'package:flutter/material.dart';

import '../../widgets.dart';

class FancyAppBar extends StatelessWidget {
  const FancyAppBar({
    Key key,
    @required this.color,
    @required this.backgroundColor,
    @required this.title,
    @required this.icon,
  }) : super(key: key);

  final Color color;
  final Color backgroundColor;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return BottomWaveContainer(
      shadowColor: color.withOpacity(0.16),
      child: Container(
        padding: EdgeInsets.only(
          top: 40 + statusBarHeight,
          bottom: 74,
          left: 16,
          right: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: EBTextStyles.headline5.copyWith(color: color)),
            Icon(icon, size: 56, color: color),
          ],
        ),
        decoration: BoxDecoration(color: backgroundColor),
      ),
    );
  }
}

class BottomWaveContainer extends StatelessWidget {
  final Widget child;
  final Color shadowColor;

  BottomWaveContainer({
    this.child,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      key: UniqueKey(),
      painter: _ClipShadowShadowPainter(
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

class _ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowShadowPainter({@required this.shadow, @required this.clipper});

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
