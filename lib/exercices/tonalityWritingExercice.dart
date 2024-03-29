import 'package:audioplayers/audioplayers.dart';
import 'package:eartraining/buttons/playButton.dart';
import 'package:eartraining/exercices/answersGrid/answersGrid.dart';
import 'package:eartraining/exercices/endExerciceDialog.dart';
import 'package:eartraining/exercices/exerciceFooter.dart';
import 'package:eartraining/exercices/utils/getStructuresFromAnswersGrid.dart';
import 'package:eartraining/models/intervals/intervalStructure.dart';
import 'package:eartraining/mainScaffold.dart';
import 'package:eartraining/models/model.dart';
import 'package:eartraining/models/notes/absoluteNote.dart';
import 'package:eartraining/models/notes/note.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/models/absoluteModel.dart';
import 'package:eartraining/models/modelStructure.dart';
import 'package:eartraining/models/scales/tonality.dart';
import 'package:eartraining/staff/staff.dart';
import 'package:eartraining/staff/staffContainer.dart';
import 'package:eartraining/utilities/randomFrom.dart';
import 'package:flutter/material.dart' hide Interval;

class TonalityWritingExercice extends StatefulWidget {
  final List<List<dynamic>>? answersGrid;
  final String title;
  final int questionsNumber;
  String clef;
  List<Tonality> tonalities;

  TonalityWritingExercice(
      {Key? key,
      required this.title,
      required this.questionsNumber,
      this.answersGrid,
      this.clef = "G",
      required this.tonalities})
      : super(key: key);

  @override
  _TonalityWritingExerciceState createState() =>
      _TonalityWritingExerciceState();
}

class _TonalityWritingExerciceState<Concrete extends Model,
    Structure extends ModelStructure> extends State<TonalityWritingExercice> {
  Tonality? tonality;
  bool? isRightAnswer;
  int answersCount = 0;
  int rightAnswersCount = 0;
  String? selectedArmorId;

  @override
  void initState() {
    super.initState();
    setNewQuestion();
  }

  void setNewQuestion() {
    setState(() {
      tonality = randomFrom(widget.tonalities);
      isRightAnswer = null;
      selectedArmorId = null;
    });
  }

  void onTryAgain() {
    Navigator.pop(context);
    setState(() {
      answersCount = 0;
      rightAnswersCount = 0;
    });
    setNewQuestion();
  }

  void onClick(armorId) {
    setState(() {
      if (selectedArmorId == null) {
        selectedArmorId = armorId;
        isRightAnswer = tonality?.armor.id == selectedArmorId;
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
        //show on staff
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
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
                          child:
                              StaffContainer(song: [], armor: tonality?.armor))
                    ])),
            Container(
                padding: EdgeInsets.only(bottom: 10),
                child: DecoratedBox(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(0xFFdae1d6)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        "Tonalité : ${tonality?.id}",
                        textScaleFactor: 3,
                        // style: TextStyle(fontSize: 20),
                      ),
                    ))),
            AnswersGrid(
              answersGrid: widget.answersGrid,
              ids: widget.tonalities.map((e) => e.armor.id).toList(),
              onClick: onClick,
              rightId: tonality!.armor.id,
              selectedId: selectedArmorId,
            ),
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
