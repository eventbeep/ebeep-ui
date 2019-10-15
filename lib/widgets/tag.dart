import 'package:eventbeep_ui/widgets.dart';
import 'package:eventbeep_ui/shared.dart';
import 'package:flutter/material.dart';

class BeepTag extends StatelessWidget {
  const BeepTag({Key key, this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: BeepDimens.darkShadow,
        borderRadius: BorderRadius.circular(12.0),
        gradient: LinearGradient(
          colors: BeepGradients.getGradient(text),
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: const <double>[0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BeepCustomText(
          text: capitalize(text),
          size: BeepDimens.textSecondary,
          color: BeepColors.white,
          fontFamily: 'Simple',
        ),
      ),
    );
  }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}
