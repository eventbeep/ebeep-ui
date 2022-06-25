import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../shared.dart';
import '../../widgets.dart';

class EBTextField extends StatelessWidget {
  const EBTextField({
    Key? key,
    this.textCapitalization = TextCapitalization.none,
    this.labelText,
    this.hintText,
    this.onChanged,
    this.isPassword = false,
    this.textInputType = TextInputType.text,
    this.textInputAction,
    this.errorText,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.focusNode,
    this.controller,
    this.onTap,
    this.onEditingComplete,
    this.prefix,
    this.suffix,
    this.autofocus = false,
    this.enabled = true,
    this.readOnly = false,
    this.useTextfieldLabel = false,
    this.onSubmit,
    this.maxHieght,
    this.borderRadius = 16,
    this.borderColor,
    this.focusedBorderColor = EBColors.primary,
    this.width = 1,
    this.textStyle,
    this.cursorColor,
    this.inputFormatters,
    this.contentPadding,
  }) : super(key: key);

  final TextEditingController? controller;
  final bool enabled;
  final bool autofocus;
  final bool readOnly;
  final bool isPassword;
  final bool useTextfieldLabel;
  final String? errorText;
  final String? labelText;
  final String? hintText;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final FocusNode? focusNode;
  final Function? onChanged;
  final Function? onSubmit;
  final Function? onTap;
  final Function? onEditingComplete;
  final Widget? suffix;
  final Widget? prefix;
  final TextCapitalization textCapitalization;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final double? maxHieght;
  final double borderRadius;
  final Color? borderColor;
  final Color focusedBorderColor;
  final Color? cursorColor;
  final double width;
  final TextStyle? textStyle;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (labelText != null &&
            labelText!.isNotEmpty &&
            !useTextfieldLabel) ...[
          Text(labelText!, style: BeepTextStyles.label),
          EBSpacers.height8,
        ],
        Container(
          constraints: BoxConstraints(maxHeight: maxHieght ?? double.infinity),
          child: TextField(
            readOnly: readOnly,
            cursorColor: cursorColor,
            style: textStyle,
            textInputAction: textInputAction,
            onEditingComplete: onEditingComplete as void Function()?,
            textAlignVertical: TextAlignVertical.center,
            inputFormatters: inputFormatters,
            onSubmitted: onSubmit as void Function(String)?,
            autofocus: autofocus,
            onTap: onTap as void Function()?,
            enabled: enabled,
            focusNode: focusNode,
            controller: controller,
            onChanged: onChanged as void Function(String)?,
            textCapitalization: textCapitalization,
            keyboardType: textInputType,
            obscureText: isPassword,
            maxLength: maxLength,
            maxLines: maxLines,
            minLines: minLines,
            buildCounter: (context,
                    {required currentLength, maxLength, required isFocused}) =>
                null,
            decoration: InputDecoration(
              isCollapsed: true,
              contentPadding: contentPadding,
              border: OutlineInputBorder(
                borderSide: BorderSide(width: width, color: focusedBorderColor),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: width, color: focusedBorderColor),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              enabledBorder: borderColor != null
                  ? OutlineInputBorder(
                      borderSide: BorderSide(width: width, color: borderColor!),
                      borderRadius: BorderRadius.circular(borderRadius),
                    )
                  : null,
              hintStyle: BeepTextStyles.textField
                  .copyWith(color: EBColors.beepNeutral3),
              labelStyle: BeepTextStyles.textField
                  .copyWith(color: EBColors.beepNeutral3),
              hintText: hintText,
              labelText: useTextfieldLabel ? labelText : null,
              counterText: '',
              errorText: errorText,
              suffixIcon: suffix,
              prefixIcon: prefix,
            ),
          ),
        )
      ],
    );
  }
}
