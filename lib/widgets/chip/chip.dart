import 'package:flutter/material.dart';

import '../../shared.dart';
import '../../widgets.dart';

class EBChip extends StatelessWidget {
  const EBChip({
    Key key,
    @required this.label,
    this.onDeleted,
    this.isSelected = false,
  }) : super(key: key);

  final String label;
  final Function onDeleted;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
              child: Text(label,
                  style: EBTextStyles.bodyText1.copyWith(
                      color:
                          isSelected ? EBColors.primary : EBColors.grey100))),
          if (onDeleted != null) ...[
            EBSpacers.width12,
            GestureDetector(
              onTap: onDeleted,
              child: const Icon(
                Icons.cancel,
                color: EBColors.primary,
                size: 20,
              ),
            ),
          ],
        ],
      ),
      decoration: BoxDecoration(
        color: isSelected ? EBColors.lightBlue : EBColors.grey10,
        borderRadius: BorderRadius.circular(EBDimens.borderRadius),
        border: Border.all(
          color: isSelected ? EBColors.primary : EBColors.grey30,
          width: isSelected ? 2 : 1,
        ),
      ),
    );
  }
}
