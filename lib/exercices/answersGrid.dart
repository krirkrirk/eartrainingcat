import 'package:eartraining/buttons/roundAnswerButton.dart';
import 'package:flutter/cupertino.dart';

class AnswersGrid extends StatefulWidget {
  List<List<dynamic>> answersGrid;
  void Function(String id) onClick;
  String rightId;
  String? selectedId;
  // Map<String, String> labels;
  List models;

  AnswersGrid(
      {Key? key,
      required this.answersGrid,
      required this.onClick,
      required this.models,
      required this.selectedId,
      required this.rightId})
      : super(key: key);

//labels = Map.fromIterable(answersGrid,
  // key: (item) => item.id,
  // value: (item) => item?.label ?? models[item].shortLabel),
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
              children: e.map<Widget>((answerData) {
                if (answerData == null)
                  return Padding(padding: EdgeInsets.symmetric(horizontal: 10));
                var answerId =
                    answerData is String ? answerData : answerData["id"];
                var answerLabel =
                    answerData is String ? answerData : answerData["label"];

                return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: RoundAnswerButton(
                        onPressed: () {
                          widget.onClick(answerId);
                        },
                        isAnswerRevealed: widget.selectedId != null,
                        isSelectedAnswer: widget.selectedId == answerId,
                        isRightAnswer: answerId == widget.rightId,
                        text: answerLabel));
              }).toList()))
          .toList(),
    );
  }
}
