import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import '../../shared.dart';
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
    this.maxLines,
    this.controller,
    this.onTap,
    this.prefix,
    this.suffix,
    this.autofocus = false,
    this.enabled = true,
    this.readOnly = false,
    this.onSubmit,
  }) : super(key: key);

  final TextEditingController controller;
  final bool enabled;
  final bool autofocus;
  final bool readOnly;
  final bool isPassword;
  final String errorText;
  final String labelText;
  final String hintText;
  final int maxLength;
  final int maxLines;
  final Function onChanged;
  final Function onSubmit;
  final Function onTap;
  final Widget suffix;
  final Widget prefix;
  final TextCapitalization textCapitalization;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (labelText != null && labelText.isNotEmpty) ...[
          Text(labelText, style: EBTextStyles.label),
          EBSpacers.height8,
        ],
        TextField(
          readOnly: readOnly,
          onSubmitted: onSubmit,
          autofocus: autofocus,
          onTap: onTap,
          enabled: enabled,
          controller: controller,
          onChanged: onChanged,
          textCapitalization: textCapitalization,
          keyboardType: textInputType,
          obscureText: isPassword,
          maxLength: maxLength,
          maxLines: maxLines,
          buildCounter: (context, {currentLength, maxLength, isFocused}) =>
              null,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: EBColors.primary),
              borderRadius: BorderRadius.circular(EBDimens.borderRadius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: EBColors.primary),
              borderRadius: BorderRadius.circular(EBDimens.borderRadius),
            ),
            hintStyle: EBTextStyles.bodyText1.copyWith(color: EBColors.grey50),
            hintText: hintText,
            counterText: '',
            errorText: errorText,
            suffixIcon: suffix,
            prefixIcon: prefix,
          ),
        ),
      ],
    );
  }
}
