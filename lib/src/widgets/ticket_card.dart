import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BeepTicketCard extends StatelessWidget {
  final String title, qrData, dateTime, location, ticketType;
  final int ticketsCount,ticketAmount;

  BeepTicketCard({
    @required this.title,
    this.ticketsCount = 1,
    @required this.ticketAmount,
    @required this.qrData,
    @required this.location,
    @required this.dateTime,
    @required this.ticketType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: new BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(BeepDimens.cornerRadius),
          boxShadow: BeepDimens.lightShadow),
      child: CustomPaint(
        painter: _TicketBackground(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: BeepDimens.padding,
              horizontal: BeepDimens.padding*2),
          child: Column(
            children: <Widget>[
              BeepCustomText(
                text: this.title,
                size: 26.0,
                color: BeepColors.primary,
                align: TextAlign.center,
                weight: FontWeight.w700,
              ),
              SizedBox(height: BeepDimens.padding),
              ImageText(Icons.access_time, this.dateTime),
              SizedBox(height: BeepDimens.padding),
              ImageText(Icons.location_on, this.location),
              SizedBox(height: BeepDimens.padding),
              ImageText(Icons.movie, this.ticketType+' (Rs.${this.ticketAmount} each)'),
              SizedBox(height: BeepDimens.padding),
              ImageText(Icons.monetization_on, 'Total (${this.ticketAmount} x ${this.ticketsCount}) is Rs.${this.ticketAmount*this.ticketsCount}'),
              SizedBox(height: BeepDimens.padding*3),
              QrImage(
                size: 200.0,
                data: this.qrData,
                backgroundColor: BeepColors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  ImageText(IconData icon, String text) {
    return Row(
      children: <Widget>[
        Icon(icon, color: BeepColors.lightGrey),
        SizedBox(
          width: BeepDimens.padding,
        ),
        BeepSecondaryText(text: text),
      ],
    );
  }
}

class _TicketBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = BeepColors.white;
//      ..color = BeepColors.primary
//      ..style = PaintingStyle.stroke
//      ..strokeWidth = 4.0;

    size = Size(size.width, size.height / 2);

    var path = Path();
    double pi = 22 / 7;
    num degToRad(num deg) => deg * (pi / 180.0);

    path.arcTo(
        Rect.fromLTWH(
          -BeepDimens.ticketCornerRadius,
          -BeepDimens.ticketCornerRadius,
          BeepDimens.ticketCornerRadius * 2,
          BeepDimens.ticketCornerRadius * 2,
        ),
        degToRad(0),
        degToRad(90),
        false);
    path.lineTo(0, size.height - BeepDimens.ticketCornerRadius);
    path.arcTo(
        Rect.fromLTWH(
          -BeepDimens.ticketCornerRadius,
          size.height - BeepDimens.ticketCornerRadius,
          BeepDimens.ticketCornerRadius * 2,
          BeepDimens.ticketCornerRadius * 2,
        ),
        degToRad(-90),
        degToRad(90),
        false);
    path.lineTo(size.width - BeepDimens.ticketCornerRadius, size.height);
    path.arcTo(
        Rect.fromLTWH(
          size.width - BeepDimens.ticketCornerRadius,
          size.height - BeepDimens.ticketCornerRadius,
          BeepDimens.ticketCornerRadius * 2,
          BeepDimens.ticketCornerRadius * 2,
        ),
        degToRad(180),
        degToRad(90),
        false);
    path.lineTo(size.width, BeepDimens.ticketCornerRadius);
    path.arcTo(
        Rect.fromLTWH(
          size.width - BeepDimens.ticketCornerRadius,
          -BeepDimens.ticketCornerRadius,
          BeepDimens.ticketCornerRadius * 2,
          BeepDimens.ticketCornerRadius * 2,
        ),
        degToRad(90),
        degToRad(90),
        false);
    path.lineTo(BeepDimens.ticketCornerRadius, 0.0);

    path.arcTo(
        Rect.fromLTWH(
          -BeepDimens.ticketCornerRadius,
          -BeepDimens.ticketCornerRadius + size.height,
          BeepDimens.ticketCornerRadius * 2,
          BeepDimens.ticketCornerRadius * 2,
        ),
        degToRad(0),
        degToRad(90),
        false);
    path.lineTo(0, size.height * 2 - BeepDimens.ticketCornerRadius);
    path.arcTo(
        Rect.fromLTWH(
          -BeepDimens.ticketCornerRadius,
          size.height * 2 - BeepDimens.ticketCornerRadius,
          BeepDimens.ticketCornerRadius * 2,
          BeepDimens.ticketCornerRadius * 2,
        ),
        degToRad(-90),
        degToRad(90),
        false);
    path.lineTo(size.width - BeepDimens.ticketCornerRadius, size.height * 2);
    path.arcTo(
        Rect.fromLTWH(
          size.width - BeepDimens.ticketCornerRadius,
          size.height * 2 - BeepDimens.ticketCornerRadius,
          BeepDimens.ticketCornerRadius * 2,
          BeepDimens.ticketCornerRadius * 2,
        ),
        degToRad(180),
        degToRad(90),
        false);
    path.lineTo(size.width, BeepDimens.ticketCornerRadius + size.height);
    path.arcTo(
        Rect.fromLTWH(
          size.width - BeepDimens.ticketCornerRadius,
          -BeepDimens.ticketCornerRadius + size.height,
          BeepDimens.ticketCornerRadius * 2,
          BeepDimens.ticketCornerRadius * 2,
        ),
        degToRad(90),
        degToRad(90),
        false);
    path.lineTo(BeepDimens.ticketCornerRadius, 0.0);

    Paint strokePaint = Paint()
//       ..color = BeepColors.white;
      ..color = BeepColors.cardBackground
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    canvas.drawPath(path, paint);
    canvas.drawLine(
        Offset(BeepDimens.ticketCornerRadius, size.height),
        Offset(size.width - BeepDimens.ticketCornerRadius, size.height),
        strokePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
