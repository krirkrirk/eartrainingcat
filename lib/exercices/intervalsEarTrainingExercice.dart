import 'package:eartraining/buttons/playButton.dart';
import 'package:eartraining/exercices/answersGrid.dart';
import 'package:eartraining/models/intervals/interval.dart';
import 'package:eartraining/models/intervals/intervalType.dart';
import 'package:eartraining/mainScaffold.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/staff/staff.dart';
import 'package:eartraining/utilities/randomFrom.dart';
import 'package:flutter/material.dart' hide Interval;

class IntervalsEarTrainingExercice extends StatefulWidget {
  List<IntervalType> intervalTypes;
  List<PlayType> playTypes;
  int nbOfQuestions;
  Function onNewAnswer;
  List answersGrid;

  IntervalsEarTrainingExercice(
      {Key? key,
      required this.intervalTypes,
      required this.playTypes,
      required this.onNewAnswer,
      required this.answersGrid,
      required this.nbOfQuestions})
      : super(key: key);

  @override
  _IntervalsEarTrainingExerciceState createState() =>
      _IntervalsEarTrainingExerciceState();
}

class _IntervalsEarTrainingExerciceState
    extends State<IntervalsEarTrainingExercice> {
  Interval? interval;
  PlayType? playType;
  bool? rightAnswer;
  String? selectedIntervalId;

  @override
  void initState() {
    super.initState();
    setNewQuestion();
  }

  void setNewQuestion() {
    var intervalType = randomFrom(widget.intervalTypes);
    setState(() {
      interval = intervalType.getRandomInterval();
      playType = randomFrom(widget.playTypes);
      rightAnswer = null;
      selectedIntervalId = null;
      interval!.play(playType!);
    });
  }

  void onClick(id) {
    setState(() {
      if (selectedIntervalId == null) {
        rightAnswer = interval!.type.id == id;
        widget.onNewAnswer(rightAnswer);
        selectedIntervalId = id;
      } else {
        INTERVALS_MAP[id]!.getIntervalFromBass(interval!.root).play(playType!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(children: [
      Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
                flex: 2,
                child: Staff(
                    song: interval?.notesCollection.getSheetData() ?? [])),
            Expanded(
                child: Column(children: [
              PlayButton(onPressed: () {
                interval!.play(playType!);
              }),
            ]))
          ])),
      AnswersGrid(
        answersGrid: widget.answersGrid,
        onClick: onClick,
        rightId: interval!.type.id,
        selectedId: selectedIntervalId,
      ),
      if (selectedIntervalId != null)
        OutlinedButton(
          onPressed: setNewQuestion,
          child: const Text("Next"),
        )
    ]));
  }
}
