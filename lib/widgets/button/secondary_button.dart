import 'package:flutter/material.dart';

import '../../shared.dart';
import '../../widgets.dart';

class EBSecondaryButton extends StatelessWidget {
  const EBSecondaryButton({
    Key? key,
    this.title = '',
    required this.onPressed,
    this.height = 48,
    this.fontSize = 16,
    this.isLoading = false,
    this.padding = const EdgeInsets.all(16),
    this.icon,
    this.color = EBColors.grey10,
    this.textColor = EBColors.beepGreen,
  }) : super(key: key);

  final String title;
  final double height;
  final Function? onPressed;
  final bool isLoading;
  final double fontSize;
  final EdgeInsets padding;
  final Widget? icon;
  final Color color;
  final Color textColor;

  factory EBSecondaryButton.small({
    required Function? onPressed,
    Color color = EBColors.grey10,
    Color textColor = EBColors.beepGreen,
    String title = '',
    bool isLoading = false,
    Icon? icon,
  }) {
    return EBSecondaryButton(
      color: color,
      textColor: textColor,
      title: title,
      onPressed: onPressed,
      isLoading: isLoading,
      fontSize: 14,
      height: 36,
      icon: icon,
      padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 12),
    );
  }

  factory EBSecondaryButton.medium({
    String title = '',
    required Function? onPressed,
    bool isLoading = false,
    Icon? icon,
    Color color = Colors.white,
    Color textColor = EBColors.beepGreen,
  }) {
    return EBSecondaryButton(
      color: color,
      textColor: textColor,
      title: title,
      onPressed: onPressed,
      isLoading: isLoading,
      height: 40,
      fontSize: 14,
      icon: icon,
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: height,
      minWidth: 48,
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: onPressed == null ? EBColors.grey50 : EBColors.beepGreen),
        borderRadius: BorderRadius.circular(EBDimens.borderRadius),
      ),
      padding: const EdgeInsets.symmetric(horizontal: EBDimens.padding),
      child: MaterialButton(
        padding: padding,
        textColor: textColor,
        color: color,
        disabledColor: EBColors.grey50,
        disabledTextColor: EBColors.white,
        elevation: 0,
        child: isLoading
            ? const EBLoading(radius: 8, color: EBColors.beepGreen)
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) icon!,
                  if (icon != null && title.isNotEmpty) EBSpacers.width16,
                  if (title.isNotEmpty)
                    Text(
                      title,
                      style: BeepTextStyles.body2B.copyWith(fontSize: fontSize),
                    ),
                ],
              ),
        onPressed: isLoading ? null : onPressed as void Function()?,
      ),
    );
  }
}
