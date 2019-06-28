import 'package:cached_network_image/cached_network_image.dart';
import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:flutter/material.dart';

class BeepFestEventCard extends StatelessWidget {
  const BeepFestEventCard({
    Key key,
    @required this.imageUrl,
    @required this.eventName,
    @required this.onTap,
    @required this.startsAt,
  }) : super(key: key);

  final String imageUrl;
  final String eventName;
  final Function onTap;
  final String startsAt;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: BeepColors.white,
        borderRadius: BorderRadius.circular(BeepDimens.cornerRadius),
        boxShadow: BeepDimens.lightShadow,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(BeepDimens.cornerRadius),
                topRight: Radius.circular(BeepDimens.cornerRadius),
              ),
              // borderRadius: BorderRadius.circular(BeepDimens.cornerRadius),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                // height: 150,
                // width: double.infinity,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: BeepDimens.cardMarginVertical),
              child: BeepCustomText(
                text: eventName,
                size: BeepDimens.textPrimary,
                fontFamily: 'Heading',
                color: BeepColors.quaternary,
                // weight: FontWeight.bold,
                maxLines: 1,
              ),
            ),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: BeepDimens.cardMarginVertical),
              child: BeepSecondaryText(text: startsAt),
            ),
          ],
        ),
      ),
    );
  }
}
