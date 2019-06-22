import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class BeepRaisedButton extends StatelessWidget {
  const BeepRaisedButton({
    Key key,
    @required this.title,
    this.gradient,
    this.width = double.infinity,
    this.height = BeepDimens.buttonHeight,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final Gradient gradient;
  final double width;
  final double height;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: BeepDimens.buttonHeight,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(BeepDimens.buttonHeight / 2),
        ),
        gradient: const LinearGradient(
          colors: BeepGradients.appBarGradient,
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
        ),
        boxShadow: (onPressed == null) ? null : BeepDimens.lightShadow,
      ),
      child: Material(
        color: BeepColors.transparent,
        child: InkWell(
          borderRadius: const BorderRadius.all(
            Radius.circular(BeepDimens.buttonHeight / 2),
          ),
          onTap: onPressed,
          child: Center(
            child: BeepButtonText(title),
          ),
        ),
      ),
    );
  }
}
