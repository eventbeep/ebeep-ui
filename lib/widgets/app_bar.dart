import 'package:eventbeep_ui/shared.dart';
import 'package:eventbeep_ui/shared/dimens.dart';
import 'package:eventbeep_ui/widgets.dart';
import 'package:flutter/material.dart';

class BeepAppBar extends StatelessWidget {
  const BeepAppBar({
    Key key,
    @required this.title,
    this.leading,
    this.trailing,
    this.isMultiline = false,
    this.isDark = false,
  }) : super(key: key);

  final String title;
  final Widget leading, trailing;
  final bool isMultiline;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(
          left: BeepDimens.cardMarginVertical,
          right: BeepDimens.cardMarginVertical,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: BeepDimens.cardMarginVertical),
              child: leading,
            ),
            UIHelper.horizontalM,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: BeepActionBarText(
                  text: title,
                  singleLine: !isMultiline,
                  color: isDark ? BeepColors.white : null,
                ),
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
      ),
    );
  }
}
