import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BeepFeedCard extends StatelessWidget {
  const BeepFeedCard({
    Key key,
    @required this.authorName,
    @required this.authorImage,
    @required this.content,
    @required this.postedTime,
    this.feedType,
    @required this.likes,
    @required this.comments,
    this.postVideo,
    this.postImage,
  }) : super(key: key);

  final String authorName,
      authorImage,
      content,
      postedTime,
      feedType,
      postVideo,
      postImage;
  final int likes, comments;

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
          const SizedBox(height: BeepDimens.padding),
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
            backgroundImage: NetworkImage(authorImage),
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
                  fontFamily: 'Quicksand',
                  color: BeepColors.textPrimary,
                ),
                BeepCustomText(
                  text: postedTime,
                  size: 14,
                  fontFamily: 'Quicksand',
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
    return Container(
      height: 200,
      color: BeepColors.cardBackground,
    );
  }

  Widget feedContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: BeepDimens.cardMarginHorizontal),
      child: BeepSecondaryText(text: content, maxLines: 2),
    );
  }

  Widget feedFooter() {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: BeepDimens.cardMarginVertical),
      child: Row(
        children: <Widget>[
          IconButton(icon: const Icon(Icons.favorite), onPressed: () {}),
          BeepSecondaryText(text: likes.toString()),
          const SizedBox(width: BeepDimens.padding),
          IconButton(icon: const Icon(Icons.comment), onPressed: () {}),
          BeepSecondaryText(text: comments.toString()),
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
