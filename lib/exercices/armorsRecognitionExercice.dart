import 'package:eartraining/exercices/answersGrid.dart';
import 'package:eartraining/exercices/endExerciceDialog.dart';
import 'package:eartraining/exercices/exerciceFooter.dart';
import 'package:eartraining/exercices/getTypesFromAnswerGrid.dart';
import 'package:eartraining/models/armor/armor.dart';
import 'package:eartraining/mainScaffold.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/models/theoricTypeModel.dart';
import 'package:eartraining/staff/staff.dart';
import 'package:eartraining/staff/staffContainer.dart';
import 'package:eartraining/utilities/randomFrom.dart';
import 'package:flutter/material.dart' hide Interval;

class ArmorsRecognitionExercice extends StatefulWidget {
  List<Armor>? armors;
  List<PlayType>? playTypes;
  int questionsNumber;
  List<List<dynamic>>? answersGrid;
  String title;
  bool isReadingExercice;
  ArmorsRecognitionExercice(
      {Key? key,
      required this.title,
      this.playTypes,
      this.answersGrid,
      this.armors,
      this.isReadingExercice = false,
      required this.questionsNumber})
      : super(key: key) {
    if (armors == null) armors = getTypesFromAnswersGrid(answersGrid!);
  }

  @override
  _ArmorsRecognitionExerciceState createState() =>
      _ArmorsRecognitionExerciceState();
}

class _ArmorsRecognitionExerciceState extends State<ArmorsRecognitionExercice> {
  Armor? armor;
  PlayType? playType;
  String? selectedArmorId;
  bool? isRightAnswer;
  int answersCount = 0;
  int rightAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    setNewQuestion();
  }

  void setNewQuestion() {
    setState(() {
      armor = randomFrom(widget.armors!);
      isRightAnswer = null;
      selectedArmorId = null;
    });
  }

  void onClick(id) {
    if (selectedArmorId == null) {
      setState(() {
        isRightAnswer = armor!.id == id;
        selectedArmorId = id;
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
      });
    } else {
      // show armor in staff
    }
  }

  void onTryAgain() {
    setState(() {
      answersCount = 0;
      rightAnswersCount = 0;
    });
    setNewQuestion();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        appBar: AppBar(title: Text(widget.title)),
        child: Column(children: [
          Expanded(
              child: Column(children: [
            Center(
              child: Container(
                  width: 200,
                  child: StaffContainer(
                    armor: armor,
                    song: [],
                  )),
            ),
            AnswersGrid(
              answersGrid: widget.isReadingExercice ? null : widget.answersGrid,
              models: widget.isReadingExercice ? null : widget.armors,
              onClick: onClick,
              rightId: armor!.id,
              selectedId: selectedArmorId,
            ),
            Text("armure ${armor?.id}"),
            if (selectedArmorId != null)
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
