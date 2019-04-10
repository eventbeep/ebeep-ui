import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:flutter/material.dart';

class BeepTag extends StatelessWidget {
  final String text;

  const BeepTag({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: BeepDimens.darkShadow,
        borderRadius: BorderRadius.circular(12.0),
        gradient: new LinearGradient(
          colors: getGradient(),
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BeepCustomText(
          text: text,
          size: BeepDimens.textSecondary,
          color: BeepColors.white,
        ),
      ),
    );
  }

  getGradient() {
    switch (text) {
      case BeepConstants.collegeEvents:
        return BeepGradients.collegeEvents;
      case BeepConstants.food:
        return BeepGradients.food;
      case BeepConstants.adventure:
        return BeepGradients.adventure;
      case BeepConstants.gaming:
        return BeepGradients.gaming;
      case BeepConstants.musicAndDance:
        return BeepGradients.musicAndDance;
      case BeepConstants.nightlife:
        return BeepGradients.nightlife;
      case BeepConstants.sports:
        return BeepGradients.sports;
      case BeepConstants.workshopsAndSeminars:
        return BeepGradients.workshopsAndSeminars;
    }
  }
}
