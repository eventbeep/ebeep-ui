import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:flutter/material.dart';

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
                  weight: FontWeight.w700,
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
