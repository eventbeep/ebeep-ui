import 'package:flutter/material.dart';

import '../../shared.dart';
import '../../widgets.dart';

class EBEmpty extends StatelessWidget {
  const EBEmpty({
    Key? key,
    this.message = 'Sorry! This is empty',
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: BeepTextStyles.body2.copyWith(color: EBColors.beepNeutral2),
      ),
    );
  }
}
