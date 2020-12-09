import 'package:flutter/material.dart';

import '../../shared.dart';

class EBTextButton extends StatelessWidget {
  const EBTextButton({
    Key key,
    @required this.title,
    @required this.onPressed,
  }) : super(key: key);

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 32,
      minWidth: 42,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(EBDimens.borderRadius),
      ),
      child: FlatButton(
        child: Text(title),
        onPressed: onPressed,
      ),
    );
  }
}
