import 'package:flutter/material.dart';

import '../../shared.dart';
import '../../widgets.dart';

class EBTag extends StatelessWidget {
  const EBTag({
    Key? key,
    required this.text,
    this.color = EBColors.lightBlue,
  }) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: color,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Text(
        text,
        style: EBTextStyles.caption.copyWith(color: EBColors.textPrimary),
      ),
    );
  }
}
