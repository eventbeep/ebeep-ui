import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EBAutoSizeText extends StatelessWidget {
  const EBAutoSizeText(
    String this.text, {
    Key? key,
    this.align = TextAlign.start,
    this.color = Colors.black,
    this.weight = FontWeight.w400,
    this.size = 14,
    this.minSize = 12,
    this.maxLines,
    this.lineSpace,
    this.fontFamily,
    this.shadows,
    this.fontStyle,
  })  : textSpan = null,
        super(key: key);

  const EBAutoSizeText.rich(
    TextSpan this.textSpan, {
    Key? key,
    this.align = TextAlign.start,
    this.color = Colors.black,
    this.weight = FontWeight.w400,
    this.size = 14,
    this.minSize = 12,
    this.maxLines,
    this.lineSpace,
    this.fontFamily,
    this.shadows,
    this.fontStyle,
  })  : text = null,
        super(key: key);

  final String? text;
  final TextSpan? textSpan;
  final TextAlign? align;
  final Color color;
  final FontWeight weight;
  final double? size;
  final double minSize;
  final int? maxLines;
  final double? lineSpace;
  final String? fontFamily;
  final List<Shadow>? shadows;
  final FontStyle? fontStyle;

  @override
  Widget build(BuildContext context) {
    if (text != null) {
      return AutoSizeText(
        text!,
        maxLines: maxLines,
        minFontSize: minSize,
        overflow: (maxLines != null) ? TextOverflow.ellipsis : null,
        textAlign: align,
        style: fontFamily == null
            ? GoogleFonts.poppins(
                height: lineSpace,
                color: color,
                fontWeight: weight,
                fontSize: size,
                shadows: shadows,
                fontStyle: fontStyle,
              )
            : generateGoogleFont(
                fontFamily: fontFamily,
                height: lineSpace,
                color: color,
                fontWeight: weight,
                size: size,
                shadows: shadows,
                fontStyle: fontStyle,
                lineSpace: lineSpace,
                weight: weight,
              ),
      );
    } else {
      return AutoSizeText.rich(
        textSpan!,
        maxLines: maxLines,
        minFontSize: minSize,
        overflow: (maxLines != null) ? TextOverflow.ellipsis : null,
        textAlign: align,
        style: fontFamily == null
            ? GoogleFonts.poppins(
                height: lineSpace,
                color: color,
                fontWeight: weight,
                fontSize: size,
                shadows: shadows,
                fontStyle: fontStyle,
              )
            : generateGoogleFont(
                fontFamily: fontFamily,
                height: lineSpace,
                color: color,
                fontWeight: weight,
                size: size,
                shadows: shadows,
                fontStyle: fontStyle,
                lineSpace: lineSpace,
                weight: weight,
              ),
      );
    }
  }
}

TextStyle generateGoogleFont({
  required String? fontFamily,
  required double? height,
  required Color color,
  required FontWeight fontWeight,
  required double? size,
  required List<Shadow>? shadows,
  required FontStyle? fontStyle,
  required double? lineSpace,
  required FontWeight? weight,
}) {
  if (fontFamily == 'poppins') {
    return GoogleFonts.poppins(
      height: lineSpace,
      color: color,
      fontWeight: weight,
      fontSize: size,
      shadows: shadows,
      fontStyle: fontStyle,
    );
  } else if (fontFamily == 'baloo 2') {
    return GoogleFonts.baloo2(
      height: lineSpace,
      color: color,
      fontWeight: weight,
      fontSize: size,
      shadows: shadows,
      fontStyle: fontStyle,
    );
  } else {
    return TextStyle(
      height: lineSpace,
      color: color,
      fontWeight: weight,
      fontSize: size,
      fontFamily: fontFamily,
      shadows: shadows,
      fontStyle: fontStyle,
    );
  }
}
