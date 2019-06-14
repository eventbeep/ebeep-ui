import 'package:eventbeep_ui/src/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BeepTextField extends StatelessWidget {
  const BeepTextField({
    Key key,
    this.textCapitalization = TextCapitalization.none,
    @required this.labelText,
    this.onChanged,
    this.isPassword = false,
    this.textInputType = TextInputType.text,
    this.errorText,
    this.maxLength,
    this.controller,
    this.onTap,
    this.getKeyboard = true,
    this.icon,
  }) : super(key: key);

  final TextCapitalization textCapitalization;
  final String labelText;
  final bool isPassword;
  final TextInputType textInputType;
  final Function onChanged;
  final String errorText;
  final int maxLength;
  final TextEditingController controller;
  final Function onTap;
  final bool getKeyboard;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
//      enabled: false,
      focusNode: getKeyboard ? null : AlwaysDisabledFocusNode(),
      controller: controller,
      onChanged: onChanged,
      textCapitalization: textCapitalization,
      keyboardType: textInputType,
      obscureText: isPassword,
      maxLength: maxLength,
      style: TextStyle(fontFamily: 'Simple'),
      buildCounter: (BuildContext context,
              {int currentLength, int maxLength, bool isFocused}) =>
          null,
      decoration: InputDecoration(
        icon: icon,
        labelText: labelText,
        labelStyle: TextStyle(fontFamily: 'Simple'),
        border: OutlineInputBorder(),
        errorText: errorText,
      ),
    );
  }
}
