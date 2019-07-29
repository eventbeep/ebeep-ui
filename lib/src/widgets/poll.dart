import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:separated_column/separated_column.dart';

class BeepPoll extends StatefulWidget {
  const BeepPoll({
    Key key,
    @required this.map,
    @required this.onTapItems,
  }) : super(key: key);

  // final List<double> map;
  final List<Function> onTapItems;
  final LinkedHashMap<String, int> map;

  @override
  _BeepPollState createState() => _BeepPollState();
}

class _BeepPollState extends State<BeepPoll> {
  int selectedIndex;
  LinkedHashMap<String, int> map =
      LinkedHashMap<String, int>.from(<String, int>{});

  @override
  void initState() {
    map.addAll(widget.map);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int maxValue = map.values.reduce(max);
    final int sumValue = map.values.reduce((int a, int b) => a + b);
    return SeparatedColumn(
      children: List<Widget>.generate(map.keys.length, (int index) {
        final String label = map.keys.toList()[index];
        final int value = map[label];
        final Function onTap = widget.onTapItems[index];
        return eachPoll(
            value / sumValue, label, onTap, value == maxValue, index);
      }),
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: BeepDimens.cardMarginVertical);
      },
    );
  }

  Widget eachPoll(
      double value, String label, Function onTap, bool isMax, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(BeepDimens.cornerRadius),
      child: GestureDetector(
        onTap: (selectedIndex != null)
            ? null
            : () {
                setState(() {
                  map[label] = ++map[label];
                  selectedIndex = index;
                });
                onTap();
              },
        child: Stack(
          children: <Widget>[
            Container(
              height: 42,
              child: LinearProgressIndicator(
                value: (selectedIndex == null) ? 0 : value,
                valueColor: AlwaysStoppedAnimation<Color>(
                  isMax
                      ? BeepColors.tertiary.withAlpha(150)
                      : BeepColors.tertiary.withAlpha(80),
                ),
                backgroundColor: BeepColors.lightGrey,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: BeepDimens.cardMarginVertical),
              height: 42,
              child: Row(
                children: <Widget>[
                  (selectedIndex == null)
                      ? Container()
                      : BeepCustomText(
                          text: '${(value * 100).toInt()}%',
                          size: 17,
                          fontFamily: 'Simple',
                          color: BeepColors.quaternary,
                          maxLines: 1,
                        ),
                  const SizedBox(width: 8),
                  BeepCustomText(
                    text: '$label',
                    size: 16,
                    fontFamily: 'Simple',
                    color: BeepColors.quaternary,
                    weight: (selectedIndex == index)
                        ? FontWeight.bold
                        : FontWeight.normal,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
