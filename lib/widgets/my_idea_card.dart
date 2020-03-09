import 'package:flutter/material.dart';

import '../shared.dart';
import '../widgets.dart';

class BeepMyIdeaCard extends StatelessWidget {
  const BeepMyIdeaCard({
    Key key,
    @required this.name,
    @required this.onEditTap,
    @required this.onTeamTap,
    @required this.onRequestTap,
    @required this.onDiscussionTap,
    @required this.backgroundColor,
    @required this.image,
    @required this.isAuthor,
    @required this.authorName,
  }) : super(key: key);

  final String image;
  final String name;
  final String authorName;
  final Function onEditTap;
  final Function onRequestTap;
  final Function onDiscussionTap;
  final Function onTeamTap;
  final Color backgroundColor;
  final bool isAuthor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(BeepDimens.cornerRadius),
        boxShadow: BeepDimens.lightShadow,
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.asset(image, width: 80),
              UIHelper.horizontalL,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    BeepCustomText(
                      text: name,
                      size: 22,
                      color: BeepColors.white,
                      weight: FontWeight.bold,
                      // align: TextAlign.center,
                      lineSpace: 1.3,
                    ),
                    if (!isAuthor) UIHelper.verticalM,
                    if (!isAuthor)
                      BeepCustomText(
                        text: 'By $authorName',
                        size: 14,
                        color: BeepColors.white,
                        weight: FontWeight.bold,
                      ),
                  ],
                ),
              ),
            ],
          ),
          UIHelper.verticalM,
          Wrap(
            spacing: 16,
            alignment: WrapAlignment.spaceAround,
            children: <Widget>[
              if (isAuthor)
                getTapItem('Requests', onRequestTap, Icons.person_add),
              getTapItem('Members', onTeamTap, Icons.group),
              getTapItem('Discussions', onDiscussionTap, Icons.forum),
              getTapItem('View', onEditTap, Icons.open_in_new),
            ],
          )
        ],
      ),
    );
  }

  Widget getTapItem(String text, Function onTap, IconData iconData) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: backgroundColor.withAlpha(200),
          // color: BeepColors.primary,
        ),
        child: Column(
          children: <Widget>[
            Icon(
              iconData,
              color: BeepColors.white,
            ),
            UIHelper.verticalS,
            BeepCustomText(
              text: text,
              size: 12,
              color: BeepColors.white,
            )
          ],
        ),
      ),
    );
  }
}
