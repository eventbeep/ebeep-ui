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
        label: Text(label),
        backgroundColor: BeepColors.primary,
        labelStyle: TextStyle(
          color: BeepColors.white,
        ),
        onDeleted: onDeleted,
        deleteIconColor: BeepColors.white,
        deleteButtonTooltipMessage: 'Remove this interest',
        elevation: 4.0,
      ),
    );
  }
}
