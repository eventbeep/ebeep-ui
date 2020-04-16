import 'package:flutter/material.dart';

import '../../shared.dart';
import '../../widgets.dart';

class EBLimitedText extends StatefulWidget {
  const EBLimitedText({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  _EBLimitedTextState createState() => _EBLimitedTextState();
}

class _EBLimitedTextState extends State<EBLimitedText> {
  String firstHalf;
  bool flag = true;
  String secondHalf;

  @override
  Widget build(BuildContext context) {
    return secondHalf.isEmpty
        ? BeepSecondaryText(text: firstHalf)
        : Column(
            children: <Widget>[
              BeepSecondaryText(
                  text: flag ? ('$firstHalf...') : (firstHalf + secondHalf)),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      flag ? 'show more' : 'show less',
                      style: const TextStyle(color: EBColors.tertiary),
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
}
