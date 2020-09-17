import 'package:flutter/material.dart';

import '../../colors/colors.dart';
import '../../shared/dimens.dart';
import '../../shared/shadows.dart';

class EBCard extends StatelessWidget {
  const EBCard({
    @required this.child,
    this.backgroundColor = EBColors.white,
    this.borderRadius = EBDimens.borderRadius,
    this.contentPadding = const EdgeInsets.all(16),
    Key key,
  }) : super(key: key);

  final double borderRadius;
  final EdgeInsets contentPadding;
  final Color backgroundColor;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: contentPadding,
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: EBShadows.lightShadow,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
