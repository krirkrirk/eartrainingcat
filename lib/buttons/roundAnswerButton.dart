import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundAnswerButton extends StatefulWidget {
  String text;
  void Function() onPressed;
  bool? disabled;
  bool isRightAnswer;
  bool isSelectedAnswer;
  bool isAnswerRevealed;

  RoundAnswerButton(
      {Key? key,
      required this.text,
      required this.isAnswerRevealed,
      required this.onPressed,
      required this.isSelectedAnswer,
      required this.isRightAnswer,
      this.disabled})
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
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          minimumSize: Size(70, 70),
          backgroundColor: widget.isAnswerRevealed
              ? widget.isRightAnswer
                  ? Colors.green
                  : widget.isSelectedAnswer
                      ? Colors.red
                      : null
              : null),
      child: Text(
        widget.text,
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
