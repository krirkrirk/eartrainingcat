import 'package:eartraining/buttons/roundAnswerButton.dart';
import 'package:flutter/cupertino.dart';

class AnswersGrid extends StatefulWidget {
  List answersGrid;
  void Function(String id) onClick;
  String rightId;
  String? selectedId;

  AnswersGrid(
      {Key? key,
      required this.answersGrid,
      required this.onClick,
      required this.selectedId,
      required this.rightId})
      : super(key: key);

  @override
  State<AnswersGrid> createState() => _AnswersGridState();
}

class _AnswersGridState extends State<AnswersGrid> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.answersGrid
          .map<Widget>((e) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: e
                  .map<Widget>((modelId) => modelId == null
                      ? Padding(padding: EdgeInsets.symmetric(horizontal: 10))
                      : Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: RoundAnswerButton(
                              onPressed: () {
                                widget.onClick(modelId);
                              },
                              isAnswerRevealed: widget.selectedId != null,
                              isSelectedAnswer: widget.selectedId == modelId,
                              isRightAnswer: modelId == widget.rightId,
                              text: modelId)))
                  .toList()))
          .toList(),
    );
  }
}
