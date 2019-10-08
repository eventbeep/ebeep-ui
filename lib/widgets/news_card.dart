import 'package:cached_network_image/cached_network_image.dart';
import 'package:eventbeep_ui/shared.dart';
import 'package:eventbeep_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BeepNewsCard extends StatelessWidget {
  const BeepNewsCard({
    Key key,
    @required this.title,
    @required this.description,
    @required this.authorName,
    @required this.authorImage,
    @required this.postedTime,
    @required this.stream,
    this.backgroundColor = BeepColors.primary,
  }) : super(key: key);

  final String title, description, authorName, postedTime, authorImage, stream;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: BeepDimens.cardMarginHorizontal),
      decoration: BoxDecoration(
          borderRadius:
              const BorderRadius.all(Radius.circular(BeepDimens.cornerRadius)),
          color: backgroundColor,
          boxShadow: BeepDimens.lightShadow),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UIHelper.verticalXL,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(authorImage),
              ),
              UIHelper.horizontalL,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BeepCustomText(
                      text: authorName,
                      weight: FontWeight.bold,
                      size: 16,
                      maxLines: 1,
                      fontFamily: 'Simple',
                      color: BeepColors.white,
                    ),
                    UIHelper.verticalS,
                    BeepCustomText(
                      text: stream,
                      weight: FontWeight.bold,
                      size: 14,
                      maxLines: 1,
                      fontFamily: 'Simple',
                      color: BeepColors.lightGrey,
                    ),
                  ],
                ),
              ),
              UIHelper.horizontalL,
              BeepCustomText(
                text: postedTime,
                size: 13,
                fontFamily: 'Simple',
                color: BeepColors.cardBackground,
                align: TextAlign.end,
                lineSpace: 1.3,
              ),
            ],
          ),
          UIHelper.verticalL,
          BeepCustomText(
            text: title,
            size: 18,
            fontFamily: 'Simple',
            color: BeepColors.white,
            weight: FontWeight.bold,
          ),
          UIHelper.verticalM,
          BeepCustomText(
            text: description,
            size: 14,
            fontFamily: 'Simple',
            color: BeepColors.white,
            lineSpace: 1.2,
          ),
          UIHelper.verticalXL,
        ],
      ),
    );
  }
}

class BeepLoadingNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: BeepDimens.cardMarginHorizontal),
      decoration: const BoxDecoration(
        borderRadius:
            BorderRadius.all(Radius.circular(BeepDimens.cornerRadius)),
        color: BeepColors.white,
        boxShadow: BeepDimens.lightShadow,
      ),
      child: Shimmer.fromColors(
        highlightColor: Colors.grey[100],
        baseColor: Colors.grey[300],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UIHelper.verticalXL,
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const CircleAvatar(radius: 24),
                UIHelper.horizontalL,
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: BeepDimens.textSmallHeading,
                        color: BeepColors.white,
                      ),
                      UIHelper.verticalM,
                      Container(
                        height: BeepDimens.textSecondary,
                        color: BeepColors.white,
                      ),
                    ],
                  ),
                ),
                UIHelper.horizontalL,
                Container(
                  height: BeepDimens.textPrimary,
                  width: 80,
                  color: BeepColors.white,
                ),
              ],
            ),
            UIHelper.verticalL,
            Container(
              height: BeepDimens.textSmallHeading,
              width: 220,
              color: BeepColors.white,
            ),
            UIHelper.verticalL,
            Container(
              height: BeepDimens.textSmallHeading * 6,
              width: double.infinity,
              color: BeepColors.white,
            ),
            UIHelper.verticalXL,
          ],
        ),
      ),
    );
  }
}
