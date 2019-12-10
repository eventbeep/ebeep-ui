import 'dart:collection';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eventbeep_ui/shared.dart';
// import 'package:eventbeep_ui/views/youtube_player_page.dart';
import 'package:eventbeep_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class BeepFeedCard extends StatefulWidget {
  const BeepFeedCard({
    Key key,
    @required this.authorName,
    @required this.authorImage,
    @required this.content,
    @required this.postedTime,
    @required this.feedType,
    @required this.likes,
    @required this.comments,
    @required this.context,
    this.feedVideo,
    this.feedImage,
    this.feedPoll,
    this.feedPollTaps,
    this.isLiked = false,
    this.likeAction,
    this.unlikeAction,
    this.commentAction,
    this.reportAction,
    this.deleteAction,
    this.collegeName,
    this.isOwner = false,
  }) : super(key: key);

  final String authorName,
      authorImage,
      content,
      postedTime,
      feedType,
      collegeName,
      feedVideo;
  final List<String> feedImage;
  final int likes, comments;
  final BuildContext context;
  final bool isLiked, isOwner;
  final Function likeAction,
      unlikeAction,
      commentAction,
      reportAction,
      deleteAction;
  final List<Function> feedPollTaps;
  final LinkedHashMap<String, int> feedPoll;

  @override
  _BeepFeedCardState createState() => _BeepFeedCardState();
}

class _BeepFeedCardState extends State<BeepFeedCard>
    with AutomaticKeepAliveClientMixin {
  bool isLiked;
  int likeCount;
  List<String> choices = <String>['Delete', 'Report'];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    isLiked = widget.isLiked;
    likeCount = widget.likes;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      decoration: const BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(BeepDimens.cornerRadius)),
          color: BeepColors.white,
          boxShadow: BeepDimens.lightShadow),
      child: Column(
        children: <Widget>[
          UIHelper.verticalL,
          feedHeader(),
          UIHelper.verticalL,
          feedMedia(),
          (widget.feedType == 'content') ? Container() : UIHelper.verticalL,
          feedContent(),
          UIHelper.verticalM,
          feedFooter(),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }

  Widget feedHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: BeepDimens.cardMarginHorizontal),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(widget.authorImage),
          ),
          UIHelper.horizontalL,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BeepCustomText(
                  text: widget.authorName,
                  maxLines: 1,
                  size: 16,
                  fontFamily: 'Simple',
                  color: BeepColors.textPrimary,
                ),
                UIHelper.verticalXS,
                BeepCustomText(
                  text: widget.collegeName,
                  size: 14,
                  fontFamily: 'Simple',
                  color: BeepColors.textSecondary,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          UIHelper.horizontalXL,
          /*
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: BeepColors.lightIcon),
            tooltip: 'Options',
            onSelected: (String selected) {
              switch (selected) {
                case 'Report':
                  print(selected);
                  widget.reportAction();
                  break;
                case 'Delete':
                  print(selected);
                  widget.deleteAction();
                  break;
                default:
              }
            },
            itemBuilder: (BuildContext context) {
              if (!widget.isOwner) {
                choices.remove('Delete');
              }
              return choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
                */
        ],
      ),
    );
  }

  Widget feedMedia() {
    switch (widget.feedType) {
      case 'image':
        return CachedNetworkImage(
          imageUrl: widget.feedImage[0],
          placeholder: (BuildContext context, String text) =>
              Shimmer.fromColors(
            highlightColor: Colors.grey[100],
            baseColor: Colors.grey[300],
            child: Container(color: BeepColors.lightGrey),
          ),
          height: 200,
          fit: BoxFit.cover,
          width: double.infinity,
        );
      case 'video':
        return Stack(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl:
                  'https://img.youtube.com/vi/${widget.feedVideo}/sddefault.jpg',
              placeholder: (BuildContext context, String text) =>
                  Shimmer.fromColors(
                highlightColor: Colors.grey[100],
                baseColor: Colors.grey[300],
                child: Container(color: BeepColors.lightGrey),
              ),
              height: 200,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 0,
              child: IconButton(
                icon: Icon(
                  Icons.play_arrow,
                  size: 56,
                  color: BeepColors.white,
                ),
                onPressed: () async {
                  if (await canLaunch(
                      'https://youtube.com/watch?v=${widget.feedVideo}')) {
                    final bool nativeAppLaunchSucceeded = await launch(
                      'https://youtube.com/watch?v=${widget.feedVideo}',
                      forceSafariVC: false,
                      universalLinksOnly: true,
                    );
                    if (!nativeAppLaunchSucceeded) {
                      await launch(
                        'https://youtube.com/watch?v=${widget.feedVideo}',
                        forceSafariVC: true,
                      );
                    }
                  }
                },
                // onPressed: () => Navigator.push(
                //   context,
                //   MaterialPageRoute<YoutubePlayerPage>(
                //       builder: (_) =>
                //           YoutubePlayerPage(videoId: widget.feedVideo)),
                // ),
              ),
            ),
          ],
        );

      // return Container();
      // case 'poll':
      //   return Padding(
      //     padding: const EdgeInsets.symmetric(
      //         horizontal: BeepDimens.cardMarginHorizontal),
      //     child: ,
      //   );
      //   break;
      case 'images':
        return Container(
          height: 200,
          color: BeepColors.cardBackground,
        );
      case 'content':
        return Container();
      default:
        return Container();
    }
  }

  Widget feedContent() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          horizontal: BeepDimens.cardMarginHorizontal),
      child: BeepSecondaryText(
        text: widget.content,
        maxLines: 2,
        align: TextAlign.start,
      ),
    );
  }

  Widget feedFooter() {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: BeepDimens.cardMarginVertical),
      child: Row(
        children: <Widget>[
          isLiked
              ? IconButton(
                  icon: const Icon(Icons.favorite),
                  color: BeepColors.secondary,
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                      likeCount = likeCount - 1;
                    });
                    return widget.unlikeAction();
                  },
                )
              : IconButton(
                  icon: const Icon(Icons.favorite_border),
                  color: BeepColors.lightIcon,
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                      likeCount = likeCount + 1;
                    });
                    return widget.likeAction();
                  },
                ),
          BeepSecondaryText(text: likeCount.toString()),
          UIHelper.horizontalS,
          IconButton(
            icon: const Icon(Icons.comment),
            color: BeepColors.lightIcon,
            onPressed: () {
              // _controller.pause();
              return widget.commentAction();
            },
          ),
          BeepSecondaryText(text: widget.comments.toString()),
          Spacer(),
          BeepSecondaryText(text: widget.postedTime),
          UIHelper.horizontalM,
        ],
      ),
    );
  }
}

class BeepLoadingFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(BeepDimens.cornerRadius)),
          color: BeepColors.white,
          boxShadow: BeepDimens.lightShadow),
      child: Shimmer.fromColors(
        highlightColor: Colors.grey[100],
        baseColor: Colors.grey[300],
        child: Column(
          children: <Widget>[
            UIHelper.verticalL,
            feedHeader(),
            UIHelper.verticalL,
            feedMedia(),
            UIHelper.verticalL,
            feedContent(),
            UIHelper.verticalM,
            feedFooter(),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }

  Widget feedHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: BeepDimens.cardMarginHorizontal),
      child: Row(
        children: <Widget>[
          const CircleAvatar(
            radius: 24,
          ),
          UIHelper.horizontalL,
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: BeepDimens.textSmallHeading,
                  width: 220,
                  color: BeepColors.white,
                ),
                const SizedBox(height: 6.0),
                Container(
                  height: BeepDimens.textPrimary,
                  width: 100,
                  color: BeepColors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget feedMedia() {
    return Container(
      height: 200,
      color: BeepColors.cardBackground,
    );
  }

  Widget feedContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: BeepDimens.cardMarginHorizontal),
      child: Container(
        height: BeepDimens.textActionBar * 2,
        width: double.infinity,
        color: BeepColors.white,
      ),
    );
  }

  Widget feedFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: BeepDimens.cardMarginHorizontal,
          vertical: BeepDimens.cardMarginVertical),
      child: Row(
        children: <Widget>[
          const Icon(Icons.favorite),
          UIHelper.horizontalS,
          Container(
            height: BeepDimens.textSmallHeading,
            width: 30,
            color: BeepColors.white,
          ),
          UIHelper.horizontalL,
          const Icon(Icons.comment),
          UIHelper.horizontalS,
          Container(
            height: BeepDimens.textSmallHeading,
            width: 30,
            color: BeepColors.white,
          ),
        ],
      ),
    );
  }
}
