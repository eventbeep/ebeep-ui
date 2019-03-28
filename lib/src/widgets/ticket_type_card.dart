import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BeepTicketTypeCard extends StatefulWidget {
  final String title, description;
  final bool isSoldOut;
  final int count, amount;
  final Function onPlus, onMinus;

  BeepTicketTypeCard({
    @required this.title,
    @required this.description,
    @required this.amount,
    this.isSoldOut = false,
    this.count = 0,
    this.onPlus,
    this.onMinus,
  });

  @override
  BeepTicketTypeCardState createState() => BeepTicketTypeCardState();
}

class BeepTicketTypeCardState extends State<BeepTicketTypeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          color: BeepColors.white,
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(BeepDimens.cornerRadius),
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

  countSection() {
    return Container(
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(color: BeepColors.cardBackground),
      child: Center(
        child: BeepCustomText(
          text: widget.count.toString(),
          size: 36.0,
          color: BeepColors.textSecondary,
          weight: FontWeight.w900,
        ),
//        child: Text(
//          widget.count.toString(),
//          style: TextStyle(
//            fontSize: 36,
//            color: BeepColors.textSecondary,
//            fontWeight: FontWeight.w900,
//          ),
//        ),
      ),
    );
  }

  ticketDetailSection() {
    return Column(
      children: <Widget>[
        BeepPrimaryText(text: widget.title, align: TextAlign.center),
        BeepSecondaryText(text: widget.description, align: TextAlign.center),
        BeepSmallHeading(text: 'x \$' + widget.amount.toString()),
      ],
    );
  }

  buttonsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
//    mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Material(
          child: InkWell(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: BeepCustomText(
                text: '+',
                size: 26.0,
                color: BeepColors.primary,
                weight: FontWeight.w500,
              ),
            ),
            onTap: () {},
          ),
        ),
        Material(
          child: InkWell(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 17.0, vertical: 8.0),
              child: BeepCustomText(
                text: '-',
                size: 26.0,
                color: BeepColors.primary,
                weight: FontWeight.w500,
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

  plus() {}
}
