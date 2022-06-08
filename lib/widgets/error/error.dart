import 'package:flutter/material.dart';

import '../../colors/colors.dart';
import '../../widgets.dart';

class EBError extends StatelessWidget {
  const EBError({
    Key? key,
    this.errorMessage = 'Oops! Some error occurred',
    this.textColor = EBColors.grey100,
  }) : super(key: key);

  final String errorMessage;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: BeepTextStyles.body2.copyWith(color: textColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
