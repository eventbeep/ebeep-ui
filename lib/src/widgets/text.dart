import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:flutter/widgets.dart';

class BeepCustomText extends StatelessWidget {
  final String text;
  final TextAlign align;
  final Color color;
  final FontWeight weight;
  final double size;
  final int maxLines;
  final String fontFamily;

  BeepCustomText({
    @required this.text,
    this.align = TextAlign.start,
    this.color = BeepColors.lightGrey,
    this.weight = FontWeight.w100,
    @required this.size,
    @required this.fontFamily,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: (maxLines == 1) ? TextOverflow.ellipsis : null,
      textAlign: align,
      style: TextStyle(
        color: color,
        fontWeight: weight,
        fontSize: size,
        fontFamily: fontFamily,
      ),
    );
  }
}

class BeepPrimaryText extends StatelessWidget {
  final String text;
  final TextAlign align;

  BeepPrimaryText({
    this.text,
    this.align,
  });

  @override
  Widget build(BuildContext context) {
    return BeepCustomText(
      text: text,
      color: BeepColors.textPrimary,
      size: BeepDimens.textPrimary,
      align: align,
      fontFamily: 'Quicksand',
    );
  }
}

class BeepSecondaryText extends StatelessWidget {
  final String text;
  final TextAlign align;
  final int maxLines;

  BeepSecondaryText({
    this.text,
    this.align,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return BeepCustomText(
      text: text,
      align: align,
      maxLines: maxLines,
      size: BeepDimens.textSecondary,
      color: BeepColors.textSecondary,
      fontFamily: 'Quicksand',
    );
  }
}

class BeepActionBarText extends StatelessWidget {
  final String text;

  BeepActionBarText(this.text);

  @override
  Widget build(BuildContext context) {
    return BeepCustomText(
      text: text,
      align: TextAlign.center,
      size: BeepDimens.textActionBar,
      color: BeepColors.textPrimary,
      weight: FontWeight.w600,
      fontFamily: 'Rocksalt',
    );
  }
}

class BeepButtonText extends StatelessWidget {
  final String text;

  BeepButtonText(this.text);

  @override
  Widget build(BuildContext context) {
    return BeepCustomText(
      text: text,
      align: TextAlign.center,
      maxLines: 1,
      size: BeepDimens.textButtonSize,
      color: BeepColors.white,
      weight: FontWeight.w600,
      fontFamily: 'Poppins',
    );
  }
}

class BeepLargeHeading extends StatelessWidget {
  final String text;
  final TextAlign align;
  final int maxLines;

  BeepLargeHeading({
    this.text,
    this.align,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return BeepCustomText(
      text: text,
      align: align,
      maxLines: maxLines,
      size: BeepDimens.textLargeHeading,
      color: BeepColors.textPrimary,
      weight: FontWeight.w300,
      fontFamily: 'Poppins',
    );
  }
}

class BeepSmallHeading extends StatelessWidget {
  final String text;
  final TextAlign align;
  final int maxLines;

  BeepSmallHeading({
    this.text,
    this.align,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return BeepCustomText(
      text: text,
      align: align,
      maxLines: maxLines,
      size: BeepDimens.textSmallHeading,
      color: BeepColors.primary,
      weight: FontWeight.w300,
      fontFamily: 'Quicksand',
    );
  }
}
