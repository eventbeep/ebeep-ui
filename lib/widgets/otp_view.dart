import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart' show CupertinoTextField;
import 'package:flutter/material.dart';

import '../shared.dart';
import 'text.dart';

typedef OnDone = void Function(String text);
typedef PinBoxDecoration = BoxDecoration Function(Color borderColor);

mixin ProvidedPinBoxDecoration {
  static PinBoxDecoration defaultPinBoxDecoration = (Color borderColor) {
    return BoxDecoration(
        color: borderColor,
        borderRadius:
            const BorderRadius.all(Radius.circular(BeepDimens.cornerRadius)));
  };

  static PinBoxDecoration underlinedPinBoxDecoration = (Color borderColor) {
    return BoxDecoration(
        border: Border(bottom: BorderSide(color: borderColor, width: 2.0)));
  };
}

mixin ProvidedPinBoxTextAnimation {
  static AnimatedSwitcherTransitionBuilder awesomeTransition =
      (Widget child, Animation<double> animation) {
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
  };

  /// Simple Scaling Transition
  static AnimatedSwitcherTransitionBuilder scalingTransition =
      (Widget child, Animation<double> animation) {
    return ScaleTransition(
      child: child,
      scale: animation,
    );
  };

  /// No transition
  static AnimatedSwitcherTransitionBuilder defaultNoTransition =
      (Widget child, Animation<double> animation) {
    return child;
  };

  /// Rotate Transition
  static AnimatedSwitcherTransitionBuilder rotateTransition =
      (Widget child, Animation<double> animation) {
    return RotationTransition(child: child, turns: animation);
  };
}

class BeepOtpField extends StatefulWidget {
  const BeepOtpField({
    Key key,
    this.isCupertino = false,
    this.maxLength = 6,
    this.controller,
    this.hideCharacter = false,
    this.highlight = true,
    this.pinBoxDecoration,
    this.maskCharacter = ' ',
    this.pinBoxWidth = 40.0,
    this.pinBoxHeight = 50.0,
    this.pinTextStyle = const TextStyle(fontSize: BeepDimens.textPrimary),
    this.onDone,
    this.highlightColor = BeepColors.primary200,
    this.defaultBorderColor = BeepColors.tertiary200,
    this.hasTextBorderColor = BeepColors.tertiary200,
    this.errorBorderColor = BeepColors.error200,
    this.pinTextAnimatedSwitcherTransition,
    this.pinTextAnimatedSwitcherDuration = const Duration(milliseconds: 100),
    this.hasError = false,
    this.onTextChanged,
    this.autofocus = false,
    this.wrapAlignment = WrapAlignment.center,
    this.pinCodeTextFieldLayoutType = PinCodeTextFieldLayoutType.WRAP,
    this.error,
  }) : super(key: key);

  final bool isCupertino;
  final int maxLength;
  final TextEditingController controller;
  final bool hideCharacter;
  final bool highlight;
  final Color highlightColor;
  final Color defaultBorderColor;
  final PinBoxDecoration pinBoxDecoration;
  final String maskCharacter;
  final TextStyle pinTextStyle;
  final double pinBoxHeight;
  final double pinBoxWidth;
  final OnDone onDone;
  final bool hasError;
  final Color errorBorderColor;
  final Color hasTextBorderColor;
  final Function(String) onTextChanged;
  final bool autofocus;
  final AnimatedSwitcherTransitionBuilder pinTextAnimatedSwitcherTransition;
  final Duration pinTextAnimatedSwitcherDuration;
  final WrapAlignment wrapAlignment;
  final PinCodeTextFieldLayoutType pinCodeTextFieldLayoutType;
  final String error;

  @override
  State<StatefulWidget> createState() {
    return PinCodeTextFieldState();
  }
}

class PinCodeTextFieldState extends State<BeepOtpField> {
  FocusNode focusNode = FocusNode();
  String text = '';
  int currentIndex = 0;
  List<String> strList = <String>[];
  bool hasFocus = false;
  double pinWidth;
  double screenWidth;

  @override
  void didUpdateWidget(BeepOtpField oldWidget) {
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
        PinCodeTextFieldLayoutType.AUTO_ADJUST_WIDTH) {
      screenWidth = MediaQuery.of(context).size.width;
      double tempPinWidth = widget.pinBoxWidth;
      final int maxLength = widget.maxLength;
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

  @override
  void initState() {
    super.initState();
    _initTextController();
    _calculateStrList();
    widget.controller?.addListener(() {
      setState(() {
        _initTextController();
      });
      widget.onTextChanged(widget.controller.text);
    });
    focusNode.addListener(() {
      setState(() {
        hasFocus = focusNode.hasFocus;
      });
    });
  }

  bool _isNumeric(String s) {
    if (s == null) {
      return false;
    }
    final int n = int.tryParse(s);
    return n != null && n > -1;
  }

  void _initTextController() {
    if (widget.controller == null) {
      return;
    }
    strList.clear();
    if (widget.controller.text.isNotEmpty) {
      if (widget.controller.text.length > widget.maxLength) {
        throw Exception('TextEditingController length exceeded maxLength!');
      }

      if (!_isNumeric(widget.controller.text)) {
        throw Exception('TextEditingController can only contains numeric');
      }
    }

    text = widget.controller.text;
    for (int i = 0; i < text.length; i++) {
      strList.add(widget.hideCharacter ? widget.maskCharacter : text[i]);
    }
  }

  @override
  void dispose() {
    focusNode?.dispose();
    widget.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _touchPinBoxRow(),
          !widget.isCupertino ? _fakeTextInput() : _fakeTextInputCupertino(),
          Visibility(
            visible: widget.hasError,
            child: BeepCustomText(
              text: widget.error,
              size: 12,
              color: BeepColors.error,
              fontFamily: 'Simple',
            ),
          ),
        ],
      ),
    );
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
    final OutlineInputBorder transparentBorder = OutlineInputBorder(
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
          height: 0.1, color: Colors.transparent,
//          color: Colors.transparent,
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
          fillColor: Colors.transparent,
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
      widget.onTextChanged(text);
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
      // FocusScope.of(context).requestFocus(FocusNode());
      widget.onDone(text);
    }
  }

  Widget _pinBoxRow(BuildContext context) {
    _calculateStrList();
    _calculatePinWidth();
    final List<Widget> pinCodes =
        List<Widget>.generate(widget.maxLength, (int i) {
      return _buildPinCode(i, context);
    });
    return widget.pinCodeTextFieldLayoutType == PinCodeTextFieldLayoutType.WRAP
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
      boxDecoration = widget.pinBoxDecoration(borderColor);
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
            (Widget child, Animation<double> animation) {
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

enum PinCodeTextFieldLayoutType { NORMAL, WRAP, AUTO_ADJUST_WIDTH }
