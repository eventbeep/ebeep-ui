import 'package:cached_network_image/cached_network_image.dart';
import 'package:eventbeep_ui/shared.dart';
import 'package:eventbeep_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BeepLearnCard extends StatelessWidget {
  const BeepLearnCard({
    Key key,
    @required this.image,
    @required this.name,
    @required this.price,
    @required this.platform,
    @required this.onTap,
    this.height = 210,
    this.width = double.infinity,
  }) : super(key: key);

  final String image;
  final String name;
  final String price;
  final String platform;
  final double height;
  final double width;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(
          horizontal: BeepDimens.cardMarginHorizontal,
          vertical: BeepDimens.cardMarginVertical,
        ),
        alignment: Alignment.bottomLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BeepCustomText(
              text: name,
              color: BeepColors.white,
              weight: FontWeight.bold,
              size: BeepDimens.textButtonSize,
              fontFamily: 'Simple',
            ),
            UIHelper.verticalS,
            BeepCustomText(
              text: '$price | $platform',
              color: BeepColors.lightGrey,
              weight: FontWeight.bold,
              size: BeepDimens.textSecondary,
              fontFamily: 'Simple',
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: BeepColors.secondary,
          borderRadius: BorderRadius.circular(BeepDimens.cornerRadius),
          boxShadow: BeepDimens.darkShadow,
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.dstATop,
            ),
            image: CachedNetworkImageProvider(image),
          ),
        ),
      ),
    );
  }
}

class BeepLoadingLearn extends StatelessWidget {
  const BeepLoadingLearn({
    Key key,
    this.height = 210,
    this.width = double.infinity,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.grey[100],
      baseColor: Colors.grey[300],
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: BeepColors.secondary,
          borderRadius: BorderRadius.circular(BeepDimens.cornerRadius),
          boxShadow: BeepDimens.lightShadow,
        ),
      ),
    );
  }
}
