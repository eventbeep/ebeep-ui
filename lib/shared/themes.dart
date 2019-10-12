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
        headline: TextStyle(
          fontSize: 72.0,
          fontWeight: FontWeight.bold,
        ),
        // title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        // body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      ),
    );
  }
}
