import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BeepTicketTypeCard extends StatefulWidget {
  const BeepTicketTypeCard({
    @required this.title,
    @required this.description,
    @required this.amount,
    this.isSoldOut = false,
    this.count = 0,
    this.onPlus,
    this.onMinus,
  });

  final String title, description;
  final bool isSoldOut;
  final int count, amount;
  final Function onPlus, onMinus;

  @override
  BeepTicketTypeCardState createState() => BeepTicketTypeCardState();
}

class BeepTicketTypeCardState extends State<BeepTicketTypeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: BeepColors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(BeepDimens.cornerRadius),
          boxShadow: BeepDimens.lightShadow),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(BeepDimens.cornerRadius),
        child: Row(
//        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            countSection(),
            Expanded(child: ticketDetailSection()),
//          Divider(color: BeepColors.lightGrey),
            buttonsSection(),
          ],
        ),
      ),
    );
  }

  Widget countSection() {
    return Container(
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(color: BeepColors.cardBackground),
      child: Center(
        child: BeepCustomText(
          text: widget.count.toString(),
          size: 36.0,
          color: BeepColors.textSecondary,
          weight: FontWeight.w700,
          fontFamily: 'Quicksand',
        ),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
//    mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Material(
          child: InkWell(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: BeepCustomText(
                text: '+',
                size: 26.0,
                color: BeepColors.primary,
                weight: FontWeight.w500,
                fontFamily: 'Quicksand',
              ),
            ),
            onTap: () {},
          ),
        ),
        Material(
          child: InkWell(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: BeepCustomText(
                text: '-',
                size: 26.0,
                color: BeepColors.primary,
                weight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
            onTap: () {},
          ),
        ),
//        IconButton(
//          icon: Icon(Icons.keyboard_arrow_up, color: BeepColors.primary),
//          onPressed: () {},
//        ),
//        IconButton(
//          icon: Icon(Icons.keyboard_arrow_down, color: BeepColors.primary),
//          onPressed: () {},
//        ),
      ],
    );
  }

  void plus() {}
}
