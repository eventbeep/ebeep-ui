import 'package:cached_network_image/cached_network_image.dart';
import 'package:eventbeep_ui/widgets.dart';
import 'package:eventbeep_ui/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class BeepOrganiserCard extends StatefulWidget {
  const BeepOrganiserCard({
    Key key,
    this.name,
    this.image,
    this.college,
    this.followAction,
    this.unfollowAction,
    this.followed = false,
  }) : super(key: key);

  final String name;
  final String image;
  final String college;
  final Function followAction;
  final Function unfollowAction;
  final bool followed;
  @override
  _BeepOrganiserCardState createState() => _BeepOrganiserCardState();
}

class _BeepOrganiserCardState extends State<BeepOrganiserCard> {
  bool hasFollowed;
  @override
  void initState() {
    hasFollowed = widget.followed;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(widget.image),
        ),
        UIHelper.horizontalL,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BeepCustomText(
                text: widget.name,
                fontFamily: 'Heading',
                maxLines: 1,
                color: BeepColors.quaternary,
                size: BeepDimens.textPrimary,
                weight: FontWeight.bold,
              ),
              BeepSecondaryText(text: widget.college),
            ],
          ),
        ),
        UIHelper.horizontalL,
        OutlineButton.icon(
          borderSide: BorderSide(
            color: hasFollowed ? BeepColors.lightIcon : BeepColors.tertiary,
            width: 2.0,
          ),
          icon: Icon(
            hasFollowed ? Icons.clear : Icons.add,
            color: hasFollowed ? BeepColors.lightIcon : BeepColors.tertiary,
            size: 18,
          ),
          label: BeepCustomText(
            text: hasFollowed ? 'Unfollow' : 'Follow',
            fontFamily: 'Simple',
            maxLines: 1,
            color: hasFollowed ? BeepColors.lightIcon : BeepColors.tertiary,
            size: BeepDimens.textPrimary,
            weight: FontWeight.bold,
          ),
          onPressed: () {
            if (hasFollowed) {
              widget.unfollowAction();
            } else {
              widget.followAction();
            }
            setState(() {
              hasFollowed = !hasFollowed;
            });
          },
        )
      ],
    );
  }
}
