import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BeepEventCard extends StatefulWidget {
  final String title, imageUrl, location, date, day, month;
  final double height, width;

  BeepEventCard({
    Key key,
    @required this.title,
    @required this.imageUrl,
    @required this.location,
    @required this.date,
    @required this.day,
    @required this.month,
    this.height = BeepDimens.eventCardHeight,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  _BeepEventCardState createState() => _BeepEventCardState();
}

//
class _BeepEventCardState extends State<BeepEventCard> {
  @override
  Widget build(BuildContext context) {
    return new Container(
//      height: widget.height,
      width: widget.width,
      child: new Stack(
        children: <Widget>[
          eventCard(),
          eventThumbnail(),
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
          widget.imageUrl,
          height: widget.height * 0.666,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget eventCard() {
    return Container(
      margin: new EdgeInsets.only(top: widget.height * 0.333),
      decoration: new BoxDecoration(
          color: BeepColors.white,
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(BeepDimens.cornerRadius),
          boxShadow: BeepDimens.lightShadow),
      child: Container(
        margin: EdgeInsets.only(top: widget.height * 0.333),
        padding: EdgeInsets.symmetric(
          vertical: BeepDimens.cardMarginVertical,
          horizontal: BeepDimens.cardMarginHorizontal,
        ),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              children: <Widget>[
                BeepSmallHeading(text: widget.day),
                BeepPrimaryText(text: widget.date),
                BeepPrimaryText(text: widget.month),
              ],
            ),
            Expanded(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BeepLargeHeading(
                      text: widget.title,
                      align: TextAlign.center,
                      maxLines: 1,
                    ),
                    BeepSmallHeading(
                      text: widget.location,
                      maxLines: 1,
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
}
