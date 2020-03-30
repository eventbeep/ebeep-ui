import 'package:flutter/material.dart';

import 'colors.dart';

class EBShadows {
  static const List<BoxShadow> lightShadow = <BoxShadow>[
    BoxShadow(
      color: EBColors.lightShadow,
      blurRadius: 8.0,
      offset: Offset(0.0, 8.0),
    ),
  ];

  static const List<BoxShadow> darkShadow = <BoxShadow>[
    BoxShadow(
      color: EBColors.darkShadow,
      blurRadius: 8.0,
      offset: Offset(0.0, 8.0),
    ),
  ];
}
