import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import '../../shared.dart';
import '../../shared/focus_node.dart';
import '../../widgets.dart';

class EBTextField extends StatelessWidget {
  const EBTextField({
    Key key,
    this.textCapitalization = TextCapitalization.none,
    this.labelText,
    this.hintText,
    this.onChanged,
    this.isPassword = false,
    this.textInputType = TextInputType.text,
    this.errorText,
    this.maxLength,
    this.controller,
    this.onTap,
    this.getKeyboard = true,
    this.icon,
    this.enabled = true,
    this.onSubmit,
  }) : super(key: key);

  final TextCapitalization textCapitalization;
  final String labelText, hintText;
  final bool isPassword;
  final TextInputType textInputType;
  final Function onChanged;
  final Function onSubmit;
  final String errorText;
  final int maxLength;
  final TextEditingController controller;
  final Function onTap;
  final bool getKeyboard;
  final IconData icon;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (labelText != null && labelText.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 12, bottom: 8),
            child: EBText(
              text: labelText,
              size: 15,
              fontFamily: 'Heading',
              weight: FontWeight.bold,
              color: EBColors.tertiary,
            ),
          ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: EBDimens.padding),
          // height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: EBColors.tertiary.withAlpha(40),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: TextField(
                  onSubmitted: onSubmit,
                  onTap: onTap,
                  enabled: enabled,
                  focusNode: getKeyboard ? null : AlwaysDisabledFocusNode(),
                  controller: controller,
                  onChanged: onChanged,
                  textCapitalization: textCapitalization,
                  keyboardType: textInputType,
                  obscureText: isPassword,
                  maxLength: maxLength,
                  maxLines: null,
                  style: const TextStyle(fontFamily: 'Simple'),
                  buildCounter: (
                    BuildContext context, {
                    int currentLength,
                    int maxLength,
                    bool isFocused,
                  }) =>
                      null,
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                    counterText: '',
                  ),
                ),
              ),
              Icon(
                icon,
                color: EBColors.tertiary,
              ),
            ],
          ),
        ),
        if (errorText != null && errorText.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(
              left: EBDimens.padding,
              right: EBDimens.padding,
              top: 4.0,
            ),
            child: EBText(
              text: errorText,
              fontFamily: 'Simple',
              size: 13,
              color: EBColors.secondary,
            ),
          ),
      ],
    );
  }
}
