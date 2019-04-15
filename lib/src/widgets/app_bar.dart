import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BeepAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BeepAppBar({
    Key key,
    @required this.title,
    this.leading = BeepDimens.dummyBox,
    this.trailing = BeepDimens.dummyBox,
    this.barHeight = BeepDimens.appBarHeight,
    this.preferredSize = const Size.fromHeight(BeepDimens.appBarHeight),
  }) : super(key: key);

  final String title;
  final Widget leading, trailing;
  final double barHeight;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.only(top: statusBarHeight, left: 8.0, right: 8.0),
      height: barHeight + statusBarHeight,
      decoration: BoxDecoration(
        boxShadow: BeepDimens.lightShadow,
        gradient: const LinearGradient(
          colors: BeepGradients.appBarGradient,
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(1.0, 0.0),
          stops: <double>[0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Row(
        children: <Widget>[
          leading,
          Expanded(child: Center(child: BeepActionBarText(title))),
          trailing,
        ],
      ),
    );
  }
}
