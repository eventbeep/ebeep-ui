import 'package:eventbeep_ui/shared/colors.dart';
import 'package:eventbeep_ui/widgets.dart';
import 'package:flutter/material.dart';

class DescriptionText extends StatefulWidget {
  const DescriptionText({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  _DescriptionTextState createState() => _DescriptionTextState();
}

class _DescriptionTextState extends State<DescriptionText> {
  String firstHalf;
  String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 80) {
      firstHalf = widget.text.substring(0, 80);
      secondHalf = widget.text.substring(80, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return secondHalf.isEmpty
        ? BeepSecondaryText(text: firstHalf)
        : Column(
            children: <Widget>[
              BeepSecondaryText(
                  text: flag ? (firstHalf + '...') : (firstHalf + secondHalf)),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      flag ? 'show more' : 'show less',
                      style: const TextStyle(color: BeepColors.tertiary),
                    ),
                  ],
                ),
                onTap: () {
                  setState(() {
                    flag = !flag;
                  });
                },
              ),
            ],
          );
  }
}
