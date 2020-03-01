import 'package:cached_network_image/cached_network_image.dart';
import 'package:eventbeep_ui/shared.dart';
import 'package:eventbeep_ui/widgets.dart';
import 'package:flutter/material.dart';

class QuizCard extends StatelessWidget {
  const QuizCard(
      {Key key,
      @required this.imageUrl,
      @required this.name,
      @required this.onTap,
      @required this.startsAt,
      this.width = double.infinity})
      : super(key: key);

  final String imageUrl;
  final String name;
  final Function onTap;
  final String startsAt;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        width: width,
        decoration: BoxDecoration(
          color: BeepColors.white,
          borderRadius: BorderRadius.circular(BeepDimens.cornerRadius),
          boxShadow: BeepDimens.lightShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(BeepDimens.cornerRadius),
                topRight: Radius.circular(BeepDimens.cornerRadius),
              ),
              child: AspectRatio(
                aspectRatio: 2,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            UIHelper.verticalL,
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: BeepDimens.padding),
              child: BeepCustomText(
                text: name,
                size: BeepDimens.textButtonSize,
                fontFamily: 'Heading',
                color: BeepColors.textPrimary,
                weight: FontWeight.bold,
                maxLines: 1,
              ),
            ),
            UIHelper.verticalS,
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: BeepDimens.padding),
              child: BeepPrimaryText(text: startsAt),
            ),
            UIHelper.verticalL,
          ],
        ),
      ),
    );
  }
}
