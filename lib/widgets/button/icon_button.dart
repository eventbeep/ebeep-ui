import 'package:flutter/material.dart';

import '../../colors/colors.dart';

class EBIconButton extends StatelessWidget {
  const EBIconButton(
      {Key? key,
      required this.icon,
      required this.onPressed,
      this.height = 40,
      this.width = 40,
      this.fillColor = EBColors.lightBlue})
      : super(key: key);

  final Widget icon;
  final double height;
  final double width;
  final Color fillColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: RawMaterialButton(
        elevation: 0,
        fillColor: fillColor,
        // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const CircleBorder(),
        child: icon,
        onPressed: onPressed,
      ),
    );
  }
}
