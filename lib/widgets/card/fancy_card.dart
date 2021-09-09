import 'package:flutter/material.dart';

import '../../colors/colors.dart';
import '../../shared/spacers.dart';
import '../../widgets.dart';
import '../clipper/wave_clipper.dart';

class FancyCard extends StatelessWidget {
  const FancyCard({
    Key? key,
    required this.title,
    required this.trailing,
    this.subtitle,
    this.automaticallyImplyLeading = true,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final Widget trailing;
  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final canPop = parentRoute?.canPop ?? false;
    return BottomWaveContainer(
      shadowColor: EBColors.grey30,
      child: Container(
        padding: EdgeInsets.only(
          bottom: 44,
          left: 16,
          right: 16,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      if (automaticallyImplyLeading && canPop)
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Icon(Icons.arrow_back),
                          ),
                          onTap: () => Navigator.pop(context),
                        ),
                      Text(title, style: EBTextStyles.headline5),
                    ],
                  ),
                  if (subtitle != null && subtitle!.isNotEmpty) ...[
                    EBSpacers.height12,
                    Text(subtitle!, style: EBTextStyles.bodyText2),
                  ]
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: trailing,
            ),
          ],
        ),
        decoration: BoxDecoration(color: EBColors.grey10),
      ),
    );
  }
}
