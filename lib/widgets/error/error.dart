import 'package:flutter/material.dart';

import '../../widgets.dart';

class EBError extends StatelessWidget {
  const EBError({
    Key key,
    this.errorMessage = 'Oops! Some error occured',
  }) : super(key: key);

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: EBTextStyles.bodyText1,
        textAlign: TextAlign.center,
      ),
    );
  }
}
