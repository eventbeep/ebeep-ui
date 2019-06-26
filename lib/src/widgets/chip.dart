import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:flutter/material.dart';

class BeepChip extends StatefulWidget {
  BeepChip({
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
  _BeepChipState createState() => _BeepChipState();
}

class _BeepChipState extends State<BeepChip> {
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
        label: BeepCustomText(
          text: widget.label,
          size: BeepDimens.textPrimary,
          color: isSelected ? BeepColors.white : BeepColors.tertiary,
          fontFamily: 'Simple',
        ),
        backgroundColor: isSelected ? BeepColors.primary : BeepColors.lightGrey,
        onDeleted: isSelected
            ? () {
                widget.onDeleted();
                setState(() {
                  isSelected = false;
                });
              }
            : null,
        deleteIconColor: BeepColors.white,
        deleteButtonTooltipMessage: 'Remove this interest',
      ),
    );
  }
}
