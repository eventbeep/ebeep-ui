import 'package:flutter/material.dart';

import '../text/text.dart';

class EBEmpty extends StatelessWidget {
  const EBEmpty({
    Key key,
    this.message = 'Sorry! This is empty',
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(child: BeepPrimaryText(text: message));
  }
}
