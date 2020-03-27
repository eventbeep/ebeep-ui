import 'package:eventbeep_ui/shared.dart';
import 'package:flutter/material.dart';

class Themes {
  static ThemeData getLightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: BeepColors.primary,
      accentColor: Colors.cyan[600],
      fontFamily: 'Simple',
      textTheme: TextTheme(
        headline5: TextStyle(
          fontSize: 72.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
