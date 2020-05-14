import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared.dart';
import '../../widgets.dart';

class EBBottomAppBarItem {
  EBBottomAppBarItem({
    this.iconData,
    this.text,
    this.enableDot = false,
  });

  final bool enableDot;
  final IconData iconData;
  final String text;
}

class EBBottomAppBar extends StatelessWidget {
  const EBBottomAppBar({
    @required this.items,
    @required this.onTabSelected,
    @required this.selectedItemIndex,
    this.centerItemText,
    this.iconSize = 24.0,
    this.height = 56.0,
    this.color = EBColors.lightIcon,
    this.backgroundColor = EBColors.white,
    this.selectedColor = EBColors.primary,
    this.notchedShape,
  }) : assert(items.length > 1);

  final Color backgroundColor;
  final String centerItemText;
  final Color color;
  final double height;
  final double iconSize;
  final List<EBBottomAppBarItem> items;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;
  final Color selectedColor;
  final int selectedItemIndex;

  @override
  Widget build(BuildContext context) {
    final tabItems = List<Widget>.generate(items.length, (index) {
      return _buildTabItem(
        item: items[index],
        index: index,
        onPressed: onTabSelected,
      );
    });
    if (centerItemText != null) {
      tabItems.insert(tabItems.length >> 1, _buildMiddleTabItem());
    }
    return BottomAppBar(
      shape: notchedShape,
      notchMargin: 8,
      elevation: 16,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: tabItems,
      ),
      color: backgroundColor,
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: iconSize),
            UIHelper.verticalXS,
            EBText(
              text: centerItemText ?? '',
              size: 14,
              color: color,
              fontFamily: 'Simple',
              weight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    EBBottomAppBarItem item,
    int index,
    ValueChanged<int> onPressed,
  }) {
    final tabColor = selectedItemIndex == index ? selectedColor : color;

    return Expanded(
      child: SizedBox(
        height: height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Stack(
              children: <Widget>[
                Visibility(
                  visible: item.enableDot,
                  child: const Positioned(
                    right: 20,
                    top: 8,
                    child: Icon(
                      Icons.brightness_1,
                      color: EBColors.secondary,
                      size: 12,
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(item.iconData, color: tabColor, size: iconSize),
                      UIHelper.verticalXS,
                      EBText(
                        text: item.text,
                        color: tabColor,
                        size: 14,
                        fontFamily: 'Simple',
                        weight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
