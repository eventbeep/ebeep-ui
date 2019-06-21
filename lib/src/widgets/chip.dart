import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:flutter/material.dart';

class BeepChip extends StatefulWidget {
  BeepChip({
    Key key,
    @required this.label,
    this.onDeleted,
    this.onSelected,
  }) : super(key: key);

  final String label;
  final Function onDeleted;
  final Function onSelected;

  @override
  _BeepChipState createState() => _BeepChipState();
}

class _BeepChipState extends State<BeepChip> {
  bool isSelected;

  @override
  void didChangeDependencies() {
    isSelected = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isSelected
          ? null
          : () {
              setState(() {
                isSelected = true;
              });
              return widget.onSelected;
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
                setState(() {
                  isSelected = false;
                });
                return widget.onDeleted;
              }
            : null,
        deleteIconColor: BeepColors.white,
        deleteButtonTooltipMessage: 'Remove this interest',
      ),
    );
  }
}
