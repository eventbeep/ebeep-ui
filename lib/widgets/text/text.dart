import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EBAutoSizeText extends StatelessWidget {
  const EBAutoSizeText({
    Key? key,
    required this.text,
    this.align = TextAlign.start,
    this.color = Colors.black,
    this.weight = FontWeight.w400,
    this.size = 14,
    this.minSize = 12,
    this.maxLines,
    this.lineSpace,
  }) : super(key: key);

  final String text;
  final TextAlign? align;
  final Color color;
  final FontWeight weight;
  final double? size;
  final double minSize;
  final int? maxLines;
  final double? lineSpace;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxLines: maxLines,
      minFontSize: minSize,
      overflow: (maxLines != null) ? TextOverflow.ellipsis : null,
      textAlign: align,
      style: GoogleFonts.poppins(
        height: lineSpace,
        color: color,
        fontWeight: weight,
        fontSize: size,
      ),
    );
  }
}
