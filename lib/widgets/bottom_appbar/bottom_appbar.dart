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
    this.centerItemOnPressed,
    this.iconSize = 24,
    this.height = 56,
    this.color = EBColors.lightIcon,
    this.backgroundColor = EBColors.white,
    this.selectedColor = EBColors.primary,
    this.notchedShape,
    this.centerItem,
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
  final Function centerItemOnPressed;
  final Widget centerItem;

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
      elevation: 16,
      child: Row(children: tabItems),
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
            IconButton(
              icon: centerItem,
              onPressed: centerItemOnPressed,
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
                if (item.enableDot)
                  const Positioned(
                    right: 20,
                    top: 8,
                    child: Icon(
                      Icons.brightness_1,
                      color: EBColors.secondary,
                      size: 12,
                    ),
                  ),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(item.iconData, color: tabColor, size: iconSize),
                      UIHelper.verticalXS,
                      Text(
                        item.text,
                        style: EBTextStyles.caption.copyWith(
                          color: tabColor,
                          fontWeight: FontWeight.bold,
                        ),
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
