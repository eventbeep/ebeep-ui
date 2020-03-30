import 'package:flutter/material.dart';

import '../text/text.dart';

class EBError extends StatelessWidget {
  const EBError({
    Key key,
    this.errorMessage = 'Oops! Some error occured',
  }) : super(key: key);

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BeepPrimaryText(
        text: errorMessage,
        align: TextAlign.center,
      ),
    );
  }
}
