import 'package:ebeep_ui/widgets/text/text_styles.dart';
import 'package:flutter/material.dart';

import '../../shared.dart';

class EBTabBar extends StatelessWidget {
  const EBTabBar({
    Key key,
    @required this.tabs,
  }) : super(key: key);

  final List<Tab> tabs;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: EBColors.grey30,
      ),
      child: TabBar(
        tabs: tabs,
        labelStyle:
            EBTextStyles.bodyText2.copyWith(fontWeight: FontWeight.w500),
        unselectedLabelStyle: EBTextStyles.bodyText2,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: EBColors.grey10,
          boxShadow: [
            BoxShadow(
              color: EBColors.grey50,
              blurRadius: 1,
            ),
          ],
        ),
      ),
    );
  }
}
