import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class BeepRaisedButton extends StatelessWidget {
  final String title;
  final Gradient gradient;
  final double width;
  final double height;
  final Function onPressed;

  const BeepRaisedButton({
    Key key,
    @required this.title,
    this.gradient,
    this.width = double.infinity,
    this.height = BeepDimens.buttonHeight,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: BeepDimens.buttonHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(BeepDimens.buttonHeight / 2),
          ),
          gradient: new LinearGradient(
            colors: BeepColors.appBarGradient,
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
          boxShadow: (onPressed == null) ? null : BeepDimens.lightShadow),
      child: Material(
        color: BeepColors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: BeepButtonText(title),
          ),
        ),
      ),
    );
  }
}
