// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../colors/colors.dart';

class EBTextStyles {
  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16,
    letterSpacing: 0.25,
    fontWeight: FontWeight.normal,
    color: EBColors.grey100,
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: 14,
    letterSpacing: 0.5,
    color: EBColors.grey60,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: EBColors.grey70,
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
    fontSize: 24,
    letterSpacing: 1.0,
    fontWeight: FontWeight.bold,
    color: EBColors.grey90,
  );

  static const TextStyle headline6 = TextStyle(
    fontSize: 20,
    letterSpacing: 0.15,
    fontWeight: FontWeight.bold,
    color: EBColors.grey90,
  );

  static const TextStyle overline = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.normal,
    letterSpacing: 1.5,
  );

  static const TextStyle subtitle1 = TextStyle(
    fontSize: 16,
    letterSpacing: 0.15,
    fontWeight: FontWeight.w500,
    color: EBColors.grey90,
  );

  static const TextStyle subtitle2 = TextStyle(
    fontSize: 14,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w500,
    color: EBColors.grey90,
  );

  static const TextStyle label = TextStyle(
    fontSize: 14,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w500,
    color: EBColors.grey90,
  );

  static const TextStyle appBar = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    color: EBColors.grey100,
  );
}

class BeepTextStyles {
  static TextStyle heading1 = GoogleFonts.poppins(
    fontSize: 48.sp,
    fontWeight: FontWeight.w800,
    color: Colors.black,
  );

  static TextStyle heading2 = GoogleFonts.poppins(
    fontSize: 34.sp,
    fontWeight: FontWeight.w800,
    color: Colors.black,
  );

  static TextStyle heading3 = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );

  static TextStyle heading4 = GoogleFonts.poppins(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static TextStyle heading5 = GoogleFonts.poppins(
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle textField = GoogleFonts.poppins(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle body1B = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static TextStyle body1 = GoogleFonts.poppins(
    fontSize: 16.sp,
    color: Colors.black,
  );

  static TextStyle body2B = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static TextStyle body2M = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle body2 = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static TextStyle caption = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle overline = GoogleFonts.poppins(
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static TextStyle label = GoogleFonts.poppins(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle subtitle = GoogleFonts.poppins(
    fontSize: 12.sp,
    fontWeight: FontWeight.w300,
  );

  static TextStyle custom(
      {required double fontSize,
      required FontWeight fontWeight,
      required Color color,
      List<Shadow>? shadows}) {
    return GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        shadows: shadows);
  }

  static TextStyle clashDisplay(
      {required double fontSize,
      required FontWeight fontWeight,
      required Color color}) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: 'ClashDisplay',
    );
  }

  static TextStyle montserrat(
      {required double fontSize,
      required FontWeight fontWeight,
      required Color color,
      List<Shadow>? shadows}) {
    return GoogleFonts.montserrat(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        shadows: shadows);
  }
}
