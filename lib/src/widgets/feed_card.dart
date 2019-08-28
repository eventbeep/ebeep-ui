import 'dart:collection';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:youtube_player/youtube_player.dart';

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
  }) : super(key: key);

  final String authorName,
      authorImage,
      content,
      postedTime,
      feedType,
      feedVideo,
      feedImage;
  final int likes, comments;
  final BuildContext context;
  final bool isLiked;
  final Function likeAction, unlikeAction, commentAction;
  final List<Function> feedPollTaps;
  final LinkedHashMap<String, int> feedPoll;

  @override
  _BeepFeedCardState createState() => _BeepFeedCardState();
}

class _BeepFeedCardState extends State<BeepFeedCard> {
  bool isLiked;
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    isLiked = widget.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius:
              const BorderRadius.all(Radius.circular(BeepDimens.cornerRadius)),
          color: BeepColors.white,
          boxShadow: BeepDimens.lightShadow),
      child: Column(
        children: <Widget>[
          const SizedBox(height: BeepDimens.padding),
          feedHeader(),
          const SizedBox(height: BeepDimens.padding),
          feedMedia(),
          (widget.feedType == 'content')
              ? Container()
              : const SizedBox(height: BeepDimens.padding),
          feedContent(),
          const SizedBox(height: BeepDimens.cardMarginVertical),
          feedFooter(),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }

  Widget feedHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: BeepDimens.cardMarginHorizontal),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(widget.authorImage),
          ),
          const SizedBox(width: BeepDimens.padding),
          Flexible(
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
                BeepCustomText(
                  text: widget.postedTime,
                  size: 14,
                  fontFamily: 'Simple',
                  color: BeepColors.textSecondary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget feedMedia() {
    switch (widget.feedType) {
      case 'image':
        return CachedNetworkImage(
          imageUrl: widget.feedImage,
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
        return YoutubePlayer(
          context: context,
          source: widget.feedVideo,
          quality: YoutubeQuality.MEDIUM,
          autoPlay: false,
          // callbackController is (optional).
          // use it to control player on your own.
          callbackController: (VideoPlayerController controller) {
            _controller = controller;
          },
        );
        // return YoutubePlayer(
        //   context: context,
        //   videoId: widget.feedVideo,
        //   flags: const YoutubePlayerFlags(
        //     autoPlay: false,
        //   ),
        //   videoProgressIndicatorColor: BeepColors.primary,
        //   progressColors: ProgressColors(
        //     playedColor: BeepColors.primary,
        //     handleColor: BeepColors.secondary,
        //   ),
        // );
        break;
      case 'poll':
        return Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: BeepDimens.cardMarginHorizontal),
          child: BeepPoll(
            map: widget.feedPoll,
            onTapItems: widget.feedPollTaps,
          ),
        );
        break;
      case 'images':
        return Container(
          height: 200,
          color: BeepColors.cardBackground,
        );
        break;
      case 'content':
        return Container();
        break;
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
                    });
                    return widget.likeAction();
                  },
                ),
          BeepSecondaryText(text: widget.likes.toString()),
          const SizedBox(width: BeepDimens.padding),
          IconButton(
            icon: const Icon(Icons.comment),
            color: BeepColors.lightIcon,
            onPressed: () {
              _controller.pause();
              return widget.commentAction;
            },
          ),
          BeepSecondaryText(text: widget.comments.toString()),
        ],
      ),
    );
  }
}

class BeepFeedTempCard extends StatelessWidget {
  const BeepFeedTempCard({
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
  }) : super(key: key);

  final String authorName,
      authorImage,
      content,
      postedTime,
      feedType,
      feedVideo,
      feedImage;
  final int likes, comments;
  final BuildContext context;
  final bool isLiked;
  final Function likeAction, unlikeAction, commentAction;
  final List<Function> feedPollTaps;
  final LinkedHashMap<String, int> feedPoll;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius:
              const BorderRadius.all(Radius.circular(BeepDimens.cornerRadius)),
          color: BeepColors.white,
          boxShadow: BeepDimens.lightShadow),
      child: Column(
        children: <Widget>[
          const SizedBox(height: BeepDimens.padding),
          feedHeader(),
          const SizedBox(height: BeepDimens.padding),
          feedMedia(),
          (feedType == 'content')
              ? Container()
              : const SizedBox(height: BeepDimens.padding),
          feedContent(),
          const SizedBox(height: BeepDimens.cardMarginVertical),
          feedFooter(),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }

  Widget feedHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: BeepDimens.cardMarginHorizontal),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(authorImage),
          ),
          const SizedBox(width: BeepDimens.padding),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BeepCustomText(
                  text: authorName,
                  maxLines: 1,
                  size: 16,
                  fontFamily: 'Simple',
                  color: BeepColors.textPrimary,
                ),
                BeepCustomText(
                  text: postedTime,
                  size: 14,
                  fontFamily: 'Simple',
                  color: BeepColors.textSecondary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget feedMedia() {
    switch (feedType) {
      case 'image':
        return CachedNetworkImage(
          imageUrl: feedImage,
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
        return YoutubePlayer(
          context: context,
          source: feedVideo,
          quality: YoutubeQuality.MEDIUM,
          autoPlay: false,
          // callbackController is (optional).
          // use it to control player on your own.
          callbackController: (VideoPlayerController controller) {
            // _controller = controller;
          },
        );
        break;
      case 'poll':
        return Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: BeepDimens.cardMarginHorizontal),
          child: BeepPoll(
            map: feedPoll,
            onTapItems: feedPollTaps,
          ),
        );
        break;
      case 'images':
        return Container(
          height: 200,
          color: BeepColors.cardBackground,
        );
        break;
      case 'content':
        return Container();
        break;
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
        text: content,
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
          /*
          isLiked
              ? IconButton(
                  icon: const Icon(Icons.favorite),
                  color: BeepColors.secondary,
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                    return unlikeAction();
                  },
                )
              : IconButton(
                  icon: const Icon(Icons.favorite_border),
                  color: BeepColors.lightIcon,
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                    return likeAction();
                  },
                ),
          BeepSecondaryText(text: likes.toString()),
          const SizedBox(width: BeepDimens.padding),
           */
          IconButton(
            icon: const Icon(Icons.comment),
            color: BeepColors.lightIcon,
            onPressed: () {
              // _controller.pause();
              return commentAction();
            },
          ),
          BeepSecondaryText(text: '${comments.toString()} Comments'),
          // const BeepSecondaryText(text: 'Comments'),
        ],
      ),
    );
  }
}

class BeepLoadingFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius:
              const BorderRadius.all(Radius.circular(BeepDimens.cornerRadius)),
          color: BeepColors.white,
          boxShadow: BeepDimens.lightShadow),
      child: Shimmer.fromColors(
        highlightColor: Colors.grey[100],
        baseColor: Colors.grey[300],
        child: Column(
          children: <Widget>[
            const SizedBox(height: BeepDimens.padding),
            feedHeader(),
            const SizedBox(height: BeepDimens.padding),
            feedMedia(),
            const SizedBox(height: BeepDimens.padding),
            feedContent(),
            const SizedBox(height: BeepDimens.cardMarginVertical),
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
          const SizedBox(width: BeepDimens.padding),
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
          const SizedBox(width: 8),
          Container(
            height: BeepDimens.textSmallHeading,
            width: 30,
            color: BeepColors.white,
          ),
          const SizedBox(width: BeepDimens.padding),
          const Icon(Icons.comment),
          const SizedBox(width: 8),
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
