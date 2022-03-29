import 'package:flutter/material.dart';
import '../../shared.dart';
import '../../widgets.dart';

class EBChip extends StatelessWidget {
  const EBChip({
    Key? key,
    required this.label,
    this.selectedLabelColor = EBColors.primary,
    this.selectedBorderColor = EBColors.primary,
    this.unselectedBorderColor = EBColors.grey30,
    this.selectedBackgroundColor = EBColors.lightBlue,
    this.unselectedBackgroundColor = EBColors.grey10,
    this.onDeleted,
    this.isSelected = false,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    this.labelStyle = EBTextStyles.bodyText1,
    this.iconSize = 20,
    this.borderWidth = 1,
    this.cornerRadius = EBDimens.borderRadius,
  }) : super(key: key);

  final String label;
  final Color selectedLabelColor;
  final Color selectedBorderColor;
  final Color unselectedBorderColor;
  final Color unselectedBackgroundColor;
  final Color selectedBackgroundColor;
  final Function? onDeleted;
  final bool isSelected;
  final EdgeInsets padding;
  final TextStyle labelStyle;
  final double iconSize;
  final double borderWidth;
  final double cornerRadius;

  factory EBChip.small({
    Key? key,
    required String label,
    Color selectedLabelColor = EBColors.primary,
    Color selectedBorderColor = EBColors.primary,
    Color selectedBackgroundColor = EBColors.lightBlue,
    Function? onDeleted,
    bool isSelected = false,
    double borderWidth = 1,
  }) {
    return EBChip(
      key: key,
      label: label,
      onDeleted: onDeleted,
      isSelected: isSelected,
      selectedLabelColor: selectedLabelColor,
      selectedBorderColor: selectedBorderColor,
      selectedBackgroundColor: selectedBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      labelStyle: EBTextStyles.caption,
      iconSize: 12,
      borderWidth: borderWidth,
      cornerRadius: 6,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              label,
              style: labelStyle.copyWith(
                color: isSelected ? selectedLabelColor : EBColors.grey100,
              ),
            ),
          ),
          if (onDeleted != null) ...[
            EBSpacers.width12,
            GestureDetector(
              onTap: onDeleted as void Function()?,
              child: Icon(
                Icons.cancel,
                color: EBColors.primary,
                size: iconSize,
              ),
            ),
          ],
        ],
      ),
      decoration: BoxDecoration(
        color: isSelected ? selectedBackgroundColor : unselectedBackgroundColor,
        borderRadius: BorderRadius.circular(cornerRadius),
        border: Border.all(
          color: isSelected ? selectedBorderColor : unselectedBorderColor,
          width: borderWidth,
        ),
      ),
    );
  }
}
