import 'package:flutter/material.dart';

import '../../colors/colors.dart';

class EBDragIndicator extends StatelessWidget {
  const EBDragIndicator({
    Key? key,
    this.color = EBColors.beepNeutral4,
  }) : super(key: key);

  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: 44,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
    );
  }
}
