import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:flutter/widgets.dart';

class BeepDimens {
  BeepDimens._();

  static const double textButtonSize = 18.0;
  static const double textPrimary = 16.0;
  static const double textSecondary = 14.0;
  static const double textLargeHeading = 26.0;
  static const double textSmallHeading = 18.0;
  static const double textActionBar = 21.0;

  static const double appBarHeight = 66.0;
  static const SizedBox dummyBox = SizedBox(
    height: appBarHeight,
    width: appBarHeight,
  );

  static const List<BoxShadow> lightShadow = [
    BoxShadow(
      color: BeepColors.lightShadow,
      blurRadius: 8.0,
      offset: Offset(0.0, 8.0),
    ),
  ];

  static const List<BoxShadow> darkShadow = [
    BoxShadow(
      color: BeepColors.darkShadow,
      blurRadius: 8.0,
      offset: Offset(0.0, 8.0),
    ),
  ];

  static const double padding = 16.0;
  static const double cornerRadius = 16.0;

  static const double eventCardHeight = 300.0;
  static const double eventCardImageHeight = 200.0;
  static const double cardMarginVertical = 12.0;
  static const double cardMarginHorizontal = 24.0;

  static const double avatarRadius = 66.0;

  static const double buttonHeight = 50.0;

  static const double ticketCornerRadius = 16.0;
}
