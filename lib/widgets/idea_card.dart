import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../shared.dart';
import '../widgets.dart';

class BeepIdeaCard extends StatelessWidget {
  const BeepIdeaCard({
    Key key,
    @required this.name,
    @required this.onTap,
    @required this.backgroundColor,
    @required this.image,
    @required this.authorImage,
    @required this.authorName,
    @required this.collegeName,
    @required this.tags,
  }) : super(key: key);

  final String image;
  final String authorImage;
  final String authorName;
  final String collegeName;
  final String name;
  final List<String> tags;
  final Function onTap;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(BeepDimens.cornerRadius),
          boxShadow: BeepDimens.lightShadow,
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Image.asset(
                      image,
                      width: 100,
                    ),
                    UIHelper.verticalS,
                    const BeepCustomText(
                      text: 'Startup Idea',
                      size: 14,
                      color: BeepColors.white,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
                UIHelper.horizontalL,
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage:
                                CachedNetworkImageProvider(authorImage),
                          ),
                          UIHelper.horizontalM,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                BeepCustomText(
                                  text: authorName,
                                  maxLines: 1,
                                  size: 16,
                                  fontFamily: 'Simple',
                                  weight: FontWeight.bold,
                                  color: BeepColors.white,
                                ),
                                UIHelper.verticalXS,
                                BeepCustomText(
                                  text: collegeName,
                                  size: 14,
                                  fontFamily: 'Simple',
                                  color: BeepColors.white,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      UIHelper.verticalM,
                      BeepCustomText(
                        text: name,
                        size: 24,
                        color: BeepColors.white,
                        weight: FontWeight.bold,
                        align: TextAlign.center,
                        lineSpace: 1.3,
                      ),
                      UIHelper.verticalM,
                    ],
                  ),
                ),
              ],
            ),
            Wrap(
              spacing: 8,
              alignment: WrapAlignment.center,
              children: List<Widget>.generate(tags.length, (int index) {
                print(tags[index]);
                return Chip(
                  label: Text(
                    tags[index],
                    style: const TextStyle(color: BeepColors.white),
                  ),
                  backgroundColor: backgroundColor.withOpacity(0.8),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
