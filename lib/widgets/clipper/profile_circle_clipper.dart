import 'package:flutter/material.dart';

class ProfileCircleClipper extends CustomClipper<Path> {
  ProfileCircleClipper({
    required this.holeRadius,
  });

  final double holeRadius;

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width / 2 + holeRadius, size.height)
      ..arcToPoint(
        Offset(size.width / 2 - holeRadius, size.height),
        clockwise: false,
        radius: const Radius.circular(1),
      );
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(ProfileCircleClipper oldClipper) => true;
}
