import 'dart:ui';

import 'package:flutter/material.dart';

import '../../shared.dart';
import '../../widgets.dart';

class EBAppBar extends StatelessWidget implements PreferredSizeWidget {
  EBAppBar({
    Key? key,
    this.title = '',
    this.leading,
    this.actions = const [],
    this.bottom,
    this.actionButton,
    this.isInSafeArea = true,
    this.hasShadow = true,
    this.isDark = false,
  })  : preferredSize = Size.fromHeight(
            56 + (isInSafeArea ? (bottom?.preferredSize.height ?? 0.0) : 0.0)),
        super(key: key);

  final String title;
  final Widget? leading;
  final List<Widget> actions;
  final bool isDark;
  final bool hasShadow;
  final bool isInSafeArea;
  final PreferredSizeWidget? bottom;
  final Widget? actionButton;

  @override
  Widget build(BuildContext context) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final canPop = parentRoute?.canPop ?? false;
    final useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      height: preferredSize.height + (isInSafeArea ? statusBarHeight : 0.0),
      decoration: BoxDecoration(
          color: isDark ? EBColors.grey100 : EBColors.grey10,
          boxShadow: hasShadow
              ? [
                  BoxShadow(
                    color: EBColors.grey100.withOpacity(0.04),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ]
              : null),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          isInSafeArea
              ? SafeArea(
                  child: _buildAppBarContent(canPop, useCloseButton, context),
                )
              : _buildAppBarContent(canPop, useCloseButton, context),
          if (bottom != null) bottom!,
        ],
      ),
    );
  }

  Row _buildAppBarContent(
      bool canPop, bool useCloseButton, BuildContext context) {
    return Row(
      children: <Widget>[
        if (leading == null && canPop) ...[
          EBSpacers.width4,
          SizedBox(
            height: 48,
            width: 48,
            child: useCloseButton
                ? IconButton(
                    icon: Icon(
                      EBIcons.close,
                      color: isDark ? EBColors.grey10 : EBColors.grey100,
                    ),
                    onPressed: () => Navigator.pop(context),
                  )
                : IconButton(
                    icon: Icon(
                      EBIcons.back,
                      color: isDark ? EBColors.grey10 : EBColors.grey100,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
          ),
          EBSpacers.width4,
        ],
        if (leading != null) ...[
          EBSpacers.width4,
          SizedBox(
            height: 48,
            width: 48,
            child: Center(child: leading),
          ),
          EBSpacers.width4,
        ],
        EBSpacers.width16,
        Expanded(
          child: Text(
            title,
            style: EBTextStyles.appBar
                .copyWith(color: isDark ? EBColors.white : EBColors.grey100),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        EBSpacers.width16,
        if (actions.isNotEmpty) ...[
          ...actions.map(
            (widget) => SizedBox(
              height: 48,
              width: 48,
              child: Center(child: widget),
            ),
          ),
          EBSpacers.width4,
        ],
        if (actionButton != null) ...[
          actionButton ?? const SizedBox(),
          EBSpacers.width16,
        ]
      ],
    );
  }

  @override
  final Size preferredSize;
}
