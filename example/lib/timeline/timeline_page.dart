import 'package:flutter/material.dart';
import 'package:eventbeep_ui/eventbeep_ui.dart';

class TimelinePage extends StatefulWidget {
  @override
  TimelinePageState createState() => TimelinePageState();
}

class TimelinePageState extends State<TimelinePage> {
  final PageController pageController = PageController(viewportFraction: 0.8);
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      int next = pageController.page.round();

      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: BeepDimens.padding),
          child: BeepLargeHeading(text: 'Your Tickets'),
        ),
        SizedBox(
          height: 515,
          child: PageView.builder(
            itemCount: 10,
            controller: pageController,
            itemBuilder: (context, int index) {
              bool active = index == currentPage;
              return _buildTicketPage(null, active);
            },
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(bottom: BeepDimens.cardMarginHorizontal),
          child: BeepIndicator(
            color: BeepColors.primary,
            controller: pageController,
            itemCount: 10,
            onPageSelected: (int page) {
              pageController.animateToPage(
                page,
                duration: Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            },
          ),
        ),
      ],
    );
  }

  _buildTicketPage(Map map, bool active) {
    final double blur = active ? 20 : 0;
    final double offset = active ? BeepDimens.padding : 0;
    final double top = active
        ? BeepDimens.padding
        : BeepDimens.padding + BeepDimens.cardMarginHorizontal;
//    final double bottom = active ? 140 : 140 - BeepDimens.cardMarginHorizontal;
    final double bottom = active ? BeepDimens.padding * 2 : 0;
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
      margin: EdgeInsets.only(
        top: top,
        bottom: bottom,
        right: BeepDimens.padding,
        left: BeepDimens.padding,
      ),
      decoration: BoxDecoration(
//          border: Border.all(color: BeepColors.darkShadow),
        boxShadow: [
          BoxShadow(
              color: (active) ? BeepColors.lightShadow : BeepColors.transparent,
              blurRadius: blur,
              offset: Offset(offset, offset)),
        ],
      ),
      child: BeepTicketCard(
        title: 'Regatta',
        ticketAmount: 200,
        qrData: 'https://meus.cogitare.space',
        location: 'Sector 45, Gurugram, Delhi, India',
        dateTime: 'March 23, Sunday',
        ticketType: 'Gold ticket',
      ),
    );
  }
}
