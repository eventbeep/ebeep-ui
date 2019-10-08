import 'package:cached_network_image/cached_network_image.dart';
import 'package:eventbeep_ui/shared.dart';
import 'package:eventbeep_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BeepFestEventCard extends StatelessWidget {
  const BeepFestEventCard({
    Key key,
    @required this.imageUrl,
    @required this.eventName,
    @required this.onTap,
    @required this.startsAt,
    @required this.price,
  }) : super(key: key);

  final String imageUrl;
  final String eventName;
  final Function onTap;
  final String startsAt;
  final String price;

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
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(BeepDimens.cornerRadius),
                  topRight: Radius.circular(BeepDimens.cornerRadius),
                ),
                // borderRadius: BorderRadius.circular(BeepDimens.cornerRadius),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  placeholder: (BuildContext context, String value) =>
                      Shimmer.fromColors(
                    highlightColor: Colors.grey[100],
                    baseColor: Colors.grey[300],
                    child: Container(color: BeepColors.lightGrey),
                  ),
                ),
              ),
            ),
            UIHelper.verticalS,
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: BeepDimens.cardMarginVertical),
              child: BeepCustomText(
                text: eventName,
                size: BeepDimens.textPrimary,
                fontFamily: 'Heading',
                color: BeepColors.textPrimary,
                // weight: FontWeight.bold,
                maxLines: 1,
              ),
            ),
            UIHelper.verticalXS,
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: BeepDimens.cardMarginVertical),
              child: BeepSecondaryText(text: startsAt),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: BeepDimens.cardMarginVertical),
              child: BeepSecondaryText(text: price),
            ),
            UIHelper.verticalM,
          ],
        ),
      ),
    );
  }
}

class BeepFestEventLoading extends StatelessWidget {
  const BeepFestEventLoading({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: BeepColors.white,
        borderRadius: BorderRadius.circular(BeepDimens.cornerRadius),
        boxShadow: BeepDimens.lightShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(BeepDimens.cornerRadius),
                topRight: Radius.circular(BeepDimens.cornerRadius),
              ),
              // borderRadius: BorderRadius.circular(BeepDimens.cornerRadius),
              child: Shimmer.fromColors(
                highlightColor: Colors.grey[100],
                baseColor: Colors.grey[300],
                child: Container(color: BeepColors.lightGrey),
              ),
            ),
          ),
          UIHelper.verticalM,
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: BeepDimens.cardMarginVertical),
            child: Shimmer.fromColors(
              highlightColor: Colors.grey[100],
              baseColor: Colors.grey[300],
              child: Container(
                color: BeepColors.lightGrey,
                height: BeepDimens.textSmallHeading,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: BeepDimens.cardMarginVertical),
            child: Shimmer.fromColors(
              highlightColor: Colors.grey[100],
              baseColor: Colors.grey[300],
              child: Container(
                color: BeepColors.lightGrey,
                height: BeepDimens.textSecondary,
                width: 100,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: BeepDimens.cardMarginVertical),
            child: Shimmer.fromColors(
              highlightColor: Colors.grey[100],
              baseColor: Colors.grey[300],
              child: Container(
                color: BeepColors.lightGrey,
                height: BeepDimens.textPrimary,
                width: 120,
              ),
            ),
          ),
          UIHelper.verticalM,
        ],
      ),
    );
  }
}
