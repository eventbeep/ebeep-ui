import 'package:flutter/material.dart';

import '../../shared.dart';
import '../../widgets.dart';

class EBSecondaryButton extends StatelessWidget {
  const EBSecondaryButton({
    Key key,
    this.title = '',
    @required this.onPressed,
    this.height = 48,
    this.fontSize = 16,
    this.isLoading = false,
    this.padding = const EdgeInsets.all(16),
    this.icon,
  }) : super(key: key);

  final String title;
  final double height;
  final Function onPressed;
  final bool isLoading;
  final double fontSize;
  final EdgeInsets padding;
  final Widget icon;

  factory EBSecondaryButton.small({
    @required Function onPressed,
    String title = '',
    bool isLoading = false,
    Icon icon,
  }) {
    return EBSecondaryButton(
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
    @required Function onPressed,
    bool isLoading = false,
    Color color = EBColors.primary,
    Icon icon,
  }) {
    return EBSecondaryButton(
      title: title,
      onPressed: onPressed,
      isLoading: isLoading,
      height: 40,
      fontSize: 16,
      icon: icon,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: height,
      minWidth: 48,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Color(0xFFDDEAFF)),
        borderRadius: BorderRadius.circular(EBDimens.borderRadius),
      ),
      padding: const EdgeInsets.symmetric(horizontal: EBDimens.padding),
      child: FlatButton(
        padding: padding,
        textColor: EBColors.primary,
        color: Color(0xFFF1F6FE),
        child: isLoading
            ? const EBLoading(radius: 8, color: EBColors.primary)
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