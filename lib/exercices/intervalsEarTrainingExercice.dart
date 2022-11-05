import 'package:eartraining/intervals/interval.dart';
import 'package:eartraining/intervals/intervalType.dart';
import 'package:eartraining/mainScaffold.dart';
import 'package:eartraining/notes/notesCollection.dart';
import 'package:eartraining/roundAnswerButton.dart';
import 'package:eartraining/staff/staff.dart';
import 'package:eartraining/utilities/randomFrom.dart';
import 'package:flutter/material.dart' hide Interval;

class IntervalsEarTrainingExercice extends StatefulWidget {
  List<IntervalType> intervalTypes;
  List<PlayType> playTypes;
  int nbOfQuestions;
  Function onNewAnswer;

  IntervalsEarTrainingExercice(
      {Key? key,
      required this.intervalTypes,
      required this.playTypes,
      required this.onNewAnswer,
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
    });
  }

  void onClick(id) {
    setState(() {
      rightAnswer = interval!.type.id == id;
      widget.onNewAnswer(rightAnswer);
      selectedIntervalId = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Staff(song: interval?.notesCollection.getSheetData() ?? []),
      OutlinedButton(
        child: const Text("Play"),
        onPressed: () {
          interval!.play(playType!);
        },
      ),
      ...widget.intervalTypes.map(
        (e) => RoundAnswerButton(
            onPressed: () {
              onClick(e.id);
            },
            isSelectedAnswer: e.id == selectedIntervalId,
            isRightAnswer: e.id == interval?.type.id,
            disabled: rightAnswer != null,
            text: e.id),
      ),
      OutlinedButton(onPressed: setNewQuestion, child: const Text("Next"))
    ]);
  }
}
