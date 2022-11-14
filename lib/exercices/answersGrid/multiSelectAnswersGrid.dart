import 'package:eartraining/buttons/roundAnswerButton.dart';
import 'package:eartraining/models/modelStructure.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class MultiSelectAnswersGrid extends StatefulWidget {
  List<List<dynamic>> answersGrid;
  void Function(List<String> answerIds) onValidate;
  String? selectedId;
  bool isAnswerRevealed;
  List<String> rightAnswerIds;
  String Function(String id)? labelsMap;

  MultiSelectAnswersGrid(
      {Key? key,
      required this.isAnswerRevealed,
      required this.answersGrid,
      required this.onValidate,
      required this.rightAnswerIds})
      : super(key: key);

  @override
  _MultiSelectAnswersGridState createState() => _MultiSelectAnswersGridState();
}

class _MultiSelectAnswersGridState extends State<MultiSelectAnswersGrid> {
  List<String> answerIds = [];

  @override
  void didUpdateWidget(MultiSelectAnswersGrid oldWidget) {
    if (!oldWidget.rightAnswerIds.equals(widget.rightAnswerIds)) {
      answerIds = widget.answersGrid.map((e) => "tbd").toList();
    }
    super.didChangeDependencies();
  }

  @override
  initState() {
    setState(() {
      answerIds = widget.answersGrid.map((e) => "tbd").toList();
    });
    super.initState();
  }

  void onSubmit() {
    widget.onValidate(answerIds);
  }

  Widget build(BuildContext context) {
    return Column(children: [
      ...widget.answersGrid
          .asMap()
          .entries
          .map<Widget>(
            (row) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: row.value.map((entry) {
                  if (entry == null)
                    return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0));
                  var answerId = entry is String ? entry : entry["id"];
                  var answerLabel = entry is String ? entry : entry["label"];
                  return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 0),
                      child: RoundAnswerButton(
                          onPressed: () {
                            if (widget.isAnswerRevealed) return;
                            setState(() {
                              answerIds[row.key] = answerId;
                            });
                          },
                          isAnswerRevealed: widget.isAnswerRevealed,
                          isSelectedAnswer: answerIds[row.key] == answerId,
                          isRightAnswer:
                              answerId == widget.rightAnswerIds[row.key],
                          text: answerLabel));
                }).toList()),
          )
          .toList(),
      if (!widget.isAnswerRevealed)
        ElevatedButton(
            onPressed: () {
              onSubmit();
            },
            child: Text("Valider"))
    ]);
  }
}
