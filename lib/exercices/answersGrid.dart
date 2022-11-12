import 'package:eartraining/buttons/roundAnswerButton.dart';
import 'package:eartraining/models/modelStructure.dart';
import 'package:flutter/cupertino.dart';

class AnswersGrid extends StatefulWidget {
  List<List<dynamic>>? answersGrid;
  void Function(String id) onClick;
  String rightId;
  String? selectedId;
  // Map<String, String> labels;
  List? models;
  String Function(ModelStructure modelStructure)? labelsMap;

  AnswersGrid(
      {Key? key,
      this.answersGrid,
      this.models,
      this.labelsMap,
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
    return widget.answersGrid != null
        ? Column(
            children: widget.answersGrid!
                .map<Widget>(
                  (row) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: row.map<Widget>((answerData) {
                        if (answerData == null)
                          return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 0));
                        var answerId = answerData is String
                            ? answerData
                            : answerData["id"];
                        var answerLabel = answerData is String
                            ? answerData
                            : answerData["label"];

                        return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 0),
                            child: RoundAnswerButton(
                                onPressed: () {
                                  widget.onClick(answerId);
                                },
                                isAnswerRevealed: widget.selectedId != null,
                                isSelectedAnswer: widget.selectedId == answerId,
                                isRightAnswer: answerId == widget.rightId,
                                text: answerLabel));
                      }).toList()),
                )
                .toList())
        : Expanded(
            child: GridView.count(
                crossAxisCount: 5,
                children: widget.models!
                    .map<Widget>((model) => RoundAnswerButton(
                        onPressed: () {
                          widget.onClick(model.id);
                        },
                        isAnswerRevealed: widget.selectedId != null,
                        isSelectedAnswer: widget.selectedId == model.id,
                        isRightAnswer: model.id == widget.rightId,
                        text: widget.labelsMap!(model)))
                    .toList()));
  }
}
