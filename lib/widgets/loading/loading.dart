import 'package:flutter/material.dart';

import '../../shared.dart';

class EBLoading extends StatelessWidget {
  const EBLoading({
    Key key,
    this.color = EBColors.tertiary,
    this.radius = 15,
    this.strokeWidth = 2,
  }) : super(key: key);

  final Color color;
  final double radius;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: radius * 2,
      width: radius * 2,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}
