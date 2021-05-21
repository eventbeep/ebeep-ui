import 'package:flutter/material.dart';

import '../../shared.dart';

class EBText extends StatelessWidget {
  const EBText({
    Key? key,
    required this.text,
    this.align = TextAlign.start,
    this.color = EBColors.textSecondary,
    this.weight = FontWeight.w100,
    this.size,
    this.fontFamily,
    this.maxLines,
    this.lineSpace = 1,
  }) : super(key: key);

/*
  const EBText.primary({
    Key key,
    @required this.text,
    this.align,
    this.lineSpace,
    this.maxLines,
    this.color = EBColors.textPrimary,
    this.weight,
    this.size = EBDimens.textPrimary,
    this.fontFamily,
  }) : super(key: key);

  const EBText.secondary({
    Key key,
    @required this.text,
    this.align,
    this.color,
    this.weight,
    this.size,
    this.maxLines,
    this.fontFamily,
    this.lineSpace,
  }) : super(key: key);

  const EBText.appBar({
    Key key,
    @required this.text,
    this.align,
    this.color,
    this.weight,
    this.size,
    this.maxLines,
    this.fontFamily,
    this.lineSpace,
  }) : super(key: key);

  const EBText.button({
    Key key,
    @required this.text,
    this.align,
    this.color,
    this.weight,
    this.size,
    this.maxLines,
    this.fontFamily,
    this.lineSpace,
  }) : super(key: key);

  const EBText.heading({
    Key key,
    @required this.text,
    this.align,
    this.color,
    this.weight,
    this.size,
    this.maxLines,
    this.fontFamily,
    this.lineSpace,
  }) : super(key: key);

  const EBText.title({
    Key key,
    @required this.text,
    this.align,
    this.color,
    this.weight,
    this.size,
    this.maxLines,
    this.fontFamily,
    this.lineSpace,
  }) : super(key: key);
 */

  final String? text;
  final TextAlign? align;
  final Color color;
  final FontWeight weight;
  final double? size;
  final int? maxLines;
  final String? fontFamily;
  final double? lineSpace;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
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

  final String? text;
  final TextAlign? align;
  final double? lineSpace;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return EBText(
      text: text,
      color: EBColors.textPrimary,
      size: EBDimens.textPrimary,
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

  final String? text;
  final TextAlign? align;
  final int? maxLines;
  final double? lineSpace;

  @override
  Widget build(BuildContext context) {
    return EBText(
      text: text,
      align: align,
      maxLines: maxLines,
      size: EBDimens.textSecondary,
      color: EBColors.textSecondary,
      fontFamily: 'Simple',
      lineSpace: lineSpace,
    );
  }
}

class BeepActionBarText extends StatelessWidget {
  const BeepActionBarText({
    this.text,
    this.singleLine = true,
    this.color = EBColors.quaternary,
  });

  final String? text;
  final bool singleLine;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return EBText(
      text: text,
      size: EBDimens.textActionBar,
      color: color,
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
    return EBText(
      text: text,
      align: TextAlign.center,
      maxLines: 1,
      size: EBDimens.textButtonSize,
      color: EBColors.white,
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
    this.lineSpace,
  });

  final String? text;
  final TextAlign? align;
  final int? maxLines;
  final double? lineSpace;

  @override
  Widget build(BuildContext context) {
    return EBText(
      text: text,
      align: align,
      maxLines: maxLines,
      size: EBDimens.textLargeHeading,
      color: EBColors.textPrimary,
      fontFamily: 'Heading',
      lineSpace: lineSpace,
    );
  }
}

class BeepSmallHeading extends StatelessWidget {
  const BeepSmallHeading({
    this.text,
    this.align,
    this.maxLines,
  });

  final String? text;
  final TextAlign? align;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return EBText(
      text: text,
      align: align,
      maxLines: maxLines,
      size: EBDimens.textSmallHeading,
      color: EBColors.primary,
      weight: FontWeight.bold,
      fontFamily: 'Heading',
    );
  }
}
