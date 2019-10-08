import 'package:flutter/material.dart';
import 'package:eventbeep_ui/shared.dart';

class BeepCustomText extends StatelessWidget {
  const BeepCustomText({
    @required this.text,
    this.align = TextAlign.start,
    this.color = BeepColors.textSecondary,
    this.weight = FontWeight.w100,
    @required this.size,
    @required this.fontFamily,
    this.maxLines,
    this.lineSpace = 1,
  });

  final String text;
  final TextAlign align;
  final Color color;
  final FontWeight weight;
  final double size;
  final int maxLines;
  final String fontFamily;
  final double lineSpace;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: (maxLines != null) ? TextOverflow.ellipsis : null,
      textAlign: align,
      style: TextStyle(
        height: lineSpace,
        color: color,
        fontWeight: weight,
        fontSize: size,
        fontFamily: fontFamily,
      ),
    );
  }
}

class BeepPrimaryText extends StatelessWidget {
  const BeepPrimaryText({
    this.text,
    this.align,
    this.lineSpace,
    this.maxLines,
  });

  final String text;
  final TextAlign align;
  final double lineSpace;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return BeepCustomText(
      text: text,
      color: BeepColors.textPrimary,
      size: BeepDimens.textPrimary,
      align: align,
      fontFamily: 'Simple',
      lineSpace: lineSpace,
      maxLines: maxLines,
    );
  }
}

class BeepSecondaryText extends StatelessWidget {
  const BeepSecondaryText({
    this.text,
    this.align,
    this.maxLines,
    this.lineSpace,
  });

  final String text;
  final TextAlign align;
  final int maxLines;
  final double lineSpace;

  @override
  Widget build(BuildContext context) {
    return BeepCustomText(
      text: text,
      align: align,
      maxLines: maxLines,
      size: BeepDimens.textSecondary,
      color: BeepColors.textSecondary,
      fontFamily: 'Simple',
      lineSpace: lineSpace,
    );
  }
}

class BeepActionBarText extends StatelessWidget {
  const BeepActionBarText({this.text, this.singleLine = true});

  final String text;
  final bool singleLine;

  @override
  Widget build(BuildContext context) {
    return BeepCustomText(
      text: text,
      size: BeepDimens.textActionBar,
      color: BeepColors.quaternary,
      // weight: FontWeight.bold,
      fontFamily: 'Title',
      lineSpace: 1.3,
      maxLines: singleLine ? 1 : 3,
    );
  }
}

class BeepButtonText extends StatelessWidget {
  const BeepButtonText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return BeepCustomText(
      text: text,
      align: TextAlign.center,
      maxLines: 1,
      size: BeepDimens.textButtonSize,
      color: BeepColors.white,
      weight: FontWeight.bold,
      fontFamily: 'Heading',
    );
  }
}

class BeepLargeHeading extends StatelessWidget {
  const BeepLargeHeading({
    this.text,
    this.align,
    this.maxLines,
  });

  final String text;
  final TextAlign align;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return BeepCustomText(
      text: text,
      align: align,
      maxLines: maxLines,
      size: BeepDimens.textLargeHeading,
      color: BeepColors.textPrimary,
      fontFamily: 'Heading',
    );
  }
}

class BeepSmallHeading extends StatelessWidget {
  const BeepSmallHeading({
    this.text,
    this.align,
    this.maxLines,
  });

  final String text;
  final TextAlign align;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return BeepCustomText(
      text: text,
      align: align,
      maxLines: maxLines,
      size: BeepDimens.textSmallHeading,
      color: BeepColors.primary,
      weight: FontWeight.bold,
      fontFamily: 'Heading',
    );
  }
}
