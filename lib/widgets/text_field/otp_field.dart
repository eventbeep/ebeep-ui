import 'dart:async';

import 'package:flutter/cupertino.dart' show CupertinoTextField;
import 'package:flutter/material.dart';

import '../../shared.dart';
import '../text/text.dart';

typedef OnDone = void Function(String text);
typedef PinBoxDecoration = BoxDecoration Function(Color borderColor);

mixin ProvidedPinBoxDecoration {
  static BoxDecoration defaultPinBoxDecoration(Color borderColor) {
    return BoxDecoration(
        color: borderColor,
        borderRadius:
            const BorderRadius.all(Radius.circular(EBDimens.borderRadius)));
  }

  static BoxDecoration underlinedPinBoxDecoration(Color borderColor) {
    return BoxDecoration(
        border: Border(bottom: BorderSide(color: borderColor, width: 2.0)));
  }
}

mixin ProvidedPinBoxTextAnimation {
  static Widget awesomeTransition(Widget child, Animation<double> animation) {
    return RotationTransition(
        child: DefaultTextStyleTransition(
          style: TextStyleTween(
                  begin: TextStyle(color: Colors.pink),
                  end: TextStyle(color: Colors.blue))
              .animate(animation),
          child: ScaleTransition(
            child: child,
            scale: animation,
          ),
        ),
        turns: animation);
  }

  /// Simple Scaling Transition
  static Widget scalingTransition(Widget child, Animation<double> animation) {
    return ScaleTransition(
      child: child,
      scale: animation,
    );
  }

  /// No transition
  static Widget defaultNoTransition(Widget child, Animation<double> animation) {
    return child;
  }

  /// Rotate Transition
  static Widget rotateTransition(Widget child, Animation<double> animation) {
    return RotationTransition(child: child, turns: animation);
  }
}

class EBOtpField extends StatefulWidget {
  const EBOtpField({
    Key? key,
    this.isCupertino = false,
    this.maxLength = 6,
    this.controller,
    this.hideCharacter = false,
    this.highlight = true,
    this.pinBoxDecoration,
    this.maskCharacter = ' ',
    this.pinBoxWidth = 40.0,
    this.pinBoxHeight = 50.0,
    this.pinTextStyle = const TextStyle(fontSize: EBDimens.textPrimary),
    this.onDone,
    this.highlightColor = EBColors.primary200,
    this.defaultBorderColor = EBColors.tertiary200,
    this.hasTextBorderColor = EBColors.tertiary200,
    this.errorBorderColor = EBColors.error200,
    this.pinTextAnimatedSwitcherTransition,
    this.pinTextAnimatedSwitcherDuration = const Duration(milliseconds: 100),
    this.hasError = false,
    this.onTextChanged,
    this.autofocus = false,
    this.wrapAlignment = WrapAlignment.center,
    this.pinCodeTextFieldLayoutType = PinCodeTextFieldLayoutType.wrap,
    this.error = '',
    this.labelText = '',
  }) : super(key: key);

  final bool autofocus;
  final TextEditingController? controller;
  final Color defaultBorderColor;
  final String error;
  final Color errorBorderColor;
  final bool hasError;
  final Color hasTextBorderColor;
  final bool hideCharacter;
  final bool highlight;
  final Color highlightColor;
  final bool isCupertino;
  final String labelText;
  final String maskCharacter;
  final int maxLength;
  final OnDone? onDone;
  final PinBoxDecoration? pinBoxDecoration;
  final double pinBoxHeight;
  final double pinBoxWidth;
  final PinCodeTextFieldLayoutType pinCodeTextFieldLayoutType;
  final Duration pinTextAnimatedSwitcherDuration;
  final AnimatedSwitcherTransitionBuilder? pinTextAnimatedSwitcherTransition;
  final TextStyle pinTextStyle;
  final WrapAlignment wrapAlignment;

  @override
  State<StatefulWidget> createState() {
    return PinCodeTextFieldState();
  }

  final Function(String)? onTextChanged;
}

