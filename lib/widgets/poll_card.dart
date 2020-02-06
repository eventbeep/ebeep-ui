import 'dart:collection';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:eventbeep_ui/shared.dart';
import 'package:eventbeep_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:separated_column/separated_column.dart';
import 'package:shimmer/shimmer.dart';

class BeepPollCard extends StatefulWidget {
  const BeepPollCard({
    Key key,
    @required this.authorName,
    @required this.authorImage,
    @required this.question,
    @required this.postedTime,
    @required this.polls,
    @required this.feedPoll,
    @required this.feedPollTaps,
    this.selectedChoice,
    this.reportAction,
    this.deleteAction,
    this.clubAction,
    this.isOwner = false,
    this.collegeName,
  }) : super(key: key);

  final String authorName,
      authorImage,
      question,
      postedTime,
      selectedChoice,
      collegeName;
  final bool isOwner;
  final int polls;
  final Function reportAction, deleteAction, clubAction;
  final List<Function> feedPollTaps;
  final LinkedHashMap<String, int> feedPoll;

  @override
  _BeepPollCardState createState() => _BeepPollCardState();
}

class _BeepPollCardState extends State<BeepPollCard>
    with AutomaticKeepAliveClientMixin {
  int pollCount;
  List<String> choices = <String>['Delete', 'Report'];
  String selectedChoice;
  LinkedHashMap<String, int> feedPolls =
      LinkedHashMap<String, int>.from(<String, int>{});

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    selectedChoice = widget.selectedChoice;
    feedPolls.addAll(widget.feedPoll);
    selectedChoice = widget.selectedChoice;
    pollCount = widget.polls;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      decoration: const BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(BeepDimens.cornerRadius)),
          color: BeepColors.white,
          boxShadow: BeepDimens.lightShadow),
      child: Column(
        children: <Widget>[
          UIHelper.verticalL,
          pollHeader(),
          UIHelper.verticalL,
          pollQuestion(),
          UIHelper.verticalM,
          pollWidget(),
          UIHelper.verticalL,
          pollFooter(),
          UIHelper.verticalL,
        ],
      ),
    );
  }

  Widget pollHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: BeepDimens.cardMarginHorizontal),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: widget.clubAction,
            child: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(widget.authorImage),
            ),
          ),
          UIHelper.horizontalL,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BeepCustomText(
                  text: widget.authorName,
                  maxLines: 1,
                  size: 16,
                  fontFamily: 'Simple',
                  color: BeepColors.textPrimary,
                ),
                UIHelper.verticalXS,
                BeepCustomText(
                  text: widget.collegeName,
                  size: 14,
                  fontFamily: 'Simple',
                  color: BeepColors.textSecondary,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          UIHelper.horizontalXL,
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: BeepColors.lightIcon),
            tooltip: 'Options',
            onSelected: (String selected) {
              switch (selected) {
                case 'Report':
                  print(selected);
                  widget.reportAction();
                  break;
                case 'Delete':
                  print(selected);
                  widget.deleteAction();
                  break;
                default:
              }
            },
            itemBuilder: (BuildContext context) {
              if (!widget.isOwner) {
                choices.remove('Delete');
              }
              return choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
    );
  }

  Widget pollWidget() {
    final int maxValue = feedPolls.values.reduce(max);
    final int sumValue = feedPolls.values.reduce((int a, int b) => a + b);
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: BeepDimens.cardMarginHorizontal),
      child: SeparatedColumn(
        children: List<Widget>.generate(feedPolls.keys.length, (int index) {
          final String label = feedPolls.keys.toList()[index];
          final int value = feedPolls[label];
          final Function onTap = widget.feedPollTaps[index];
          return eachPoll(
              value / sumValue, label, onTap, value == maxValue, index);
        }),
        separatorBuilder: (BuildContext context, int index) {
          return UIHelper.verticalM;
        },
      ),
    );
  }

  Widget eachPoll(
      double value, String label, Function onTap, bool isMax, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(BeepDimens.cornerRadius),
      child: GestureDetector(
        onTap: (selectedChoice != null)
            ? null
            : () {
                setState(() {
                  feedPolls[label] = ++feedPolls[label];
                  selectedChoice = label;
                  pollCount++;
                });
                onTap();
              },
        child: Stack(
          children: <Widget>[
            Container(
              height: 42,
              child: LinearProgressIndicator(
                value: (selectedChoice == null) ? 0 : value,
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
                  (selectedChoice == null)
                      ? Container()
                      : BeepCustomText(
                          text: '${(value * 100).round()}%',
                          size: 17,
                          fontFamily: 'Simple',
                          color: BeepColors.quaternary,
                          maxLines: 1,
                        ),
                  UIHelper.horizontalS,
                  Expanded(
                    child: BeepCustomText(
                      text: '$label',
                      size: 16,
                      fontFamily: 'Simple',
                      color: BeepColors.quaternary,
                      weight: (widget.feedPoll.keys
                                  .toList()
                                  .indexOf(selectedChoice) ==
                              index)
                          ? FontWeight.bold
                          : FontWeight.normal,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget pollQuestion() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          horizontal: BeepDimens.cardMarginHorizontal),
      child: BeepCustomText(
        text: widget.question,
        fontFamily: 'Title',
        size: 24,
        color: BeepColors.quaternary,
      ),
    );
  }

  Widget pollFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: BeepDimens.cardMarginHorizontal),
      child: Row(
        children: <Widget>[
          BeepSecondaryText(text: widget.postedTime),
          const Spacer(),
          const Icon(
            Icons.check_circle,
            color: BeepColors.lightIcon,
            size: 20,
          ),
          UIHelper.horizontalXS,
          BeepSecondaryText(text: '$pollCount votes'),
        ],
      ),
    );
  }
}

class BeepLoadingPoll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(BeepDimens.cornerRadius)),
          color: BeepColors.white,
          boxShadow: BeepDimens.lightShadow),
      child: Shimmer.fromColors(
        highlightColor: Colors.grey[100],
        baseColor: Colors.grey[300],
        child: Column(
          children: <Widget>[
            UIHelper.verticalL,
            pollHeader(),
            UIHelper.verticalL,
            pollQuestion(),
            UIHelper.verticalL,
            pollContent(),
            UIHelper.verticalM,
            pollFooter(),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }

  Widget pollHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: BeepDimens.cardMarginHorizontal),
      child: Row(
        children: <Widget>[
          const CircleAvatar(
            radius: 24,
          ),
          UIHelper.horizontalL,
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: BeepDimens.textSmallHeading,
                  width: 220,
                  color: BeepColors.white,
                ),
                const SizedBox(height: 6.0),
                Container(
                  height: BeepDimens.textPrimary,
                  width: 100,
                  color: BeepColors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget pollQuestion() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: BeepDimens.cardMarginHorizontal),
      child: Container(
        width: 100,
        height: BeepDimens.textActionBar,
        color: BeepColors.cardBackground,
      ),
    );
  }

  Widget pollContent() {
    return Container(
      height: 180,
      color: BeepColors.white,
    );
  }

  Widget pollFooter() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: BeepDimens.cardMarginHorizontal,
          vertical: BeepDimens.cardMarginVertical),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const Icon(Icons.check_circle),
          UIHelper.horizontalS,
          Container(
            height: BeepDimens.textSmallHeading,
            width: 30,
            color: BeepColors.white,
          ),
        ],
      ),
    );
  }
}
