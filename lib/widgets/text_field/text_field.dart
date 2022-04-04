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
    this.prefix,
    this.suffix,
    this.autofocus = false,
    this.enabled = true,
    this.readOnly = false,
    this.onSubmit,
    this.maxHieght,
    this.borderColor,
    this.focusedBorderColor = EBColors.primary,
    this.width = 1,
    this.inputFormatters,
  }) : super(key: key);

  final TextEditingController? controller;
  final bool enabled;
  final bool autofocus;
  final bool readOnly;
  final bool isPassword;
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
  final Widget? suffix;
  final Widget? prefix;
  final TextCapitalization textCapitalization;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final double? maxHieght;
  final Color? borderColor;
  final Color focusedBorderColor;
  final double width;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (labelText != null && labelText!.isNotEmpty) ...[
          Text(labelText!, style: EBTextStyles.label),
          EBSpacers.height8,
        ],
        Container(
          constraints: BoxConstraints(maxHeight: maxHieght ?? double.infinity),
          child: TextField(
            readOnly: readOnly,
            textInputAction: textInputAction,
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
              border: OutlineInputBorder(
                borderSide: BorderSide(width: width, color: focusedBorderColor),
                borderRadius: BorderRadius.circular(EBDimens.borderRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: focusedBorderColor),
                borderRadius: BorderRadius.circular(EBDimens.borderRadius),
              ),
              enabledBorder: borderColor != null
                  ? OutlineInputBorder(
                      borderSide: BorderSide(width: width, color: borderColor!),
                      borderRadius:
                          BorderRadius.circular(EBDimens.borderRadius),
                    )
                  : null,
              hintStyle:
                  EBTextStyles.bodyText1.copyWith(color: EBColors.grey50),
              hintText: hintText,
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
