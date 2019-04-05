import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:flutter/material.dart';

class BeepChip extends StatelessWidget {
  final String label;

  const BeepChip({Key key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: BeepColors.primary,
    );
  }
}
