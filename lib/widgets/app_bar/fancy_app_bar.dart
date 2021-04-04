import 'package:flutter/material.dart';

import '../../widgets.dart';
import '../clipper/wave_clipper.dart';

class FancyAppBar extends StatelessWidget {
  const FancyAppBar({
    Key? key,
    required this.color,
    required this.backgroundColor,
    required this.title,
    required this.icon,
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
