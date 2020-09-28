import 'package:flutter/material.dart';

import '../../colors/colors.dart';
import '../../shared/icons.dart';
import '../../widgets.dart';

class FancyAppBar extends StatelessWidget {
  const FancyAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return BottomWaveContainer(
      Container(
        padding: EdgeInsets.only(
          top: 32 + statusBarHeight,
          bottom: 72,
          left: 16,
          right: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('THis is an amaozng', style: EBTextStyles.headline5),
            Icon(EBIcons.two_users, size: 56),
          ],
        ),
        decoration: BoxDecoration(
          color: EBColors.lightBlue,
        ),
      ),
    );
  }
}

class BottomWaveContainer extends StatelessWidget {
  final Widget child;

  BottomWaveContainer(this.child);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      key: UniqueKey(),
      painter: _ClipShadowShadowPainter(
        clipper: const BottomWaveClipper(),
        shadow: Shadow(
          blurRadius: 8,
          color: EBColors.primary.withOpacity(0.3),
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
