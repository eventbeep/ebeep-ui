import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BeepAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget leading, trailing;
  final double barHeight = BeepDimens.appBarHeight;

  @override
  final Size preferredSize;

  BeepAppBar({
    Key key,
    @required this.title,
    this.leading = BeepDimens.dummyBox,
    this.trailing = BeepDimens.dummyBox,
  })  : preferredSize = Size.fromHeight(BeepDimens.appBarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return new Container(
      padding: new EdgeInsets.only(top: statusBarHeight, left: 8.0, right: 8.0),
      height: barHeight + statusBarHeight,
      decoration: new BoxDecoration(
        boxShadow: BeepDimens.lightShadow,
        gradient: new LinearGradient(
          colors: BeepColors.appBarGradient,
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
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
