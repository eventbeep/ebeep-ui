import 'package:flutter/material.dart';

import '../shared/constants.dart';

class EBGradients {
  EBGradients._();
  static const List<Color> appBarGradient = <Color>[
    // Color(0xfffcc117),
    Color(0xfffcce00),
    Color(0xfffaae3d),
  ];

  static const List<Color> blueGradient = <Color>[
    Color(0xff6981ec),
    Color(0xff81aff0),
  ];

  static const List<Color> collegeEvents = <Color>[
    Color(0xFF333BEA),
    Color(0xFF7F9BF2),
  ];
  static const List<Color> technical = <Color>[
    Color(0xFF9F041B),
    Color(0xFFF5515F),
  ];
  static const List<Color> competitions = <Color>[
    Color(0xFF533880),
    Color(0xFFBD77AA),
  ];
  static const List<Color> quizzes = <Color>[
    Color(0xFF429321),
    Color(0xFFB4EC51),
  ];
  static const List<Color> adventure = <Color>[
    Color(0xFFA93BFE),
    Color(0xFFDA93FF),
  ];
  static const List<Color> biking = <Color>[
    Color(0xFFFFA900),
    Color(0xDDFFD325),
  ];
  static const List<Color> entertainment = <Color>[
    Color(0xFF4B4A7E),
    Color(0xFFC294D1),
  ];
  static const List<Color> food = <Color>[
    Color(0xFFD99000),
    Color(0xFFFFA900),
  ];
  static const List<Color> gaming = <Color>[
    Color(0xFF09203f),
    Color(0xFF537895),
  ];
  static const List<Color> sports = <Color>[
    Color(0xFFeb3349),
    Color(0xFFf45c43),
  ];
  static const List<Color> startups = <Color>[
    Color(0xFF141e30),
    Color(0xFF243b55),
  ];
  static const List<Color> others = <Color>[
    Color(0xFF000000),
    Color(0xFF434343),
  ];

  static List<Color> getGradient(String category) {
    switch (category) {
      case EBCategories.food:
        return EBGradients.food;
      case EBCategories.adventure:
        return EBGradients.adventure;
      case EBCategories.gaming:
        return EBGradients.gaming;
      case EBCategories.creative:
        return EBGradients.biking;
      case EBCategories.sports:
        return EBGradients.sports;
      case EBCategories.entertainment:
        return EBGradients.entertainment;
      case EBCategories.startups:
        return EBGradients.startups;
      case EBCategories.technical:
        return EBGradients.technical;
      default:
        return EBGradients.appBarGradient;
    }
  }

  static const RadialGradient symbeepLightGradient = RadialGradient(
    colors: [Color(0xFFF6AB3B), Color(0xFFF93F16)],
    stops: [0, 1],
  );
  static const RadialGradient symbeepDarkGradient = RadialGradient(
    colors: [Color(0xFFDF8E14), Color(0xFF952209)],
    stops: [0, 1],
  );
}
