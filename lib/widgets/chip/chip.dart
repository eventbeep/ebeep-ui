import 'package:flutter/material.dart';

import '../../shared.dart';
import '../../widgets.dart';

class EBChip extends StatefulWidget {
  const EBChip({
    Key key,
    @required this.label,
    this.onDeleted,
    this.onSelected,
    this.isSelected = false,
  }) : super(key: key);

  final String label;
  final Function onDeleted;
  final Function onSelected;
  final bool isSelected;

  @override
  _EBChipState createState() => _EBChipState();
}

class _EBChipState extends State<EBChip> {
  bool isSelected;

  @override
  void didChangeDependencies() {
    isSelected = widget.isSelected;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isSelected
          ? null
          : () {
              widget.onSelected();
              setState(() {
                isSelected = true;
              });
            },
      child: Chip(
        padding: const EdgeInsets.all(8),
        label: EBText(
          text: widget.label,
          size: EBDimens.textPrimary,
          color: isSelected ? EBColors.white : EBColors.tertiary,
          fontFamily: 'Simple',
        ),
        backgroundColor: isSelected ? EBColors.primary : EBColors.lightGrey,
        onDeleted: isSelected
            ? () {
                widget.onDeleted();
                setState(() {
                  isSelected = false;
                });
              }
            : null,
        deleteIconColor: EBColors.white,
        deleteButtonTooltipMessage: 'Remove this interest',
      ),
    );
  }
}
