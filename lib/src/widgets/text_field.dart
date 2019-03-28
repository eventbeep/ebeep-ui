import 'package:flutter/material.dart';

class BeepTextField extends StatelessWidget {
  final TextCapitalization textCapitalization;
  final String labelText;
  final bool isPassword;
  final TextInputType textInputType;
  final Function onChanged;
  final String errorText;

  const BeepTextField({
    Key key,
    this.textCapitalization,
    @required this.labelText,
    this.onChanged,
    this.isPassword = false,
    this.textInputType = TextInputType.text,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      textCapitalization: textCapitalization,
      keyboardType: textInputType,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        errorText: errorText,
      ),
    );
  }
}