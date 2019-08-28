import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BeepBottomAppBarItem {
  BeepBottomAppBarItem({
    this.iconData,
    this.text,
    this.enableDot = false,
  });
  final IconData iconData;
  final String text;
  final bool enableDot;
}

class BeepBottomAppBar extends StatefulWidget {
  const BeepBottomAppBar({
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

  final List<BeepBottomAppBarItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => BeepBottomAppBarState();
}

class BeepBottomAppBarState extends State<BeepBottomAppBar> {
  int _selectedIndex = 0;
  void _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items =
        List<Widget>.generate(widget.items.length, (int index) {
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
            const SizedBox(height: 4),
            BeepCustomText(
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
    BeepBottomAppBarItem item,
    int index,
    ValueChanged<int> onPressed,
  }) {
    final Color color =
        _selectedIndex == index ? widget.selectedColor : widget.color;
    /*
        */
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
                      color: BeepColors.secondary,
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
                      const SizedBox(height: 4),
                      BeepCustomText(
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
