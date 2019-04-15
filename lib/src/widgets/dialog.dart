import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BeepDialog extends StatelessWidget {
  const BeepDialog({
    @required this.title,
    @required this.description,
    @required this.buttonText,
    this.image,
  });

  final String title, description, buttonText;
  final Image image;

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

  Widget dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            top: BeepDimens.avatarRadius + BeepDimens.cardMarginVertical,
            bottom: BeepDimens.padding,
            left: BeepDimens.padding,
            right: BeepDimens.padding,
          ),
          margin: const EdgeInsets.only(top: BeepDimens.avatarRadius),
          decoration: BoxDecoration(
              color: BeepColors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(BeepDimens.cornerRadius),
              boxShadow: BeepDimens.lightShadow),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              BeepLargeHeading(
                text: title,
                align: TextAlign.center,
              ),
              const SizedBox(height: BeepDimens.cardMarginVertical),
              BeepSecondaryText(
                text: description,
                align: TextAlign.center,
              ),
              const SizedBox(height: BeepDimens.padding),
              BeepRaisedButton(
                title: buttonText,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
        const Positioned(
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
