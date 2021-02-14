import 'package:flutter/material.dart';

import '../../shared.dart';
import '../../widgets.dart';

class EBChip extends StatelessWidget {
  const EBChip({
    Key key,
    @required this.label,
    this.onDeleted,
    this.isSelected = false,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    this.labelStyle = EBTextStyles.bodyText1,
    this.iconSize = 20,
    this.cornerRadius = EBDimens.borderRadius,
  }) : super(key: key);

  final String label;
  final Function onDeleted;
  final bool isSelected;
  final EdgeInsets padding;
  final TextStyle labelStyle;
  final double iconSize;
  final double cornerRadius;

  factory EBChip.small({
    Key key,
    @required String label,
    Function onDeleted,
    bool isSelected = false,
  }) {
    return EBChip(
      key: key,
      label: label,
      onDeleted: onDeleted,
      isSelected: isSelected,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      labelStyle: EBTextStyles.caption,
      iconSize: 12,
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
                color: isSelected ? EBColors.primary : EBColors.grey100,
              ),
            ),
          ),
          if (onDeleted != null) ...[
            EBSpacers.width12,
            GestureDetector(
              onTap: onDeleted,
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
        color: isSelected ? EBColors.lightBlue : EBColors.grey10,
        borderRadius: BorderRadius.circular(cornerRadius),
        border: Border.all(
          color: isSelected ? EBColors.primary : EBColors.grey30,
          width: 1,
        ),
      ),
    );
  }
}
