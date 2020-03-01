import 'package:eventbeep_ui/shared.dart';
import 'package:eventbeep_ui/shared/ui_helper.dart';
import 'package:eventbeep_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BeepEventCard extends StatelessWidget {
  const BeepEventCard({
    Key key,
    @required this.title,
    @required this.imageUrl,
    @required this.location,
    @required this.date,
    @required this.day,
    @required this.month,
    @required this.views,
    this.onTap,
    this.hasStudentOffer = false,
    this.category,
    this.height = BeepDimens.eventCardHeight,
    this.width = double.infinity,
  }) : super(key: key);

  final String title, imageUrl, location, date, day, month, category;
  final double height, width;
  final int views;
  final bool hasStudentOffer;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        child: Stack(
          children: <Widget>[
            eventCard(),
            eventThumbnail(),
            if (category != null)
              Padding(
                padding: const EdgeInsets.only(
                  top: BeepDimens.padding,
                  left: BeepDimens.padding * 2,
                ),
                child: BeepTag(
                  text: category,
                ),
              ),
            Positioned(
              top: height * 0.666 - 28,
              right: 28,
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black54,
                      blurRadius: 8,
                      offset: Offset(0, 0),
                    )
                  ],
                ),
                // margin: EdgeInsets.only(right: 32, top: height * 0.666 - 32),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Icon(
                      Icons.visibility,
                      size: BeepDimens.textSecondary,
                      color: BeepColors.white,
                    ),
                    const SizedBox(width: 6),
                    BeepCustomText(
                      text: views.toString(),
                      maxLines: 1,
                      color: BeepColors.white,
                      size: BeepDimens.textSecondary,
                      fontFamily: 'Heading',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget eventThumbnail() {
    return Container(
      height: height * 0.666,
      padding: const EdgeInsets.symmetric(horizontal: BeepDimens.padding),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(BeepDimens.cornerRadius),
      //   color: BeepColors.lightGrey,
      // ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(BeepDimens.cornerRadius),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          width: double.infinity,
          imageUrl: imageUrl,
          placeholder: (BuildContext context, String text) => SizedBox(
            height: double.infinity,
            child: Shimmer.fromColors(
              highlightColor: Colors.grey[100],
              baseColor: Colors.grey[300],
              child: Container(color: BeepColors.lightGrey),
            ),
          ),
        ),
      ),
    );
  }

  Widget eventCard() {
    return Container(
      padding: EdgeInsets.only(
        top: BeepDimens.cardMarginVertical + height * 0.333,
        bottom: BeepDimens.cardMarginVertical,
        left: BeepDimens.cardMarginHorizontal,
        right: BeepDimens.cardMarginHorizontal,
      ),
      margin: EdgeInsets.only(top: height * 0.333),
      decoration: BoxDecoration(
        color: BeepColors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(BeepDimens.cornerRadius),
        boxShadow: BeepDimens.lightShadow,
      ),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              BeepCustomText(
                  text: day,
                  size: BeepDimens.textSecondary,
                  fontFamily: 'Heading',
                  color: BeepColors.primary),
              UIHelper.verticalXS,
              BeepCustomText(
                  text: date,
                  size: BeepDimens.textPrimary,
                  fontFamily: 'Simple',
                  color: BeepColors.textPrimary),
              UIHelper.verticalXS,
              BeepCustomText(
                  text: month,
                  color: BeepColors.textSecondary,
                  size: BeepDimens.textSecondary,
                  fontFamily: 'Heading'),
            ],
          ),
          UIHelper.horizontalL,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (height != BeepDimens.eventCardHeight)
                  const SizedBox(height: 6),
                BeepCustomText(
                  text: title,
                  maxLines: 1,
                  size: BeepDimens.textSmallHeading,
                  fontFamily: 'Heading',
                  color: BeepColors.textPrimary,
                ),
                UIHelper.verticalS,
                Row(
                  children: <Widget>[
                    const Icon(Icons.location_on,
                        size: BeepDimens.textSecondary,
                        color: BeepColors.lightIcon),
                    UIHelper.horizontalXS,
                    Flexible(
                        child: BeepCustomText(
                      text: location,
                      maxLines: 1,
                      size: BeepDimens.textSecondary,
                      color: BeepColors.textSecondary,
                      fontFamily: 'Simple',
                    )),
                  ],
                ),
                hasStudentOffer ? UIHelper.verticalXS : Container(),
                hasStudentOffer
                    ? const BeepCustomText(
                        text: '% Students Offer available',
                        fontFamily: 'Simple',
                        size: BeepDimens.textSecondary,
                        color: BeepColors.success)
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BeepLoadingEvent extends StatelessWidget {
  const BeepLoadingEvent({
    this.height = BeepDimens.eventCardHeight,
    this.width = double.infinity,
  });

  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Stack(
        children: <Widget>[
          eventCard(),
          eventThumbnail(),
        ],
      ),
    );
  }

  Widget eventThumbnail() {
    return Shimmer.fromColors(
      highlightColor: Colors.grey[100],
      baseColor: Colors.grey[300],
      child: Container(
        height: height * 0.666,
        alignment: FractionalOffset.topCenter,
        margin: const EdgeInsets.symmetric(horizontal: BeepDimens.padding),
        decoration: BoxDecoration(
          color: BeepColors.white,
          borderRadius: BorderRadius.circular(BeepDimens.cornerRadius),
        ),
      ),
    );
  }

  Widget eventCard() {
    return Container(
      padding: EdgeInsets.only(
        top: BeepDimens.cardMarginVertical + height * 0.333,
        bottom: BeepDimens.cardMarginVertical,
        left: BeepDimens.cardMarginHorizontal,
        right: BeepDimens.cardMarginHorizontal,
      ),
      margin: EdgeInsets.only(top: height * 0.333),
      decoration: BoxDecoration(
          color: BeepColors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(BeepDimens.cornerRadius),
          boxShadow: BeepDimens.lightShadow),
      child: Shimmer.fromColors(
        highlightColor: Colors.grey[100],
        baseColor: Colors.grey[300],
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: BeepDimens.textSecondary,
                  width: 35,
                  color: BeepColors.white,
                ),
                UIHelper.verticalXS,
                Container(
                  height: BeepDimens.textPrimary,
                  width: 25,
                  color: BeepColors.white,
                ),
                UIHelper.verticalXS,
                Container(
                  height: BeepDimens.textSecondary,
                  width: 40,
                  color: BeepColors.white,
                ),
              ],
            ),
            UIHelper.horizontalL,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: BeepDimens.textActionBar,
                    width: 150,
                    color: BeepColors.white,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.location_on,
                          size: BeepDimens.textPrimary,
                          color: BeepColors.darkGrey),
                      UIHelper.horizontalXS,
                      Container(
                        height: BeepDimens.textSecondary,
                        width: 150,
                        color: BeepColors.white,
                      ),
                    ],
                  ),
                  // const SizedBox(height: 6),
                  // Container(
                  //   height: BeepDimens.textPrimary,
                  //   width: 180,
                  //   color: BeepColors.white,
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
