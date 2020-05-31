import 'package:flutter/material.dart';
import 'package:superellipse_shape/superellipse_shape.dart';

import '../colors/colors.dart';
import '../widgets.dart';
import '../widgets/text/text_styles.dart';

mixin EBThemes {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: EBColors.scaffoldBackgroundColor,
    brightness: Brightness.light,
    primaryColor: EBColors.primary,
    accentColor: EBColors.tertiary,
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: EBColors.scaffoldBackgroundColor,
    ),
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: EBColors.textSecondary,
      labelStyle: EBTextStyles.bodyText2.copyWith(fontWeight: FontWeight.bold),
      unselectedLabelStyle: EBTextStyles.bodyText2,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: EBColors.tertiary,
      deleteIconColor: EBColors.white,
      disabledColor: EBColors.lightGrey,
      selectedColor: EBColors.primary,
      secondarySelectedColor: EBColors.secondary,
      labelPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: EdgeInsets.zero,
      shape: StadiumBorder(),
      labelStyle: EBTextStyles.caption.copyWith(
        color: EBColors.white,
        fontWeight: FontWeight.bold,
      ),
      secondaryLabelStyle: EBTextStyles.caption.copyWith(
        color: EBColors.white,
        fontWeight: FontWeight.bold,
      ),
      brightness: Brightness.light,
    ),
    appBarTheme: AppBarTheme(
      // color: EBColors.transparent,
      color: EBColors.white,
      elevation: 2,
    ),
    cardTheme: CardTheme(
      elevation: 4,
      margin: EdgeInsets.zero,
      shadowColor: EBColors.darkShadow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
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
      caption: EBTextStyles.caption,
      overline: EBTextStyles.overline,
    ),
    buttonTheme: ButtonThemeData(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      height: 48,
      buttonColor: EBColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      disabledColor: EBColors.disabled,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: EBColors.primary,
      shape: SuperellipseShape(
        borderRadius: BorderRadius.circular(48),
      ),
      elevation: 4,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: EBColors.primary),
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 17, horizontal: 18),
      filled: true,
      fillColor: EBColors.white,
      labelStyle: const TextStyle(color: EBColors.tertiary),
      floatingLabelBehavior: FloatingLabelBehavior.always,
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
