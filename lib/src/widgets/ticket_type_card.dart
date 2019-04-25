import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class BeepTicketTypeCard extends StatefulWidget {
  const BeepTicketTypeCard({
    @required this.title,
    @required this.description,
    @required this.amount,
    this.isSoldOut = false,
    this.onPlus,
    this.onMinus,
  });

  final String title, description;
  final bool isSoldOut;
  final int amount;
  final Function onPlus, onMinus;

  @override
  BeepTicketTypeCardState createState() => BeepTicketTypeCardState();
}

class BeepTicketTypeCardState extends State<BeepTicketTypeCard> {
  int count;
  @override
  void initState() {
    count = 0;
    super.initState();
  }

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
          buttonsSection(),
        ],
      ),
    );
  }

  Widget countSection() {
    return Container(
      height: 60,
      width: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: BeepColors.cardBackground),
      child: BeepCustomText(
        text: count.toString(),
        size: 36,
        color: BeepColors.textSecondary,
        weight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
    );
  }

  Widget ticketDetailSection() {
    return Column(
      children: <Widget>[
        BeepPrimaryText(text: widget.title, align: TextAlign.center),
        const SizedBox(height: 4.0),
        BeepSecondaryText(text: widget.description, align: TextAlign.center),
        const SizedBox(height: 4.0),
        BeepSmallHeading(text: 'x \$' + widget.amount.toString()),
      ],
    );
  }

  Widget buttonsSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          icon: const BeepCustomText(
            text: '+',
            size: 24.0,
            color: BeepColors.primary,
            fontFamily: 'Poppins',
          ),
          onPressed: () {
            if (count >= 10) {
              return;
            }
            setState(() {
              count++;
            });
          },
        ),
        IconButton(
          icon: const BeepCustomText(
            text: '-',
            size: 24.0,
            color: BeepColors.primary,
            fontFamily: 'Poppins',
          ),
          onPressed: () {
            if (count <= 0) {
              return;
            }
            setState(() {
              count--;
            });
          },
        ),
      ],
    );
  }

  void plus() {}
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
      alignment: Alignment.center,
      child: const BeepCustomText(
        text: '0',
        size: 36,
        color: BeepColors.textSecondary,
        weight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
    );
  }

  Widget ticketDetailSection() {
    return Column(
      children: <Widget>[
        const SizedBox(height: 12.0),
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
        const SizedBox(height: 12.0),
      ],
    );
  }

  Widget buttonsSection() {
    return Container(width: 60);
  }
}
