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
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            top: BeepDimens.avatarRadius + BeepDimens.cardMarginVertical,
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
                text: title,
                align: TextAlign.center,
              ),
              SizedBox(height: BeepDimens.cardMarginVertical),
              BeepSecondaryText(
                text: description,
                align: TextAlign.center,
              ),
              SizedBox(height: BeepDimens.padding),
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
