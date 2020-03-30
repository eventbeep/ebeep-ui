import 'package:flutter/material.dart';

import '../../shared.dart';
import '../../widgets.dart';

class EBRaisedButtom extends StatelessWidget {
  const EBRaisedButtom({
    Key key,
    @required this.title,
    @required this.onPressed,
    this.color = EBColors.primary,
    this.width = double.infinity,
    this.height = EBDimens.buttonHeight,
    this.fontSize = EBDimens.textButtonSize,
    this.cornerRadius = EBDimens.buttonHeight / 2,
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
        boxShadow: (onPressed == null) ? null : EBShadows.lightShadow,
      ),
      child: isLoading
          ? const Center(
              child: EBLoading(
                color: EBColors.white,
                radius: 12,
                strokeWidth: 3,
              ),
            )
          : Material(
              color: EBColors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
                onTap: onPressed,
                child: Center(
                  child: EBText(
                    text: title,
                    color: EBColors.white,
                    weight: FontWeight.bold,
                    size: fontSize,
                  ),
                ),
              ),
            ),
    );
  }
}
