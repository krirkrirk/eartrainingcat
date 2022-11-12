import 'package:audioplayers/audioplayers.dart';
import 'package:eartraining/buttons/playButton.dart';
import 'package:eartraining/exercices/answersGrid.dart';
import 'package:eartraining/exercices/endExerciceDialog.dart';
import 'package:eartraining/exercices/exerciceFooter.dart';
import 'package:eartraining/exercices/getExercisablesFromAnswerGrid.dart';
import 'package:eartraining/models/exercisable/exercisable.dart';
import 'package:eartraining/models/intervals/intervalStructure.dart';
import 'package:eartraining/mainScaffold.dart';
import 'package:eartraining/models/model.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/models/absoluteModel.dart';
import 'package:eartraining/models/modelStructure.dart';
import 'package:eartraining/staff/staff.dart';
import 'package:eartraining/staff/staffContainer.dart';
import 'package:eartraining/utilities/randomFrom.dart';
import 'package:flutter/material.dart' hide Interval;

class BasicEarTrainingExercice<ExercisableType extends Exercisable>
    extends StatefulWidget {
  List<Exercisable>? exercisables;
  final List<PlayType> playTypes;

  final List<List<dynamic>>? answersGrid;
  final String title;
  final int questionsNumber;

  BasicEarTrainingExercice({
    Key? key,
    required this.title,
    required this.playTypes,
    required this.questionsNumber,
    this.answersGrid,
    this.exercisables,
  }) : super(key: key) {
    if (exercisables == null) {
      exercisables =
          getExercisablesFromAnswersGrid<ExercisableType>(answersGrid!);
    }
  }

  @override
  _BasicEarTrainingExerciceState<ExercisableType> createState() =>
      _BasicEarTrainingExerciceState<ExercisableType>();
}

class _BasicEarTrainingExerciceState<ExercisableType extends Exercisable>
    extends State<BasicEarTrainingExercice> {
  Exercisable? exercisable;
  PlayType? playType;
  bool? isRightAnswer;
  int answersCount = 0;
  int rightAnswersCount = 0;
  String? selectedExercisableId;
  Exercisable? exercisableBeingPlayed;

  @override
  void initState() {
    super.initState();
    setNewQuestion();
  }

  void setNewQuestion() {
    ExercisableType randExercisable = randomFrom(widget.exercisables!);
    exercisableBeingPlayed?.stop();
    setState(() {
      ExercisableType exercisable = exercisableBeingPlayed =
          randExercisable.instantiate() as ExercisableType;
      playType = randomFrom(widget.playTypes);
      isRightAnswer = null;
      selectedExercisableId = null;
      exercisable?.play(playType!);
    });
  }

  void onTryAgain() {
    Navigator.pop(context);
    exercisableBeingPlayed?.stop();
    setState(() {
      answersCount = 0;
      rightAnswersCount = 0;
    });
    setNewQuestion();
  }

  void onClick(id) {
    exercisableBeingPlayed?.stop();
    setState(() {
      if (selectedExercisableId == null) {
        selectedExercisableId = id;
        isRightAnswer = exercisable!.id == id;
        answersCount++;
        rightAnswersCount += isRightAnswer! ? 1 : 0;
        if (answersCount == widget.questionsNumber) {
          showDialog<String>(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) => EndExerciceDialog(
                    rightAnswers: rightAnswersCount,
                    maxAnswers: widget.questionsNumber,
                    onBack: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    onTryAgain: onTryAgain,
                  ));
        }
      } else {
        var exercisable =
            widget.exercisables!.firstWhere(((element) => element.id == id));
        exercisableBeingPlayed = exercisable.projectOnNote(exercisable!.root!);
        exercisableBeingPlayed?.play(playType!);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    exercisableBeingPlayed?.stop();
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        appBar: AppBar(title: Text(widget.title)),
        child: Column(children: [
          Expanded(
              child: Column(children: [
            Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 2,
                          child: StaffContainer(
                              song: exercisable?.getSheetData() ?? [])),
                      Expanded(
                          child: Column(children: [
                        PlayButton(onPressed: () {
                          exercisableBeingPlayed = exercisable;
                          exercisable?.play(playType!);
                        }),
                      ]))
                    ])),
            AnswersGrid(
              answersGrid: widget.answersGrid,
              models: widget.exercisables,
              onClick: onClick,
              rightId: exercisable!.id,
              selectedId: selectedExercisableId,
            ),
            if (selectedExercisableId != null)
              OutlinedButton(
                onPressed: setNewQuestion,
                child: const Text("Next"),
              )
          ])),
          ExerciceFooter(
              rightAnswers: rightAnswersCount,
              maxAnswers: widget.questionsNumber)
        ]));
  }
}
