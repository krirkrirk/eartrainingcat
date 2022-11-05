import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundAnswerButton extends StatefulWidget {
  String text;
  void Function() onPressed;
  bool disabled;
  bool isRightAnswer;
  bool isSelectedAnswer;

  RoundAnswerButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.isSelectedAnswer,
      required this.isRightAnswer,
      required this.disabled})
      : super(key: key);

  // disabledBackgroundColor = right ? Colors.green : isSelectedAnswer ? Colors.red : null;

  @override
  State<RoundAnswerButton> createState() => _RoundAnswerButtonState();
}

class _RoundAnswerButtonState extends State<RoundAnswerButton> {
  var disabledBackgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: widget.disabled ? null : widget.onPressed,
        child: Text(widget.text),
        style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            disabledBackgroundColor: widget.isRightAnswer
                ? Colors.green
                : widget.isSelectedAnswer
                    ? Colors.red
                    : null));
  }
}
