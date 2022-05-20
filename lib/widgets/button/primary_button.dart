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
    this.padding = const EdgeInsets.all(16),
    this.gap = EBSpacers.width16,
    this.color = EBColors.primary,
    this.borderColor,
    this.textColor = EBColors.white,
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
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
    return ButtonTheme(
      height: height,
      minWidth: minWidth,
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: onPressed == null
                ? EBColors.grey50
                : borderColor == null
                    ? color
                    : borderColor!),
        borderRadius: BorderRadius.circular(EBDimens.borderRadius),
      ),
      disabledColor: hideDisableWhenLoading && isLoading
          ? color
          : color == Colors.white
              ? color
              : EBColors.grey50,
      padding: const EdgeInsets.symmetric(horizontal: EBDimens.padding),
      child: MaterialButton(
        padding: padding,
        elevation: 0,
        color: color,
        textColor: textColor,
        disabledColor: hideDisableWhenLoading && isLoading
            ? color
            : color == Colors.white
                ? color
                : EBColors.grey50,
        disabledTextColor:
            color == Colors.white ? EBColors.grey50 : EBColors.white,
        child: isLoading
            ? const EBLoading(radius: 8, color: EBColors.white)
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) icon!,
                  if (icon != null && title.isNotEmpty) gap,
                  if (title.isNotEmpty)
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                ],
              ),
        onPressed: isLoading ? null : onPressed as void Function()?,
      ),
    );
  }
}
