import 'package:cached_network_image/cached_network_image.dart';
import 'package:eventbeep_ui/shared.dart';
import 'package:eventbeep_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BeepCommentCard extends StatelessWidget {
  const BeepCommentCard({
    Key key,
    @required this.profileUrl,
    @required this.time,
    @required this.authorName,
    @required this.comment,
  }) : super(key: key);

  final String profileUrl;
  final String time;
  final String authorName;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(profileUrl),
          radius: 18,
        ),
        UIHelper.horizontalL,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: BeepCustomText(
                      fontFamily: 'Simple',
                      text: authorName,
                      size: BeepDimens.textPrimary,
                      color: BeepColors.quaternary,
                      maxLines: 1,
                    ),
                  ),
                  UIHelper.horizontalL,
                  BeepSecondaryText(text: time),
                ],
              ),
              const SizedBox(height: 8.0),
              BeepSecondaryText(text: comment),
            ],
          ),
        ),
      ],
    );
  }
}

class BeepLoadingComment extends StatelessWidget {
  const BeepLoadingComment({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.grey[100],
      baseColor: Colors.grey[300],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const CircleAvatar(radius: 19),
          UIHelper.horizontalL,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      height: BeepDimens.textSmallHeading,
                      width: 100,
                      color: BeepColors.white,
                    ),
                    const Spacer(),
                    Container(
                      height: BeepDimens.textSecondary,
                      width: 80,
                      color: BeepColors.white,
                    ),
                  ],
                ),
                UIHelper.verticalM,
                Container(
                  height: BeepDimens.textSecondary,
                  width: 250,
                  color: BeepColors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
