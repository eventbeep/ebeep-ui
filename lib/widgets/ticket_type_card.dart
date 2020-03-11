import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../shared.dart';
import '../widgets.dart';

class BeepTicketTypeCard extends StatelessWidget {
  const BeepTicketTypeCard({
    @required this.title,
    @required this.description,
    @required this.ticketStatus,
  });

  final String title, description;
  final String ticketStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: BeepColors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(BeepDimens.cornerRadius),
          boxShadow: BeepDimens.lightShadow),
      child: Row(
        children: <Widget>[
          countSection(),
          Expanded(child: ticketDetailSection()),
          const SizedBox(
            width: 40,
            height: 94,
          ),
        ],
      ),
    );
  }

  Widget countSection() {
    return Container(
      height: 60,
      width: 60,
      margin: const EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: BeepColors.cardBackground),
      child: const BeepCustomText(
        text: '0',
        size: 36,
        color: BeepColors.textSecondary,
        weight: FontWeight.bold,
        fontFamily: 'Heading',
      ),
    );
  }

  Widget ticketDetailSection() {
    return Column(
      children: <Widget>[
        BeepPrimaryText(text: title, align: TextAlign.center),
        const SizedBox(height: 4.0),
        BeepSecondaryText(text: description, align: TextAlign.center),
        const SizedBox(height: 8.0),
        BeepCustomText(
            text: ticketStatus,
            color: BeepColors.secondary,
            weight: FontWeight.bold,
            size: 18,
            fontFamily: 'Simple'),
      ],
    );
  }
}

class BeepLoadingTicket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
            countSection(),
            Expanded(child: ticketDetailSection()),
            buttonsSection(),
          ],
        ),
      ),
    );
  }

  Widget countSection() {
    return Container(
      height: 60,
      width: 60,
      margin: const EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      child: const BeepCustomText(
        text: '0',
        size: 36,
        color: BeepColors.textSecondary,
        weight: FontWeight.bold,
        fontFamily: 'Heading',
      ),
    );
  }

  Widget ticketDetailSection() {
    return Column(
      children: <Widget>[
        UIHelper.verticalM,
        Container(
          height: BeepDimens.textActionBar,
          width: 120,
          color: BeepColors.white,
        ),
        const SizedBox(height: 6.0),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: BeepDimens.padding),
          height: BeepDimens.textPrimary,
          width: double.infinity,
          color: BeepColors.white,
        ),
        const SizedBox(height: 6.0),
        Container(
          height: BeepDimens.textActionBar,
          width: 60,
          color: BeepColors.white,
        ),
        UIHelper.verticalM,
      ],
    );
  }

  Widget buttonsSection() {
    return Container(width: 60);
  }
}
