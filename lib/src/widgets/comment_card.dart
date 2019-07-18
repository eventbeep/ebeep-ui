import 'package:cached_network_image/cached_network_image.dart';
import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:flutter/material.dart';

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
        const SizedBox(width: BeepDimens.padding),
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
                  const SizedBox(width: BeepDimens.padding),
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
