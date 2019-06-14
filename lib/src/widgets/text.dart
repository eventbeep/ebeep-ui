import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:flutter/widgets.dart';

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
  });

  final String text;
  final TextAlign align;
  final double lineSpace;

  @override
  Widget build(BuildContext context) {
    return BeepCustomText(
      text: text,
      color: BeepColors.textPrimary,
      size: BeepDimens.textPrimary,
      align: align,
      fontFamily: 'Simple',
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
    );
  }
}

class BeepActionBarText extends StatelessWidget {
  const BeepActionBarText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return BeepCustomText(
      text: text,
      align: TextAlign.center,
      size: BeepDimens.textActionBar,
      color: BeepColors.textPrimary,
      weight: FontWeight.bold,
      fontFamily: 'Heading',
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
