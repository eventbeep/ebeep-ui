import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
    this.hasStudentOffer = false,
    this.category,
    this.height = BeepDimens.eventCardHeight,
    this.width = double.infinity,
  }) : super(key: key);

  final String title, imageUrl, location, date, day, month, category;
  final double height, width;
  final int views;
  final bool hasStudentOffer;

  @override
  Widget build(BuildContext context) {
    return Container(
//      height: widget.height,
      width: width,
      child: Stack(
        children: <Widget>[
          eventCard(),
          eventThumbnail(),
          (category == null)
              ? Container()
              : Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: BeepDimens.padding,
                      horizontal: BeepDimens.padding * 2),
                  child: BeepTag(
                    text: category,
                  ),
                ),
          Positioned(
            top: height * 0.666 - 28,
            right: 28,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: const <BoxShadow>[
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
                  const Icon(Icons.visibility,
                      size: BeepDimens.textPrimary, color: BeepColors.white),
                  const SizedBox(width: 4),
                  Flexible(
                      child: BeepCustomText(
                    text: views.toString(),
                    maxLines: 1,
                    color: BeepColors.white,
                    size: BeepDimens.textSecondary,
                    fontFamily: 'Quicksand',
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget eventThumbnail() {
    return Container(
      alignment: FractionalOffset.topCenter,
      padding: const EdgeInsets.symmetric(horizontal: BeepDimens.padding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(BeepDimens.cornerRadius),
        child: Image.network(
          imageUrl,
          height: height * 0.666,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget eventCard() {
    return Container(
      margin: EdgeInsets.only(top: height * 0.333),
      decoration: BoxDecoration(
          color: BeepColors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(BeepDimens.cornerRadius),
          boxShadow: BeepDimens.lightShadow),
      child: Container(
        margin: EdgeInsets.only(top: height * 0.333),
        padding: const EdgeInsets.symmetric(
          vertical: BeepDimens.cardMarginVertical,
          horizontal: BeepDimens.cardMarginHorizontal,
        ),
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                BeepCustomText(
                    text: day,
                    size: BeepDimens.textPrimary,
                    fontFamily: 'Quicksand',
                    color: BeepColors.primary),
                BeepCustomText(
                    text: date,
                    size: BeepDimens.textSmallHeading,
                    fontFamily: 'Quicksand',
                    color: BeepColors.textPrimary),
                BeepCustomText(
                    text: month,
                    size: BeepDimens.textSecondary,
                    fontFamily: 'Quicksand'),
              ],
            ),
            const SizedBox(width: BeepDimens.padding),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BeepCustomText(
                    text: title,
                    maxLines: 1,
                    size: BeepDimens.textSmallHeading,
                    fontFamily: 'Poppins',
                    color: BeepColors.textPrimary,
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.location_on,
                          size: BeepDimens.textPrimary,
                          color: BeepColors.lightGrey),
                      const SizedBox(width: 4),
                      Flexible(
                          child: BeepCustomText(
                        text: location,
                        maxLines: 1,
                        size: BeepDimens.textSecondary,
                        fontFamily: 'Quicksand',
                      )),
                    ],
                  ),
                  const SizedBox(height: 4),
                  hasStudentOffer
                      ? const BeepCustomText(
                          text: '% Students Offer available',
                          fontFamily: 'Quicksand',
                          size: BeepDimens.textSecondary,
                          color: BeepColors.success)
                      : Container(),
                ],
              ),
            ),
          ],
        ),
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
      margin: EdgeInsets.only(top: height * 0.333),
      decoration: BoxDecoration(
          color: BeepColors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(BeepDimens.cornerRadius),
          boxShadow: BeepDimens.lightShadow),
      child: Container(
        margin: EdgeInsets.only(top: height * 0.333),
        padding: const EdgeInsets.symmetric(
          vertical: BeepDimens.cardMarginVertical,
          horizontal: BeepDimens.cardMarginHorizontal,
        ),
        width: double.infinity,
        child: Shimmer.fromColors(
          highlightColor: Colors.grey[100],
          baseColor: Colors.grey[300],
          child: Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: BeepDimens.textPrimary,
                    width: 35,
                    color: BeepColors.white,
                  ),
                  const SizedBox(height: 4),
                  Container(
                    height: BeepDimens.textActionBar,
                    width: 25,
                    color: BeepColors.white,
                  ),
                  const SizedBox(height: 4),
                  Container(
                    height: BeepDimens.textPrimary,
                    width: 40,
                    color: BeepColors.white,
                  ),
                ],
              ),
              const SizedBox(width: BeepDimens.padding),
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
                            color: BeepColors.lightGrey),
                        const SizedBox(width: 4),
                        Container(
                          height: BeepDimens.textActionBar,
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
      ),
    );
  }
}
