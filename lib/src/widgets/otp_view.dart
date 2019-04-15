import 'package:eventbeep_ui/eventbeep_ui.dart';
import 'package:flutter/material.dart';

class BeepOtpView extends StatefulWidget {
  const BeepOtpView({
    this.fields = 4,
    this.onSubmit,
    this.fieldWidth = 50.0,
    this.fontSize = 20.0,
    this.isTextObscure = false,
    this.inputStyle,
    this.inputDecoration,
  }) : assert(fields > 0);
  final int fields;
  @required
  final Function onSubmit;
  final double fieldWidth;
  final double fontSize;
  final bool isTextObscure;
  final TextStyle inputStyle;
  final InputDecoration inputDecoration;

  @override
  State createState() {
    return BeepOtpViewState();
  }
}

class BeepOtpViewState extends State<BeepOtpView> {
  List<String> _pin;
  List<FocusNode> _focusNodes;
  List<TextEditingController> _textControllers;

  @override
  void initState() {
    super.initState();
    _pin = List<String>(widget.fields);
    _focusNodes = List<FocusNode>(widget.fields);
    _textControllers = List<TextEditingController>(widget.fields);
  }

  @override
  void dispose() {
    for (FocusNode focusNode in _focusNodes) {
      focusNode.dispose();
    }
    for (TextEditingController controller in _textControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void clearTextFields() {
    for (TextEditingController controller in _textControllers) {
      controller.clear();
    }
    _pin.clear();
  }

  Widget buildTextField(int i, BuildContext context) {
    _focusNodes[i] = FocusNode();
    _textControllers[i] = TextEditingController();

    _focusNodes[i].addListener(() {
      if (_focusNodes[i].hasFocus) {
        _textControllers[i].clear();
      }
    });

    return Container(
      width: widget.fieldWidth,
      margin: const EdgeInsets.only(right: BeepDimens.padding),
      child: TextField(
        controller: _textControllers[i],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: widget.inputStyle,
        maxLength: 1,
        buildCounter: (BuildContext context,
                {int currentLength, int maxLength, bool isFocused}) =>
            null,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        focusNode: _focusNodes[i],
        obscureText: widget.isTextObscure,
        onChanged: (String str) {
          _pin[i] = str;
          if (i + 1 != widget.fields) {
            FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
          } else {
            FocusScope.of(context).requestFocus(_focusNodes[0]);
            widget.onSubmit(_pin.join());
            clearTextFields();
          }
        },
        onSubmitted: (String str) {
          widget.onSubmit(_pin.join());
          clearTextFields();
        },
      ),
    );
  }

  Widget generateTextFields(BuildContext context) {
    final List<Widget> textFields =
        List<Widget>.generate(widget.fields, (int i) {
      return buildTextField(i, context);
    });

    FocusScope.of(context).requestFocus(_focusNodes[0]);

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: textFields);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: generateTextFields(context),
    );
  }
}
