import 'package:eventbeep_ui/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

MenuController globalMenuController;

class ZoomScaffold extends StatefulWidget {
  const ZoomScaffold({
    this.contentScreen,
    this.menuScreen,
  });

  final Widget menuScreen;
  final Widget contentScreen;

  @override
  _ZoomScaffoldState createState() => _ZoomScaffoldState();
}

class _ZoomScaffoldState extends State<ZoomScaffold>
    with TickerProviderStateMixin {
  Curve scaleDownCurve = const Interval(0.0, 0.3, curve: Curves.easeOut);
  Curve scaleUpCurve = const Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideOutCurve = const Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideInCurve = const Interval(0.0, 1.0, curve: Curves.easeOut);

  @override
  void didChangeDependencies() {
    globalMenuController = MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    globalMenuController.dispose();
    super.dispose();
  }

  Widget createContentDisplay() {
    return zoomAndSlideContent(
      GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) {
          print('velocity : ${details.primaryVelocity}');
          if (details.primaryVelocity < 0 &&
              globalMenuController.state == MenuState.open) {
            globalMenuController.toggle();
          }
        },
        onHorizontalDragStart: (DragStartDetails details) {
          if (details.globalPosition.dx <= 30) {
            globalMenuController.toggle();
          }
          print('position start : ${details.globalPosition}');
        },
        child: widget.contentScreen,
      ),
    );
  }

  Widget zoomAndSlideContent(Widget content) {
    double slidePercent, scalePercent;
    switch (globalMenuController.state) {
      case MenuState.closed:
        slidePercent = 0.0;
        scalePercent = 0.0;
        break;
      case MenuState.open:
        slidePercent = 1.0;
        scalePercent = 1.0;
        break;
      case MenuState.opening:
        slidePercent =
            slideOutCurve.transform(globalMenuController.percentOpen);
        scalePercent =
            scaleDownCurve.transform(globalMenuController.percentOpen);
        break;
      case MenuState.closing:
        slidePercent = slideInCurve.transform(globalMenuController.percentOpen);
        scalePercent = scaleUpCurve.transform(globalMenuController.percentOpen);
        break;
    }

    final double slideAmount = 275.0 * slidePercent;
    final double contentScale = 1.0 - (0.2 * scalePercent);
    final double cornerRadius =
        BeepDimens.cornerRadius * globalMenuController.percentOpen;

    return Transform(
      transform: Matrix4.translationValues(slideAmount, 0.0, 0.0)
        ..scale(contentScale, contentScale),
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: const BoxDecoration(boxShadow: BeepDimens.darkShadow),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(cornerRadius), child: content),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (globalMenuController.state == MenuState.open) {
          globalMenuController.toggle();
          return false;
        } else {
          SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
        }
        return true;
      },
      child: Stack(
        children: <Widget>[
          Container(
            child: Scaffold(
              body: widget.menuScreen,
            ),
          ),
          createContentDisplay()
        ],
      ),
    );
  }
}

class ZoomScaffoldMenuController extends StatefulWidget {
  const ZoomScaffoldMenuController({
    this.builder,
  });

  final ZoomScaffoldBuilder builder;

  @override
  ZoomScaffoldMenuControllerState createState() {
    return ZoomScaffoldMenuControllerState();
  }
}

class ZoomScaffoldMenuControllerState
    extends State<ZoomScaffoldMenuController> {
  MenuController globalMenuController;

  @override
  void initState() {
    super.initState();

    globalMenuController = getMenuController(context);
    globalMenuController.addListener(_onMenuControllerChange);
  }

  @override
  void dispose() {
    globalMenuController.removeListener(_onMenuControllerChange);
    super.dispose();
  }

  MenuController getMenuController(BuildContext context) {
    return globalMenuController;
  }

  void _onMenuControllerChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, getMenuController(context));
  }
}

typedef ZoomScaffoldBuilder = Widget Function(
    BuildContext context, MenuController globalMenuController);

class Layout {
  Layout({
    this.contentBuilder,
  });

  final WidgetBuilder contentBuilder;
}

class MenuController extends ChangeNotifier {
  MenuController({
    this.vsync,
  }) : _animationController = AnimationController(vsync: vsync) {
    _animationController
      ..duration = const Duration(milliseconds: 250)
      ..addListener(() {
        notifyListeners();
      })
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.forward:
            state = MenuState.opening;
            break;
          case AnimationStatus.reverse:
            state = MenuState.closing;
            break;
          case AnimationStatus.completed:
            state = MenuState.open;
            break;
          case AnimationStatus.dismissed:
            state = MenuState.closed;
            break;
        }
        notifyListeners();
      });
  }

  final TickerProvider vsync;
  final AnimationController _animationController;
  MenuState state = MenuState.closed;

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  double get percentOpen {
    return _animationController.value;
  }

  void open() {
    _animationController.forward();
  }

  void close() {
    _animationController.reverse();
  }

  void toggle() {
    if (state == MenuState.open) {
      close();
    } else if (state == MenuState.closed) {
      open();
    }
  }
}

enum MenuState {
  closed,
  opening,
  open,
  closing,
}
