import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BeepDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Image image;

  BeepDialog({
    @required this.title,
    @required this.description,
    @required this.buttonText,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: BeepColors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BeepDimens.cornerRadius)),
      elevation: 0.0,
//      child: dialogContent(context),
      child: dialogCont(context),
    );
  }

  dialogContent(context) {
    return Container(
      padding: const EdgeInsets.all(BeepDimens.padding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: BeepColors.tertiary,
            radius: BeepDimens.avatarRadius,
          ),
          SizedBox(height: 16.0),
          BeepLargeHeading(
            text: "Welcome",
            align: TextAlign.center,
          ),
          SizedBox(height: 16.0),
          BeepPrimaryText(
            text:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            align: TextAlign.center,
          ),
          SizedBox(height: 16.0),
          BeepRaisedButton(
            title: buttonText,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  dialogCont(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: BeepDimens.avatarRadius + BeepDimens.padding,
            bottom: BeepDimens.padding,
            left: BeepDimens.padding,
            right: BeepDimens.padding,
          ),
          margin: EdgeInsets.only(top: BeepDimens.avatarRadius),
          decoration: new BoxDecoration(
              color: BeepColors.white,
              shape: BoxShape.rectangle,
              borderRadius: new BorderRadius.circular(BeepDimens.cornerRadius),
              boxShadow: BeepDimens.lightShadow),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              BeepLargeHeading(
                text: "Welcome",
                align: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              BeepPrimaryText(
                text:
                    "Lorem ipsum dolor sit is a really noce way to have dummy data and I prefer this method. Thanks for opening my dialog!",
                align: TextAlign.center,
              ),
              SizedBox(height: 24.0),
              BeepRaisedButton(
                title: buttonText,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
        Positioned(
          left: BeepDimens.padding,
          right: BeepDimens.padding,
          child: CircleAvatar(
            backgroundColor: BeepColors.primary,
            radius: BeepDimens.avatarRadius,
          ),
        ),
      ],
    );
  }
}
