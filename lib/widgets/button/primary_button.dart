import 'package:flutter/material.dart';

import '../../colors/colors.dart';
import '../../shared.dart';
import '../../shared/dimens.dart';
import '../../widgets.dart';

class EBPrimaryButton extends StatelessWidget {
  const EBPrimaryButton({
    Key key,
    @required this.onPressed,
    this.title = '',
    this.height = 48,
    this.isLoading = false,
    this.fontSize = 16,
    this.padding = const EdgeInsets.all(16),
    this.color = EBColors.primary,
    this.icon,
  }) : super(key: key);

  final String title;
  final double height;
  final Function onPressed;
  final bool isLoading;
  final double fontSize;
  final EdgeInsets padding;
  final Icon icon;
  final Color color;

  factory EBPrimaryButton.medium({
    String title = '',
    @required Function onPressed,
    bool isLoading = false,
    Color color = EBColors.primary,
    Icon icon,
  }) {
    return EBPrimaryButton(
      title: title,
      onPressed: onPressed,
      isLoading: isLoading,
      height: 40,
      fontSize: 16,
      icon: icon,
      color: color,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    );
  }

  factory EBPrimaryButton.small({
    String title = '',
    @required Function onPressed,
    bool isLoading = false,
    Color color = EBColors.primary,
    Icon icon,
  }) {
    return EBPrimaryButton(
      title: title,
      onPressed: onPressed,
      isLoading: isLoading,
      height: 36,
      fontSize: 14,
      icon: icon,
      color: color,
      padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 12),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: height,
      minWidth: 48,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(EBDimens.borderRadius),
      ),
      disabledColor: EBColors.grey50,
      padding: const EdgeInsets.symmetric(horizontal: EBDimens.padding),
      child: RaisedButton(
        padding: padding,
        color: color,
        textColor: EBColors.white,
        disabledTextColor: EBColors.white,
        child: isLoading
            ? const EBLoading(radius: 8, color: EBColors.white)
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) icon,
                  if (icon != null && title.isNotEmpty) EBSpacers.width16,
                  if (title.isNotEmpty)
                    Text(
                      title,
                      style: EBTextStyles.button.copyWith(fontSize: fontSize),
                    ),
                ],
              ),
        onPressed: isLoading ? null : onPressed,
      ),
    );
  }
}
