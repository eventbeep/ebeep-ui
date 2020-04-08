import 'package:flutter/material.dart';

import '../../shared.dart';
import '../../widgets.dart';

class EBTag extends StatelessWidget {
  const EBTag({Key key, this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: EBShadows.darkShadow,
        borderRadius: BorderRadius.circular(12.0),
        gradient: LinearGradient(
          colors: EBGradients.getGradient(text),
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: const <double>[0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: EBText(
          text: capitalize(text),
          size: EBDimens.textSecondary,
          color: EBColors.white,
          fontFamily: 'Simple',
        ),
      ),
    );
  }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}