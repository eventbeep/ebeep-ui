import 'package:flutter/material.dart';

import '../colors/colors.dart';
import '../widgets.dart';
import '../widgets/text/text_styles.dart';
import 'dimens.dart';

mixin EBThemes {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryIconTheme: IconThemeData(color: EBColors.grey100),
    primaryColorLight: EBColors.lightBlue,
    scaffoldBackgroundColor: EBColors.beepNeutral6,
    primaryColor: EBColors.beepGreen,
    accentColor: EBColors.secondary,
    snackBarTheme: SnackBarThemeData(
      backgroundColor: EBColors.beepGreen,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(EBDimens.borderRadius),
      ),
      behavior: SnackBarBehavior.floating,
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(EBDimens.borderRadius),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(EBDimens.borderRadius),
        topLeft: Radius.circular(EBDimens.borderRadius),
      )),
      backgroundColor: EBColors.beepNeutral6,
    ),
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: EBColors.grey70,
      labelColor: EBColors.grey100,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: EBColors.beepGreen, width: 2),
      ),
      labelStyle: EBTextStyles.bodyText1.copyWith(fontWeight: FontWeight.w500),
      unselectedLabelStyle: EBTextStyles.bodyText1,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: EBColors.tertiary,
      deleteIconColor: EBColors.white,
      disabledColor: EBColors.lightGrey,
      selectedColor: EBColors.beepGreen,
      secondarySelectedColor: EBColors.beepGreen,
      labelPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(EBDimens.borderRadius)),
      labelStyle: EBTextStyles.caption.copyWith(
        color: EBColors.textPrimary,
      ),
      secondaryLabelStyle: EBTextStyles.caption.copyWith(
        color: EBColors.white,
        fontWeight: FontWeight.bold,
      ),
      brightness: Brightness.light,
    ),
    appBarTheme: AppBarTheme(
      color: EBColors.white,
      textTheme: TextTheme(headline6: EBTextStyles.appBar),
      shadowColor: EBColors.grey10,
      elevation: 2,
    ),
    cardTheme: CardTheme(
      elevation: 4,
      margin: EdgeInsets.zero,
      shadowColor: EBColors.darkShadow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(EBDimens.borderRadius),
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
      padding: const EdgeInsets.symmetric(horizontal: EBDimens.padding),
      height: 48,
      minWidth: 48,
      buttonColor: EBColors.beepGreen,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(EBDimens.borderRadius),
      ),
      textTheme: ButtonTextTheme.primary,
      disabledColor: EBColors.disabled,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: EBColors.beepGreen,
      elevation: 4,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(EBDimens.padding),
      filled: true,
      fillColor: EBColors.white,
      labelStyle: const TextStyle(color: EBColors.tertiary),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: EBColors.beepGreen,
    accentColor: EBColors.secondary,
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
