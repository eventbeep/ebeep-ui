import 'package:eventbeep_ui/widgets.dart';
import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: BeepPrimaryText(text: 'Sorry! This is empty'));
  }
}

class OopsWidget extends StatelessWidget {
  const OopsWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: BeepPrimaryText(text: 'Oops! Some error occured'),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BeepLoading(),
    );
  }
}
