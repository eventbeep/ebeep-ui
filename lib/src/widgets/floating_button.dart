import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BeepFloatingButton extends StatelessWidget {
  const BeepFloatingButton({
    @required this.icon,
    @required this.onPressed,
    this.increaseHeightBy = 30.0,
    this.increaseWidthBy = 0.0,
    this.elevation = 8.0,
    this.materialTapTargetSize,
    this.heroTag,
    this.tooltip,
  });

  final Widget icon;
  final VoidCallback onPressed;
  final double elevation;
  final double increaseHeightBy;
  final double increaseWidthBy;
  final String tooltip;

  final Object heroTag;
  final MaterialTapTargetSize materialTapTargetSize;

  @override
  Widget build(BuildContext context) {
    final ButtonThemeData buttonTheme =
        ButtonTheme.of(context).copyWith(padding: const EdgeInsets.all(0.0));
    return FloatingActionButton(
      elevation: elevation,
      onPressed: onPressed,
      clipBehavior: Clip.antiAlias,
      heroTag: heroTag,
      materialTapTargetSize: materialTapTargetSize,
      tooltip: tooltip,
      child: Container(
        height: buttonTheme.height + increaseHeightBy,
        width: buttonTheme.minWidth + increaseWidthBy,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: BeepGradients.appBarGradient,
          ),
        ),
        child: Center(child: icon),
      ),
    );
  }
}
