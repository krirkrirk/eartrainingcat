import 'package:eartraining/exercices/chordsEarTrainingExercice.dart';
import 'package:eartraining/exercices/endExerciceDialog.dart';
import 'package:eartraining/exercices/intervalsEarTrainingExercice.dart';
import 'package:eartraining/models/chords/chordType.dart';
import 'package:eartraining/models/intervals/intervalType.dart';
import 'package:eartraining/mainScaffold.dart';
import 'package:eartraining/models/models.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/utilities/randomFrom.dart';
import 'package:flutter/material.dart';

enum ExerciceType {
  intervalsEarTraining,
  chordsEarTraining,
}

List<T> getTypes<T>(List answersGrid) {
  var modelMap = modelMaps[T.toString()];
  List<T> res = [];
  answersGrid.forEach((row) {
    row.forEach((id) {
      if (id == null) return;
      res.add(modelMap![id]);
    });
  });
  return res;
}

class ExercicePage extends StatefulWidget {
  String title;
  ExerciceType exerciceType;
  List answersGrid;
  List<PlayType> playTypes;
  ExercicePage(
      {Key? key,
      required this.title,
      required this.answersGrid,
      required this.exerciceType,
      required this.playTypes})
      : super(key: key);

  @override
  State<ExercicePage> createState() => _ExercicePageState();
}

class _ExercicePageState extends State<ExercicePage> {
  int rightAnswers = 0;
  int answersCount = 0;
  int maxAnswers = 3;
  Widget? exercice;

  onTryAgain() {
    setState(() {
      rightAnswers = 0;
      answersCount = 0;
      Navigator.pop(context);
    });
  }

  onNewAnswer(bool isRight) {
    setState(() {
      answersCount++;
      rightAnswers += isRight ? 1 : 0;
      if (answersCount == maxAnswers) {
        showDialog<String>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => EndExerciceDialog(
                  rightAnswers: rightAnswers,
                  maxAnswers: maxAnswers,
                  onBack: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  onTryAgain: onTryAgain,
                ));
      }
    });
  }

  @override
  void initState() {
    super.initState();

    switch (widget.exerciceType) {
      case ExerciceType.intervalsEarTraining:
        exercice = IntervalsEarTrainingExercice(
          intervalTypes: getTypes<IntervalType>(widget.answersGrid),
          playTypes: widget.playTypes,
          onNewAnswer: onNewAnswer,
          nbOfQuestions: maxAnswers,
          answersGrid: widget.answersGrid,
        );
        break;
      case ExerciceType.chordsEarTraining:
        exercice = ChordsEarTrainingExercice(
          chordTypes: getTypes<ChordType>(widget.answersGrid),
          playTypes: widget.playTypes,
          onNewAnswer: onNewAnswer,
          nbOfQuestions: maxAnswers,
          answersGrid: widget.answersGrid,
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        appBar: AppBar(title: Text(widget.title)),
        child: Column(children: [
          if (exercice != null) exercice!,
          Text(
              "Bonne réponse : $rightAnswers/$maxAnswers  |  Ratio : ${(rightAnswers / maxAnswers * 100).round()}%")
        ]));
  }
}
