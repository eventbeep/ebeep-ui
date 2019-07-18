import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:eventbeep_ui/src/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BeepTextField extends StatelessWidget {
  const BeepTextField({
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
  }) : super(key: key);

  final TextCapitalization textCapitalization;
  final String labelText, hintText;
  final bool isPassword;
  final TextInputType textInputType;
  final Function onChanged;
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
      children: <Widget>[
        (labelText == null || labelText.isEmpty)
            ? Container()
            : Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 4.0),
                child: BeepCustomText(
                  text: labelText,
                  size: 15,
                  fontFamily: 'Heading',
                  weight: FontWeight.bold,
                  color: BeepColors.tertiary,
                ),
              ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: BeepDimens.padding),
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: BeepColors.tertiary.withAlpha(40),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: TextField(
                  onTap: onTap,
                  enabled: enabled,
                  focusNode: getKeyboard ? null : AlwaysDisabledFocusNode(),
                  controller: controller,
                  onChanged: onChanged,
                  textCapitalization: textCapitalization,
                  keyboardType: textInputType,
                  obscureText: isPassword,
                  maxLength: maxLength,
                  style: TextStyle(fontFamily: 'Simple'),
                  buildCounter: (
                    BuildContext context, {
                    int currentLength,
                    int maxLength,
                    bool isFocused,
                  }) =>
                      null,
                  decoration: InputDecoration(
                    hintText: hintText,
                    contentPadding: const EdgeInsets.only(top: 8.0),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Icon(
                icon,
                color: BeepColors.tertiary,
              ),
            ],
          ),
        ),
        (errorText == null || errorText.isEmpty)
            ? Container()
            : Padding(
                padding: const EdgeInsets.only(
                  left: BeepDimens.padding,
                  right: BeepDimens.padding,
                  top: 4.0,
                ),
                child: BeepCustomText(
                  text: errorText,
                  fontFamily: 'Simple',
                  size: 13,
                  color: BeepColors.secondary,
                ),
              ),
      ],
    );
  }
}
