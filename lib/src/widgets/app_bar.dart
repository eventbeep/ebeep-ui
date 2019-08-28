import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BeepAppBar extends StatelessWidget {
  const BeepAppBar({
    Key key,
    @required this.title,
    this.leading,
    this.trailing,
    this.isMultiline = false,
  }) : super(key: key);

  final String title;
  final Widget leading, trailing;
  final bool isMultiline;

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.only(
        left: BeepDimens.cardMarginVertical,
        right: BeepDimens.cardMarginVertical,
        top: statusBarHeight,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: BeepDimens.cardMarginVertical),
            child: leading,
          ),
          const SizedBox(width: BeepDimens.cardMarginVertical),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: BeepActionBarText(text: title, singleLine: !isMultiline),
            ),
          ),
          (trailing == null)
              ? Container()
              : Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: BeepDimens.cardMarginVertical),
                  child: trailing,
                ),
        ],
      ),
    );
  }
}
