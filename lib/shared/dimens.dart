import 'package:eventbeep_ui/shared.dart';
import 'package:flutter/material.dart';

class BeepDimens {
  BeepDimens._();

  static const double textButtonSize = 18.0;
  static const double textPrimary = 16.0;
  static const double textSecondary = 14.0;
  static const double textLargeHeading = 26.0;
  static const double textSmallHeading = 18.0;
  static const double textActionBar = 26.0;

  static const double appBarHeight = 70.0;
  static const SizedBox dummyBox = SizedBox(
    height: appBarHeight,
    width: appBarHeight,
  );

  static const List<BoxShadow> lightShadow = <BoxShadow>[
    BoxShadow(
      color: BeepColors.lightShadow,
      blurRadius: 8.0,
      offset: Offset(0.0, 8.0),
    ),
  ];

  static const List<BoxShadow> darkShadow = <BoxShadow>[
    BoxShadow(
      color: BeepColors.darkShadow,
      blurRadius: 8.0,
      offset: Offset(0.0, 8.0),
    ),
  ];

  static const double padding = 16.0;
  static const double cornerRadius = 16.0;

  static const double eventCardHeight = 296.0;

  static const double eventSmallCardHeight = 227.0;
  static const double eventSmallCardWidth = 300.0;

  static const double cardMarginVertical = 12.0;
  static const double cardMarginHorizontal = 24.0;

  static const double festEventRadio = 0.958;

  static const double avatarRadius = 66.0;

  static const double buttonHeight = 50.0;

  static const double ticketCornerRadius = 16.0;
}
