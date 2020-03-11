import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../shared.dart';
import '../widgets.dart';

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
          radius: 16,
        ),
        UIHelper.horizontalL,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  BeepSecondaryText(text: authorName),
                  const BeepCustomText(
                    text: ' · ',
                    weight: FontWeight.bold,
                    size: BeepDimens.textSecondary,
                  ),
                  BeepCustomText(
                    text: time,
                    size: 12,
                  ),
                ],
              ),
              UIHelper.horizontalS,
              BeepPrimaryText(text: comment),
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
          const CircleAvatar(radius: 16),
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
                    // const Spacer(),
                    // Container(
                    //   height: BeepDimens.textSecondary,
                    //   width: 80,
                    //   color: BeepColors.white,
                    // ),
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
