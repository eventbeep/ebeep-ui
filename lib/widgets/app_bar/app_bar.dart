import 'package:flutter/material.dart';

import '../../shared.dart';
import '../../shared/dimens.dart';
import '../../widgets.dart';

class EBAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EBAppBar({
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
          left: EBDimens.cardMarginVertical,
          right: EBDimens.cardMarginVertical,
        ),
        child: Row(
          children: <Widget>[
            if (leading != null)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: EBDimens.cardMarginVertical,
                ),
                child: leading,
              ),
            UIHelper.horizontalM,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: BeepActionBarText(
                  text: title,
                  singleLine: !isMultiline,
                  color: isDark ? EBColors.white : null,
                ),
                // child: Text(title, style: EBTextStyles.headline5),
              ),
            ),
            UIHelper.horizontalM,
            if (trailing != null)
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: EBDimens.cardMarginVertical),
                child: trailing,
              ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
