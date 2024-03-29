import 'package:flutter/material.dart';

import '../../shared.dart';
import '../../widgets.dart';

class EBTertiaryButton extends StatelessWidget {
  const EBTertiaryButton({
    Key? key,
    this.title = '',
    required this.onPressed,
    this.height = 48,
    this.fontSize = 16,
    this.isLoading = false,
    this.padding = const EdgeInsets.all(16),
    this.gap = EBSpacers.width16,
    this.icon,
  }) : super(key: key);

  final String title;
  final double height;
  final Function? onPressed;
  final bool isLoading;
  final double fontSize;
  final EdgeInsets padding;
  final Widget? icon;
  final Widget gap;

  factory EBTertiaryButton.small({
    required Function? onPressed,
    String title = '',
    bool isLoading = false,
    Icon? icon,
  }) {
    return EBTertiaryButton(
      title: title,
      onPressed: onPressed,
      isLoading: isLoading,
      fontSize: 14,
      height: 36,
      gap: EBSpacers.width8,
      icon: icon,
      padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 12),
    );
  }

  factory EBTertiaryButton.medium({
    String title = '',
    required Function? onPressed,
    bool isLoading = false,
    Color color = EBColors.beepGreen,
    Icon? icon,
  }) {
    return EBTertiaryButton(
      title: title,
      onPressed: onPressed,
      isLoading: isLoading,
      height: 40,
      fontSize: 14,
      gap: EBSpacers.width12,
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
        side: const BorderSide(color: EBColors.grey40),
        borderRadius: BorderRadius.circular(EBDimens.borderRadius),
      ),
      padding: const EdgeInsets.symmetric(horizontal: EBDimens.padding),
      child: MaterialButton(
        padding: padding,
        elevation: 0,
        disabledColor: EBColors.grey50,
        disabledTextColor: EBColors.white,
        textColor: EBColors.grey90,
        color: EBColors.grey10,
        child: isLoading
            ? const EBLoading(radius: 8, color: EBColors.beepGreen)
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) icon!,
                  if (icon != null && title.isNotEmpty) gap,
                  if (title.isNotEmpty)
                    Text(
                      title,
                      style: EBTextStyles.button.copyWith(fontSize: fontSize),
                    ),
                ],
              ),
        onPressed: isLoading ? null : onPressed as void Function()?,
      ),
    );
  }
}
