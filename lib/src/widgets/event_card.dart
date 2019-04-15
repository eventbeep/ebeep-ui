import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//
class BeepEventCard extends StatelessWidget {
  const BeepEventCard({
    Key key,
    @required this.title,
    @required this.imageUrl,
    @required this.location,
    @required this.date,
    @required this.day,
    @required this.month,
    this.category,
    this.height = BeepDimens.eventCardHeight,
    this.width = double.infinity,
  }) : super(key: key);

  final String title, imageUrl, location, date, day, month, category;
  final double height, width;

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
          mainAxisAlignment: MainAxisAlignment.start,
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
                    size: 20,
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
                        size: BeepDimens.textPrimary,
                        fontFamily: 'Quicksand',
                      )),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const BeepCustomText(
                      text: '% Students Offer available',
                      fontFamily: 'Quicksand',
                      size: BeepDimens.textSecondary,
                      color: BeepColors.success),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
