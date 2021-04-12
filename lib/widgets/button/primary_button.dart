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
    this.minWidth = 48,
    this.isLoading = false,
    this.fontSize = 16,
    this.padding = const EdgeInsets.all(16),
    this.gap = EBSpacers.width16,
    this.color = EBColors.primary,
    this.icon,
  }) : super(key: key);

  final String title;
  final double height;
  final double minWidth;
  final Function onPressed;
  final bool isLoading;
  final double fontSize;
  final EdgeInsets padding;
  final Icon icon;
  final Color color;
  final Widget gap;

  factory EBPrimaryButton.medium({
    String title = '',
    @required Function onPressed,
    bool isLoading = false,
    Color color = EBColors.primary,
    Icon icon,
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
      minWidth: 36,
      gap: EBSpacers.width8,
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
      minWidth: minWidth,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(EBDimens.borderRadius),
      ),
      disabledColor: EBColors.grey50,
      padding: const EdgeInsets.symmetric(horizontal: EBDimens.padding),
      child: MaterialButton(
        padding: padding,
        elevation: 0,
        color: color,
        textColor: EBColors.white,
        disabledColor: EBColors.grey50,
        disabledTextColor: EBColors.white,
        child: isLoading
            ? const EBLoading(radius: 8, color: EBColors.white)
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) icon,
                  if (icon != null && title.isNotEmpty) gap,
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
