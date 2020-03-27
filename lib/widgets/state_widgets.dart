import 'package:flutter/material.dart';

import '../widgets.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    Key key,
    this.message = 'Sorry! This is empty',
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(child: BeepPrimaryText(text: message));
  }
}

class OopsWidget extends StatelessWidget {
  const OopsWidget({
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

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: BeepLoading(),
    );
  }
}
