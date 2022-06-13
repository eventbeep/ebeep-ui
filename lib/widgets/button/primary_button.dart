import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared.dart';
import '../../widgets.dart';

class EBPrimaryButton extends StatelessWidget {
  const EBPrimaryButton({
    Key? key,
    required this.onPressed,
    this.title = '',
    this.height = 48,
    this.minWidth = 48,
    this.isLoading = false,
    this.hideDisableWhenLoading = false,
    this.fontSize = 16,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.gap = EBSpacers.width16,
    this.color = EBColors.primary,
    this.borderColor,
    this.textColor = EBColors.white,
    this.disabledTextColor,
    this.icon,
  }) : super(key: key);

  final String title;
  final double height;
  final double minWidth;
  final Function? onPressed;
  final bool isLoading;
  final bool hideDisableWhenLoading;
  final double fontSize;
  final EdgeInsets padding;
  final Icon? icon;
  final Color color;
  final Color? borderColor;
  final Color textColor;
  final Color? disabledTextColor;
  final Widget gap;

  factory EBPrimaryButton.medium({
    String title = '',
    required Function? onPressed,
    bool isLoading = false,
    Color color = EBColors.primary,
    Color textColor = EBColors.white,
    Icon? icon,
    double minWidth = 40,
  }) {
    return EBPrimaryButton(
      title: title,
      onPressed: onPressed,
      isLoading: isLoading,
      height: 40,
      gap: EBSpacers.width12,
      minWidth: minWidth,
      fontSize: 16,
      icon: icon,
      color: color,
      textColor: textColor,
      padding: const EdgeInsets.only(top: 10, bottom: 14, left: 16, right: 16),
    );
  }

  factory EBPrimaryButton.small({
    String title = '',
    required Function? onPressed,
    bool isLoading = false,
    Color color = EBColors.primary,
    Color textColor = EBColors.white,
    Icon? icon,
  }) {
    return EBPrimaryButton(
      title: title,
      onPressed: onPressed,
      isLoading: isLoading,
      height: 36,
      minWidth: 36,
      gap: EBSpacers.width8,
      fontSize: 14,
      icon: icon,
      color: color,
      textColor: textColor,
      padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 12),
    );
  }

  @override
  Widget build(BuildContext context) {
    final disabled = isLoading || onPressed == null ? true : false;
    return ButtonTheme(
      height: height,
      minWidth: minWidth,
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: onPressed == null
                ? EBColors.beepNeutral4
                : borderColor == null
                    ? color
                    : borderColor!),
        borderRadius: BorderRadius.circular(EBDimens.borderRadius),
      ),
      disabledColor:
          hideDisableWhenLoading && isLoading ? color : EBColors.beepNeutral5,
      padding: const EdgeInsets.symmetric(horizontal: EBDimens.padding),
      child: MaterialButton(
        padding: padding,
        elevation: 1,
        color: color,
        textColor: textColor,
        disabledColor: hideDisableWhenLoading && isLoading
            ? color
            : color == Colors.white
                ? color
                : EBColors.beepNeutral4,
        disabledTextColor: disabledTextColor != null
            ? disabledTextColor
            : color == Colors.white
                ? EBColors.beepNeutral4
                : EBColors.white,
        child: isLoading
            ? const EBLoading(radius: 8, color: EBColors.white)
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) icon!,
                  if (icon != null && title.isNotEmpty) gap,
                  if (title.isNotEmpty)
                    FittedBox(
                      child: Text(title,
                          style: BeepTextStyles.textField.copyWith(
                              color: disabled
                                  ? disabledTextColor ?? EBColors.beepNeutral3
                                  : textColor)),
                    ),
                ],
              ),
        onPressed: isLoading ? null : onPressed as void Function()?,
      ),
    );
  }
}
