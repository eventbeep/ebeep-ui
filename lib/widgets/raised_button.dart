import 'package:eventbeep_ui/widgets.dart';
import 'package:eventbeep_ui/shared.dart';
import 'package:flutter/material.dart';

class BeepRaisedButton extends StatelessWidget {
  const BeepRaisedButton({
    Key key,
    @required this.title,
    @required this.onPressed,
    this.gradient,
    this.width = double.infinity,
    this.height = BeepDimens.buttonHeight,
    this.fontSize = BeepDimens.textButtonSize,
  }) : super(key: key);

  final String title;
  final Gradient gradient;
  final double width;
  final double height;
  final double fontSize;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(BeepDimens.buttonHeight / 2),
        ),
        // gradient: const LinearGradient(
        //   colors: BeepGradients.appBarGradient,
        //   begin: FractionalOffset.topCenter,
        //   end: FractionalOffset.bottomCenter,
        // ),
        color: BeepColors.primary,
        boxShadow: (onPressed == null) ? null : BeepDimens.darkShadow,
      ),
      child: Material(
        color: BeepColors.transparent,
        child: InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(BeepDimens.buttonHeight / 2),
          ),
          onTap: onPressed,
          child: Center(
            child: BeepCustomText(
              text: title,
              color: BeepColors.white,
              weight: FontWeight.bold,
              size: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
