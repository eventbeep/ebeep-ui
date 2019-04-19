import 'package:eventbeep_ui/eventbeep_ui.dart';
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
          colors: getGradient(),
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: const <double>[0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BeepCustomText(
          text: text,
          size: BeepDimens.textSecondary,
          color: BeepColors.white,
          fontFamily: 'Quicksand',
        ),
      ),
    );
  }

  List<Color> getGradient() {
    switch (text) {
      case BeepConstants.collegeEvents:
        return BeepGradients.collegeEvents;
      case BeepConstants.food:
        return BeepGradients.food;
      case BeepConstants.adventure:
        return BeepGradients.adventure;
      case BeepConstants.gaming:
        return BeepGradients.gaming;
      case BeepConstants.biking:
        return BeepGradients.biking;
      case BeepConstants.competitions:
        return BeepGradients.competitions;
      case BeepConstants.sports:
        return BeepGradients.sports;
      case BeepConstants.quizzes:
        return BeepGradients.quizzes;
      case BeepConstants.entertainment:
        return BeepGradients.entertainment;
      case BeepConstants.startups:
        return BeepGradients.startups;
      case BeepConstants.technical:
        return BeepGradients.technical;
      case BeepConstants.others:
        return BeepGradients.others;
      default:
        return BeepGradients.appBarGradient;
    }
  }
}
