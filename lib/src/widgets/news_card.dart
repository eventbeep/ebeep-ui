import 'package:eventbeep_ui/eventbeep_ui.dart';
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
    this.backgroundColor = BeepColors.primary,
  }) : super(key: key);

  final String title, description, authorName, postedTime, authorImage;
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
          const SizedBox(height: BeepDimens.cardMarginHorizontal),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(authorImage),
              ),
              const SizedBox(width: BeepDimens.padding),
              Expanded(
                child: BeepCustomText(
                  text: authorName,
                  weight: FontWeight.bold,
                  size: 16,
                  maxLines: 2,
                  fontFamily: 'Quicksand',
                  color: BeepColors.white,
                ),
              ),
              const SizedBox(width: BeepDimens.padding),
              BeepCustomText(
                text: postedTime,
                size: 14,
                fontFamily: 'Quicksand',
                color: BeepColors.cardBackground,
              ),
            ],
          ),
          const SizedBox(height: BeepDimens.cardMarginHorizontal),
          BeepCustomText(
            text: title,
            size: 18,
            fontFamily: 'Quicksand',
            color: BeepColors.white,
          ),
          const SizedBox(height: BeepDimens.padding),
          BeepCustomText(
            text: description,
            size: 14,
            fontFamily: 'Quicksand',
            color: BeepColors.white,
          ),
          const SizedBox(height: BeepDimens.cardMarginHorizontal),
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
      decoration: BoxDecoration(
        borderRadius:
            const BorderRadius.all(Radius.circular(BeepDimens.cornerRadius)),
        color: BeepColors.white,
        boxShadow: BeepDimens.lightShadow,
      ),
      child: Shimmer.fromColors(
        highlightColor: Colors.grey[100],
        baseColor: Colors.grey[300],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: BeepDimens.cardMarginHorizontal),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const CircleAvatar(radius: 24),
                const SizedBox(width: BeepDimens.padding),
                Expanded(
                  child: Container(
                    height: BeepDimens.textActionBar,
                    color: BeepColors.white,
                  ),
                ),
                const SizedBox(width: BeepDimens.padding),
                Container(
                  height: BeepDimens.textPrimary,
                  width: 80,
                  color: BeepColors.white,
                ),
              ],
            ),
            const SizedBox(height: BeepDimens.cardMarginHorizontal),
            Container(
              height: BeepDimens.textSmallHeading,
              width: 220,
              color: BeepColors.white,
            ),
            const SizedBox(height: BeepDimens.padding),
            Container(
              height: BeepDimens.textSmallHeading * 6,
              width: double.infinity,
              color: BeepColors.white,
            ),
            const SizedBox(height: BeepDimens.cardMarginHorizontal),
          ],
        ),
      ),
    );
  }
}
