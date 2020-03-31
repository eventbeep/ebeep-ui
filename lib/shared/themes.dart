import 'package:eventbeep_ui/shared/dimens.dart';
import 'package:eventbeep_ui/widgets/text/text_styles.dart';
import 'package:flutter/material.dart';

import '../colors/colors.dart';

mixin EBThemes {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: EBColors.primary,
    accentColor: EBColors.tertiary,
    fontFamily: 'Simple',
    textTheme: const TextTheme(
      headline1: EBTextStyles.headline1,
      headline2: EBTextStyles.headline2,
      headline3: EBTextStyles.headline3,
      headline4: EBTextStyles.headline4,
      headline5: EBTextStyles.headline5,
      headline6: EBTextStyles.headline6,
      bodyText1: EBTextStyles.bodyText1,
      bodyText2: EBTextStyles.bodyText2,
      button: EBTextStyles.button,
      subtitle1: EBTextStyles.subtitle1,
      subtitle2: EBTextStyles.subtitle2,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(EBDimens.padding),
      ),
      // focusedBorder: OutlineInputBorder(
      //   borderSide: BorderSide(
      //     color: EBColors.tertiary.withAlpha(50),
      //     width: 2,
      //   ),
      //   borderRadius: BorderRadius.circular(EBDimens.padding),
      // ),
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
      filled: true,
      fillColor: EBColors.tertiary200,
      labelStyle: EBTextStyles.bodyText1.copyWith(
        color: EBColors.tertiary,
        fontWeight: FontWeight.bold,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      alignLabelWithHint: false,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: EBColors.primary,
    accentColor: EBColors.tertiary,
    fontFamily: 'Simple',
    textTheme: TextTheme(
      headline1: EBTextStyles.headline1.copyWith(color: EBColors.white),
      headline2: EBTextStyles.headline2,
      headline3: EBTextStyles.headline3,
      headline4: EBTextStyles.headline4,
      headline5: EBTextStyles.headline5,
      headline6: EBTextStyles.headline6,
      bodyText1: EBTextStyles.bodyText1,
      bodyText2: EBTextStyles.bodyText2,
      button: EBTextStyles.button,
      subtitle1: EBTextStyles.subtitle1,
      subtitle2: EBTextStyles.subtitle2,
    ),
  );
}
