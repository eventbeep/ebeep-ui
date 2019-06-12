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
          text: capitalize(text),
          size: BeepDimens.textSecondary,
          color: BeepColors.white,
          fontFamily: 'Quicksand',
        ),
      ),
    );
  }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  List<Color> getGradient() {
    switch (text) {
      case BeepCategories.food:
        return BeepGradients.food;
      case BeepCategories.adventure:
        return BeepGradients.adventure;
      case BeepCategories.gaming:
        return BeepGradients.gaming;
      case BeepCategories.creative:
        return BeepGradients.biking;
      case BeepCategories.sports:
        return BeepGradients.sports;
      case BeepCategories.entertainment:
        return BeepGradients.entertainment;
      case BeepCategories.startups:
        return BeepGradients.startups;
      case BeepCategories.technical:
        return BeepGradients.technical;
      default:
        return BeepGradients.appBarGradient;
    }
  }
}
