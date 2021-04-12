import 'package:flutter/material.dart';

import '../../colors/colors.dart';

class EBIconButton extends StatelessWidget {
  const EBIconButton({
    Key key,
    @required this.icon,
    @required this.onPressed,
  }) : super(key: key);

  final Widget icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
      elevation: 0,
      fillColor: EBColors.lightBlue,
      // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: const CircleBorder(),
      child: icon,
      onPressed: onPressed,
    );
  }
}
