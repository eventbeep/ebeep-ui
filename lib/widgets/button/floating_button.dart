import 'package:flutter/material.dart';

import '../../shared.dart';

class EBFloatingButton extends StatelessWidget {
  const EBFloatingButton(
      {@required this.icon,
      @required this.onPressed,
      this.increaseHeightBy = 30.0,
      this.increaseWidthBy = 0.0,
      this.elevation = 8.0,
      this.materialTapTargetSize,
      this.heroTag,
      this.tooltip,
      this.shape});

  final Widget icon;
  final VoidCallback onPressed;
  final double elevation;
  final double increaseHeightBy;
  final double increaseWidthBy;
  final String tooltip;
  final ShapeBorder shape;
  final Object heroTag;
  final MaterialTapTargetSize materialTapTargetSize;

  @override
  Widget build(BuildContext context) {
    final buttonTheme =
        ButtonTheme.of(context).copyWith(padding: const EdgeInsets.all(0.0));
    return FloatingActionButton(
      elevation: elevation,
      onPressed: onPressed,
      clipBehavior: Clip.antiAlias,
      heroTag: heroTag,
      materialTapTargetSize: materialTapTargetSize,
      tooltip: tooltip,
      shape: shape,
      child: Container(
        height: buttonTheme.height + increaseHeightBy,
        width: buttonTheme.minWidth + increaseWidthBy,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: EBGradients.appBarGradient,
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
          ),
        ),
        child: Center(child: icon),
      ),
    );
  }
}
