import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../../colors/colors.dart';

class EBTextStyles {
  static const TextStyle bodyText1 = TextStyle(
    fontSize: 14,
    letterSpacing: 0.25,
    color: EBColors.textSecondary,
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: 16,
    letterSpacing: 0.5,
    color: EBColors.textPrimary,
  );

  static const TextStyle button = TextStyle(
    fontSize: 14,
    letterSpacing: 1.25,
    fontWeight: FontWeight.bold,
    color: EBColors.white,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.4,
  );

  static const TextStyle headline1 = TextStyle(
    fontSize: 96,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5,
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
  );

  static const TextStyle headline3 = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle headline4 = TextStyle(
    fontSize: 34,
    letterSpacing: 0.25,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle headline5 = TextStyle(
    fontSize: 26,
    letterSpacing: 1.0,
    // fontWeight: FontWeight.bold,
  );

  static const TextStyle headline6 = TextStyle(
    fontSize: 20,
    letterSpacing: 0.15,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle overline = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.normal,
    letterSpacing: 1.5,
  );

  static const TextStyle subtitle1 = TextStyle(
    fontSize: 16,
    letterSpacing: 0.15,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle subtitle2 = TextStyle(
    fontSize: 14,
    letterSpacing: 0.1,
    fontWeight: FontWeight.bold,
  );
}
