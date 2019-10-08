import 'package:eventbeep_ui/shared.dart';
import 'package:flutter/material.dart';
import 'package:eventbeep_ui/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:shimmer/shimmer.dart';

class BeepTimelineCard extends StatelessWidget {
  const BeepTimelineCard({
    Key key,
    @required this.shortDescription,
    @required this.eventName,
    @required this.eventDate,
    @required this.ticketQr,
    @required this.onViewTicket,
    this.isLast = false,
  }) : super(key: key);

  final String shortDescription, eventName, eventDate, ticketQr;
  final Function onViewTicket;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(flex: 5, fit: FlexFit.tight, child: leftSection()),
        UIHelper.horizontalM,
        middleSection(),
        UIHelper.horizontalL,
        Flexible(flex: 10, child: rightSection()),
      ],
    );
  }

  Widget leftSection() {
    return Column(
      children: <Widget>[
        BeepCustomText(
          text: eventDate,
          fontFamily: 'Simple',
          maxLines: 1,
          size: BeepDimens.textPrimary,
          weight: FontWeight.bold,
          color: BeepColors.textPrimary,
        ),
        UIHelper.verticalXS,
        Material(
          color: Colors.transparent,
          child: InkWell(
              onTap: onViewTicket,
              child: const BeepSecondaryText(text: 'View Ticket')),
        ),
      ],
    );
  }

  Widget middleSection() {
    return Column(
      children: <Widget>[
        Container(
          height: 38.0,
          width: 2.0,
          color: BeepColors.primary,
        ),
        const CircleAvatar(
          radius: 6,
          backgroundColor: BeepColors.primary,
        ),
        Container(
          height: 38.0,
          width: 2.0,
          color: isLast ? BeepColors.transparent : BeepColors.primary,
        ),
      ],
    );
  }

  Widget rightSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BeepCustomText(
          text: eventName,
          fontFamily: 'Heading',
          size: BeepDimens.textPrimary,
          weight: FontWeight.bold,
          color: BeepColors.textPrimary,
          maxLines: 1,
        ),
        // BeepSecondaryText(text: shortDescription, maxLines: 2),
        Html(
          data: shortDescription.substring(0, 55).trim() + '...',
          defaultTextStyle: TextStyle(
            fontSize: BeepDimens.textSecondary,
            color: BeepColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

class BeepLoadingTimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.grey[200],
      baseColor: Colors.grey[300],
      child: Row(
        children: <Widget>[
          Flexible(flex: 5, fit: FlexFit.tight, child: leftSection()),
          UIHelper.horizontalM,
          middleSection(),
          UIHelper.horizontalL,
          Flexible(flex: 10, child: rightSection()),
        ],
      ),
    );
  }

  Widget leftSection() {
    return Column(
      children: <Widget>[
        Container(height: BeepDimens.textPrimary, color: BeepColors.white),
        UIHelper.verticalS,
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          height: BeepDimens.textSecondary,
          color: BeepColors.white,
        ),
      ],
    );
  }

  Widget rightSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: BeepDimens.textSmallHeading,
          width: 120,
          color: BeepColors.white,
        ),
        const SizedBox(height: 6),
        Container(
          height: BeepDimens.textPrimary * 2,
          color: BeepColors.white,
        ),
      ],
    );
  }

  Widget middleSection() {
    return Column(
      children: <Widget>[
        Container(
          height: 38.0,
          width: 2.0,
          color: BeepColors.primary,
        ),
        const CircleAvatar(
          radius: 6,
        ),
        Container(
          height: 38.0,
          width: 2.0,
          color: BeepColors.primary,
        ),
      ],
    );
  }
}
