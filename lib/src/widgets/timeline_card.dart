import 'package:flutter/material.dart';
import 'package:eventbeep_ui/eventbeep_ui.dart';

class BeepTimelineCard extends StatelessWidget {
  const BeepTimelineCard({
    Key key,
    @required this.shortDescription,
    @required this.eventName,
    @required this.eventDate,
    @required this.ticketQr,
    @required this.onViewTicket,
  }) : super(key: key);

  final String shortDescription, eventName, eventDate, ticketQr;
  final Function onViewTicket;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(flex: 5, fit: FlexFit.tight, child: leftSection()),
        const SizedBox(width: BeepDimens.cardMarginVertical),
        middleSection(),
        const SizedBox(width: BeepDimens.padding),
        Flexible(flex: 10, child: rightSection()),
      ],
    );
  }

  Widget leftSection() {
    return Column(
      children: <Widget>[
        BeepCustomText(
          text: eventDate,
          fontFamily: 'Quicksand',
          maxLines: 1,
          size: BeepDimens.textPrimary,
          weight: FontWeight.bold,
          color: BeepColors.textPrimary,
        ),
        const SizedBox(height: 4),
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
          height: 40.0,
          width: 2.0,
          color: BeepColors.primary,
        ),
        const CircleAvatar(radius: 6),
        Container(
          height: 44.0,
          width: 2.0,
          color: BeepColors.primary,
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
          fontFamily: 'Poppins',
          size: BeepDimens.textSmallHeading,
          weight: FontWeight.bold,
          color: BeepColors.textPrimary,
        ),
        const SizedBox(height: 4),
        BeepSecondaryText(text: shortDescription, maxLines: 2),
      ],
    );
  }
}
