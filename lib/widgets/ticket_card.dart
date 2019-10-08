import 'package:eventbeep_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:eventbeep_ui/shared.dart';

class BeepTicketCard extends StatelessWidget {
  const BeepTicketCard({
    @required this.title,
    this.ticketsCount = 1,
    @required this.ticketAmount,
    @required this.qrData,
    this.qrSize = 150.0,
    @required this.location,
    @required this.dateTime,
    @required this.ticketType,
  });

  final String title, qrData, dateTime, location, ticketType;
  final int ticketsCount, ticketAmount;
  final double qrSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomPaint(
          painter: _TicketBackground(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: BeepDimens.ticketCornerRadius * 2,
                vertical: BeepDimens.ticketCornerRadius),
            child: Column(
              children: <Widget>[
                BeepCustomText(
                  text: title,
                  size: 22.0,
                  maxLines: 1,
                  color: BeepColors.primary,
                  align: TextAlign.center,
                  fontFamily: 'Heading',
                  weight: FontWeight.w600,
                ),
                UIHelper.verticalL,
                imageText(Icons.access_time, dateTime),
                UIHelper.verticalL,
                imageText(Icons.location_on, location),
                UIHelper.verticalL,
                imageText(Icons.movie, ticketType + ' (Rs.$ticketAmount each)'),
                UIHelper.verticalL,
                imageText(Icons.monetization_on,
                    'Total ($ticketAmount x $ticketsCount) is Rs.${ticketAmount * ticketsCount}'),
                UIHelper.verticalL,
              ],
            ),
          ),
        ),
        CustomPaint(
          painter: _TicketBackground(),
          child: Column(
            children: <Widget>[
              const SizedBox(
                  width: double.infinity, height: BeepDimens.padding),
              QrImage(
                size: qrSize,
                data: qrData,
                backgroundColor: BeepColors.white,
              ),
              UIHelper.verticalL,
              BeepSecondaryText(text: qrData),
              const SizedBox(
                  width: double.infinity, height: BeepDimens.padding),
            ],
          ),
        ),
      ],
    );
  }

  Widget imageText(IconData icon, String text) {
    return Row(
      children: <Widget>[
        Icon(icon, color: BeepColors.darkGrey),
        const SizedBox(
          width: BeepDimens.padding,
        ),
        Flexible(child: BeepSecondaryText(text: text, maxLines: 1)),
      ],
    );
  }
}

class _TicketBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = BeepColors.white;
//      ..color = BeepColors.primary
//      ..style = PaintingStyle.stroke
//      ..strokeWidth = 4.0;

//    size = Size(size.width, size.height / 2);

    final Path path = Path();
    const double pi = 22 / 7;
    num degToRad(num deg) => deg * (pi / 180.0);

    path.arcTo(
        const Rect.fromLTWH(
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

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
