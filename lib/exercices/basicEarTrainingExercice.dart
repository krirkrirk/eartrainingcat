import 'package:audioplayers/audioplayers.dart';
import 'package:eartraining/buttons/playButton.dart';
import 'package:eartraining/exercices/answersGrid.dart';
import 'package:eartraining/exercices/endExerciceDialog.dart';
import 'package:eartraining/exercices/exerciceFooter.dart';
import 'package:eartraining/exercices/getTypesFromAnswerGrid.dart';
import 'package:eartraining/models/intervals/intervalType.dart';
import 'package:eartraining/mainScaffold.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/models/theoricModel.dart';
import 'package:eartraining/models/theoricTypeModel.dart';
import 'package:eartraining/staff/staff.dart';
import 'package:eartraining/staff/staffContainer.dart';
import 'package:eartraining/utilities/randomFrom.dart';
import 'package:flutter/material.dart' hide Interval;

class BasicEarTrainingExercice<Type extends TheoricTypeModel,
    Concrete extends TheoricModel> extends StatefulWidget {
  List<Type>? modelTypes;
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
    this.modelTypes,
  }) : super(key: key) {
    if (modelTypes == null) {
      modelTypes ??= getTypesFromAnswersGrid<Type>(answersGrid!);
    }
  }

  @override
  _BasicEarTrainingExerciceState<Type, Concrete> createState() =>
      _BasicEarTrainingExerciceState<Type, Concrete>();
}

class _BasicEarTrainingExerciceState<Type extends TheoricTypeModel,
    Concrete extends TheoricModel> extends State<BasicEarTrainingExercice> {
  Concrete? model;
  PlayType? playType;
  bool? isRightAnswer;
  int answersCount = 0;
  int rightAnswersCount = 0;
  String? selectedModelId;
  Concrete? modelBeingPlayed;

  @override
  void initState() {
    super.initState();
    setNewQuestion();
  }

  void setNewQuestion() {
    var modelType = randomFrom(widget.modelTypes!);
    modelBeingPlayed?.stop();
    setState(() {
      model = modelBeingPlayed = modelType.getRandom() as Concrete;
      playType = randomFrom(widget.playTypes);
      isRightAnswer = null;
      selectedModelId = null;
      model?.play(playType!);
    });
  }

  void onTryAgain() {
    Navigator.pop(context);
    modelBeingPlayed!.stop();
    setState(() {
      answersCount = 0;
      rightAnswersCount = 0;
    });
    setNewQuestion();
  }

  void onClick(id) {
    modelBeingPlayed!.stop();
    setState(() {
      if (selectedModelId == null) {
        selectedModelId = id;
        isRightAnswer = model!.type.id == id;
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
        var typeSelected =
            widget.modelTypes!.firstWhere(((element) => element.id == id));
        modelBeingPlayed = typeSelected.fromBass(model!.root);
        modelBeingPlayed!.play(playType!);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    modelBeingPlayed?.stop();
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
                              song:
                                  model?.notesCollection.getSheetData() ?? [])),
                      Expanded(
                          child: Column(children: [
                        PlayButton(onPressed: () {
                          modelBeingPlayed = model;

                          model?.play(playType!);
                        }),
                      ]))
                    ])),
            AnswersGrid(
              answersGrid: widget.answersGrid,
              models: widget.modelTypes,
              onClick: onClick,
              rightId: model!.type.id,
              selectedId: selectedModelId,
            ),
            if (selectedModelId != null)
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
