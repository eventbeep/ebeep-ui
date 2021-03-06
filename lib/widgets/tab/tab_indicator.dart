import 'package:flutter/material.dart';

import '../../shared.dart';

/// Used with [TabBar.indicator] to draw a bubble on the
/// selected tab.
///
/// The [indicatorHeight] defines the bubble height.
/// The [indicatorColor] defines the bubble color.
/// The [indicatorRadius] defines the bubble corner radius.
/// The [tabBarIndicatorSize] specifies the type of TabBarIndicatorSize i.e label or tab.
/// /// The selected tab bubble is inset from the tab's boundary by [insets] when [tabBarIndicatorSize] is tab.
/// The selected tab bubble is applied padding by [padding] when [tabBarIndicatorSize] is label.

class EBTabIndicator extends Decoration {
  const EBTabIndicator({
    this.indicatorHeight = 40,
    this.indicatorRadius = 6,
    this.tabBarIndicatorSize = TabBarIndicatorSize.tab,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    this.insets = const EdgeInsets.symmetric(horizontal: 2),
  });

  final double indicatorHeight;
  final double indicatorRadius;
  final EdgeInsetsGeometry insets;
  final TabBarIndicatorSize tabBarIndicatorSize;

  @override
  final EdgeInsetsGeometry padding;

  @override
  _BubblePainter createBoxPainter([VoidCallback? onChanged]) {
    return _BubblePainter(this, onChanged);
  }

  @override
  Decoration? lerpFrom(Decoration? a, double t) {
    if (a is EBTabIndicator) {
      return EBTabIndicator(
        padding: EdgeInsetsGeometry.lerp(a.padding, padding, t)!,
        insets: EdgeInsetsGeometry.lerp(a.insets, insets, t)!,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  Decoration? lerpTo(Decoration? b, double t) {
    if (b is EBTabIndicator) {
      return EBTabIndicator(
        padding: EdgeInsetsGeometry.lerp(padding, b.padding, t)!,
        insets: EdgeInsetsGeometry.lerp(insets, b.insets, t)!,
      );
    }
    return super.lerpTo(b, t);
  }
}

class _BubblePainter extends BoxPainter {
  _BubblePainter(this.decoration, VoidCallback? onChanged) : super(onChanged);

  final EBTabIndicator decoration;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    final rect = Offset(
            offset.dx, (configuration.size!.height / 2) - indicatorHeight / 2) &
        Size(configuration.size!.width, indicatorHeight);
    final textDirection = configuration.textDirection!;
    final indicator = _indicatorRectFor(rect, textDirection);
    final paint = Paint();
    paint.style = PaintingStyle.fill;
    // paint.shader = gradient.createShader(rect);
    paint.color = EBColors.grey10;
    canvas.drawRRect(
        RRect.fromRectAndRadius(indicator, Radius.circular(indicatorRadius)),
        paint);
  }

  double get indicatorHeight => decoration.indicatorHeight;

  double get indicatorRadius => decoration.indicatorRadius;

  EdgeInsetsGeometry get padding => decoration.padding;

  EdgeInsetsGeometry get insets => decoration.insets;

  TabBarIndicatorSize get tabBarIndicatorSize => decoration.tabBarIndicatorSize;

  Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    var indicator = padding.resolve(textDirection).inflateRect(rect);

    if (tabBarIndicatorSize == TabBarIndicatorSize.tab) {
      indicator = insets.resolve(textDirection).deflateRect(rect);
    }

    return Rect.fromLTWH(
      indicator.left,
      indicator.top,
      indicator.width,
      indicator.height,
    );
  }
}
