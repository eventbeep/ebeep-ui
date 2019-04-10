import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:flutter/material.dart';

class BeepChip extends StatelessWidget {
  final String label;
  final Function onDeleted;
  final Function onSelected;

  const BeepChip({
    Key key,
    @required this.label,
    this.onDeleted,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Chip(
//        labelPadding: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        label: BeepCustomText(
            text: label, size: BeepDimens.textPrimary, color: BeepColors.white),
        backgroundColor: BeepColors.primary,
        onDeleted: onDeleted,
        deleteIconColor: BeepColors.white,
        deleteButtonTooltipMessage: 'Remove this interest',
        elevation: 4.0,
      ),
    );
  }
}
