import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../colors/colors.dart';
import '../../shared/spacers.dart';
import '../../widgets.dart';

class EBIconButton extends StatelessWidget {
  const EBIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.height = 40,
    this.width = 40,
    this.elevation = 0,
    this.text,
    this.fillColor = EBColors.lightBlue,
  }) : super(key: key);

  final Widget icon;
  final double height;
  final double width;
  final Color fillColor;
  final double elevation;
  final String? text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: height,
          width: width,
          child: RawMaterialButton(
            elevation: elevation,
            fillColor: fillColor,
            // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: const CircleBorder(),
            child: icon,
            onPressed: onPressed,
          ),
        ),
        if (text != null) ...[
          EBSpacers.height4,
          AutoSizeText(
            text!,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: BeepTextStyles.caption.copyWith(color: Colors.black),
          )
        ]
      ],
    );
  }
}
