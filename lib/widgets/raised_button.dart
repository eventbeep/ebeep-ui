import 'package:flutter/material.dart';

import '../shared.dart';
import '../widgets.dart';

class BeepRaisedButton extends StatelessWidget {
  const BeepRaisedButton({
    Key key,
    @required this.title,
    @required this.onPressed,
    this.color = BeepColors.primary,
    this.width = double.infinity,
    this.height = BeepDimens.buttonHeight,
    this.fontSize = BeepDimens.textButtonSize,
    this.cornerRadius = BeepDimens.buttonHeight / 2,
    this.isLoading = false,
  }) : super(key: key);

  final String title;
  final double width;
  final double height;
  final double cornerRadius;
  final double fontSize;
  final Function onPressed;
  final Color color;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
        color: color,
        boxShadow: (onPressed == null) ? null : BeepDimens.lightShadow,
      ),
      child: isLoading
          ? const Center(
              child: BeepLoading(
                color: BeepColors.white,
                radius: 12,
                strokeWidth: 3,
              ),
            )
          : Material(
              color: BeepColors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
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
