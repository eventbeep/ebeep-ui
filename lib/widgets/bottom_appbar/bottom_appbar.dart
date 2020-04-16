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
  final IconData iconData;
  final String text;
  final bool enableDot;
}

class EBBottomAppBar extends StatefulWidget {
  const EBBottomAppBar({
    this.items,
    this.centerItemText,
    this.height = 60.0,
    this.iconSize = 24.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.onTabSelected,
  }) : assert(items.length == 2 || items.length == 4);

  final List<EBBottomAppBarItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => EBBottomAppBarState();
}

class EBBottomAppBarState extends State<EBBottomAppBar> {
  int _selectedIndex = 0;
  void _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = List<Widget>.generate(widget.items.length, (index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      shape: widget.notchedShape,
      notchMargin: 8,
      elevation: 16,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      color: widget.backgroundColor,
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize),
            UIHelper.verticalXS,
            EBText(
              text: widget.centerItemText ?? '',
              size: 14,
              color: widget.color,
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
    final color = _selectedIndex == index ? widget.selectedColor : widget.color;

    return Expanded(
      child: SizedBox(
        height: widget.height,
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
                      Icon(item.iconData, color: color, size: widget.iconSize),
                      UIHelper.verticalXS,
                      EBText(
                        text: item.text,
                        color: color,
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
