import 'package:eartraining/exercices/intervalsEarTrainingExercice.dart';
import 'package:eartraining/intervals/intervalType.dart';
import 'package:eartraining/mainScaffold.dart';
import 'package:eartraining/notes/notesCollection.dart';
import 'package:eartraining/utilities/randomFrom.dart';
import 'package:flutter/material.dart';

enum ExerciceType {
  intervalsEarTraining,
}

class ExercicePage extends StatefulWidget {
  String title;
  ExerciceType exerciceType;
  List modelTypes;
  List<PlayType> playTypes;
  ExercicePage(
      {Key? key,
      required this.title,
      required this.exerciceType,
      required this.modelTypes,
      required this.playTypes})
      : super(key: key);

  @override
  State<ExercicePage> createState() => _ExercicePageState();
}

class _ExercicePageState extends State<ExercicePage> {
  int rightAnswers = 0;
  int maxAnswers = 6;
  Widget? exercice;

  onNewAnswer(bool isRight) {
    setState(() {
      rightAnswers += isRight ? 1 : 0;
    });
  }

  @override
  void initState() {
    super.initState();

    List<IntervalType> types = widget.modelTypes as List<IntervalType>;
    switch (widget.exerciceType) {
      case ExerciceType.intervalsEarTraining:
        exercice = IntervalsEarTrainingExercice(
            intervalTypes: types,
            playTypes: widget.playTypes,
            onNewAnswer: onNewAnswer,
            nbOfQuestions: maxAnswers);

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        appBar: AppBar(title: Text(widget.title)),
        child: Stack(children: [
          if (exercice != null) exercice!,
          Text(
              "Bonne réponse : $rightAnswers/$maxAnswers  |  Ratio : ${(rightAnswers / maxAnswers * 100).round()}%")
        ]));
  }
}
