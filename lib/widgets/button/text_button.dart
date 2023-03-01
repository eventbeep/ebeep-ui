import 'package:flutter/material.dart';

import '../../shared.dart';
import '../text/text.dart';

class EBTextButton extends StatelessWidget {
  const EBTextButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.align = TextAlign.start,
    this.color = Colors.black,
    this.weight = FontWeight.w400,
    this.size = 14,
    this.minSize = 12,
    this.maxLines,
    this.lineSpace,
    this.fontFamily,
    this.shadows,
  }) : super(key: key);

  final String title;
  final TextAlign? align;
  final Color color;
  final FontWeight weight;
  final double? size;
  final double minSize;
  final int? maxLines;
  final double? lineSpace;
  final String? fontFamily;
  final List<Shadow>? shadows;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 32,
      minWidth: 42,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(EBDimens.borderRadius),
      ),
      child: TextButton(
        child: EBAutoSizeText(
          title,
          align: align,
          color: color,
          weight: weight,
          size: size,
          minSize: minSize,
          maxLines: maxLines,
          lineSpace: lineSpace,
          fontFamily: fontFamily,
          shadows: shadows,
        ),
        onPressed: onPressed as void Function()?,
      ),
    );
  }
}
