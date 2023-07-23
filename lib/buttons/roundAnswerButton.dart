import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundAnswerButton extends StatefulWidget {
  String text;
  void Function() onPressed;
  bool? disabled;
  bool isRightAnswer;
  bool isSelectedAnswer;
  bool isAnswerRevealed;
  Color? backgroundColor;

  RoundAnswerButton(
      {Key? key,
      required this.text,
      required this.isAnswerRevealed,
      required this.onPressed,
      required this.isSelectedAnswer,
      required this.isRightAnswer,
      this.disabled})
      : super(key: key) {
    if (isAnswerRevealed) {
      backgroundColor = isRightAnswer
          ? Colors.green
          : isSelectedAnswer
              ? Colors.red
              : Colors.blueGrey;
    } else {
      backgroundColor = isSelectedAnswer ? null : Colors.blueGrey;
    }
  }

  // disabledBackgroundColor = right ? Colors.green : isSelectedAnswer ? Colors.red : null;

  @override
  State<RoundAnswerButton> createState() => _RoundAnswerButtonState();
}

class _RoundAnswerButtonState extends State<RoundAnswerButton> {
  Color? getBackgroundColor() {
    if (widget.isAnswerRevealed) {
      return widget.isRightAnswer
          ? Colors.green
          : widget.isSelectedAnswer
              ? Colors.red
              : Colors.blueGrey;
    } else {
      return widget.isSelectedAnswer ? null : Colors.blueGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(2),
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              minimumSize: Size(40, 50),
              backgroundColor: getBackgroundColor()),
          child: Text(
            widget.text,
            style: TextStyle(fontSize: 18),
          ),
        ));
  }
}