class PinCodeTextFieldState extends State<EBOtpField> {
  int currentIndex = 0;
  FocusNode focusNode = FocusNode();
  bool hasFocus = false;
  double? pinWidth;
  late double screenWidth;
  List<String> strList = <String>[];
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (widget.labelText.isNotEmpty)
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 12, bottom: 8),
              child: EBText(
                text: widget.labelText,
                size: 15,
                fontFamily: 'Heading',
                weight: FontWeight.bold,
                color: EBColors.tertiary,
              ),
            ),
          _touchPinBoxRow(),
          !widget.isCupertino ? _fakeTextInput() : _fakeTextInputCupertino(),
          if (widget.hasError)
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(24),
              child: EBText(
                text: widget.error,
                size: 12,
                color: EBColors.error,
                fontFamily: 'Simple',
              ),
            ),
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(EBOtpField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.maxLength < widget.maxLength) {
      setState(() {
        currentIndex = text.length;
      });
      widget.controller?.text = text;
      widget.controller?.selection =
          TextSelection.collapsed(offset: text.length);
    } else if (oldWidget.maxLength > widget.maxLength &&
        widget.maxLength > 0 &&
        text.isNotEmpty &&
        text.length > widget.maxLength) {
      setState(() {
        text = text.substring(0, widget.maxLength);
        currentIndex = text.length;
      });
      widget.controller?.text = text;
      widget.controller?.selection =
          TextSelection.collapsed(offset: text.length);
    }
  }

  @override
  void dispose() {
    focusNode.dispose();
    widget.controller?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initTextController();
    _calculateStrList();
    widget.controller?.addListener(() {
      setState(_initTextController);
      widget.onTextChanged!(widget.controller!.text);
    });
    focusNode.addListener(() {
      setState(() {
        hasFocus = focusNode.hasFocus;
      });
    });
  }

  Future<void> _calculateStrList() async {
    if (strList.length > widget.maxLength) {
      strList.length = widget.maxLength;
    }
    while (strList.length < widget.maxLength) {
      strList.add('');
    }
  }

  Future<void> _calculatePinWidth() async {
    if (widget.pinCodeTextFieldLayoutType ==
        PinCodeTextFieldLayoutType.autoAdjustWidth) {
      screenWidth = MediaQuery.of(context).size.width;
      var tempPinWidth = widget.pinBoxWidth;
      final maxLength = widget.maxLength;
      while ((tempPinWidth * maxLength) > screenWidth) {
        tempPinWidth -= 4;
      }
      tempPinWidth -= 10;
      setState(() {
        pinWidth = tempPinWidth;
      });
    } else {
      setState(() {
        pinWidth = widget.pinBoxWidth;
      });
    }
  }

  bool _isNumeric(String s) {
    final n = int.tryParse(s);
    return n != null && n > -1;
  }

  void _initTextController() {
    if (widget.controller == null) {
      return;
    }
    strList.clear();
    if (widget.controller!.text.isNotEmpty) {
      if (widget.controller!.text.length > widget.maxLength) {
        throw Exception('TextEditingController length exceeded maxLength!');
      }

      if (!_isNumeric(widget.controller!.text)) {
        throw Exception('TextEditingController can only contains numeric');
      }
    }

    text = widget.controller!.text;
    for (var i = 0; i < text.length; i++) {
      strList.add(widget.hideCharacter ? widget.maskCharacter : text[i]);
    }
  }

  Widget _touchPinBoxRow() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (hasFocus) {
          FocusScope.of(context).requestFocus(FocusNode());
          Future<void>.delayed(const Duration(milliseconds: 100), () {
            FocusScope.of(context).requestFocus(focusNode);
          });
        } else {
          FocusScope.of(context).requestFocus(focusNode);
        }
      },
      child: _pinBoxRow(context),
    );
  }

  Widget _fakeTextInput() {
    final transparentBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
        width: 0.0,
      ),
    );
    return Container(
      width: 0.1,
      height: 8.0, // RenderBoxDecorator subtextGap constant is 8.0
      child: TextField(
        autofocus: widget.autofocus,
        focusNode: focusNode,
        controller: widget.controller,
        keyboardType: TextInputType.number,
        style: TextStyle(
          height: 0.1,
          color: Colors.transparent,
        ),
        decoration: InputDecoration(
          focusedErrorBorder: transparentBorder,
          errorBorder: transparentBorder,
          disabledBorder: transparentBorder,
          enabledBorder: transparentBorder,
          focusedBorder: transparentBorder,
          counterText: null,
          counterStyle: null,
          helperStyle: TextStyle(
            height: 0.0,
            color: Colors.transparent,
          ),
          labelStyle: const TextStyle(height: 0.1),
          fillColor: EBColors.white,
          border: InputBorder.none,
        ),
        cursorColor: Colors.transparent,
        maxLength: widget.maxLength,
        onChanged: _onTextChanged,
      ),
    );
  }

  Widget _fakeTextInputCupertino() {
    return Container(
      width: 0.1,
      height: 0.1,
      child: CupertinoTextField(
        autofocus: widget.autofocus,
        focusNode: focusNode,
        controller: widget.controller,
        keyboardType: TextInputType.number,
        style: TextStyle(
          color: Colors.transparent,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: null,
        ),
        cursorColor: Colors.transparent,
        maxLength: widget.maxLength,
        onChanged: _onTextChanged,
      ),
    );
  }

  void _onTextChanged(String text) {
    if (widget.onTextChanged != null) {
      widget.onTextChanged!(text);
    }
    setState(() {
      this.text = text;
      if (text.length < currentIndex) {
        strList[text.length] = '';
      } else {
        strList[text.length - 1] =
            widget.hideCharacter ? widget.maskCharacter : text[text.length - 1];
      }
      currentIndex = text.length;
    });
    if (text.length == widget.maxLength) {
      widget.onDone!(text);
    }
  }

  Widget _pinBoxRow(BuildContext context) {
    _calculateStrList();
    _calculatePinWidth();
    final pinCodes = List<Widget>.generate(widget.maxLength, (i) {
      return _buildPinCode(i, context);
    });
    return widget.pinCodeTextFieldLayoutType == PinCodeTextFieldLayoutType.wrap
        ? Wrap(
            direction: Axis.horizontal,
            alignment: widget.wrapAlignment,
            verticalDirection: VerticalDirection.down,
            children: pinCodes,
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.down,
            children: pinCodes,
          );
  }

  Widget _buildPinCode(int i, BuildContext context) {
    Color borderColor;
    BoxDecoration boxDecoration;
    if (widget.hasError) {
      borderColor = widget.errorBorderColor;
    } else if (widget.highlight &&
        hasFocus &&
        (i == text.length ||
            (i == text.length - 1 && text.length == widget.maxLength))) {
      borderColor = widget.highlightColor;
    } else if (i < text.length) {
      borderColor = widget.hasTextBorderColor;
    } else {
      borderColor = widget.defaultBorderColor;
    }

    if (widget.pinBoxDecoration != null) {
      boxDecoration = widget.pinBoxDecoration!(borderColor);
    } else {
      boxDecoration =
          ProvidedPinBoxDecoration.defaultPinBoxDecoration(borderColor);
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Container(
          key: ValueKey<String>('container$i'),
          child: Center(child: _animatedTextBox(strList[i], i)),
          decoration: boxDecoration,
          width: pinWidth,
          height: widget.pinBoxHeight,
        ),
      ),
    );
  }

  Widget _animatedTextBox(String text, int i) {
    if (widget.pinTextAnimatedSwitcherTransition != null) {
      return AnimatedSwitcher(
        duration: widget.pinTextAnimatedSwitcherDuration,
        transitionBuilder: widget.pinTextAnimatedSwitcherTransition ??
            (child, animation) {
              return child;
            },
        child: Text(
          text,
          key: ValueKey<String>('$text$i'),
          style: widget.pinTextStyle,
        ),
      );
    } else {
      return Text(
        text,
        key: ValueKey<String>('${strList[i]}$i'),
        style: widget.pinTextStyle,
      );
    }
  }
}

enum PinCodeTextFieldLayoutType { normal, wrap, autoAdjustWidth }
