import 'package:audioplayers/audioplayers.dart';
import 'package:eartraining/buttons/playButton.dart';
import 'package:eartraining/exercices/answersGrid/answersGrid.dart';
import 'package:eartraining/exercices/endExerciceDialog.dart';
import 'package:eartraining/exercices/exerciceFooter.dart';
import 'package:eartraining/exercices/utils/getStructuresFromAnswersGrid.dart';
import 'package:eartraining/models/intervals/intervalStructure.dart';
import 'package:eartraining/mainScaffold.dart';
import 'package:eartraining/models/model.dart';
import 'package:eartraining/models/notes/note.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/models/absoluteModel.dart';
import 'package:eartraining/models/modelStructure.dart';
import 'package:eartraining/staff/staff.dart';
import 'package:eartraining/staff/staffContainer.dart';
import 'package:eartraining/utilities/randomFrom.dart';
import 'package:flutter/material.dart' hide Interval;

///Facon de créer l'exo :
///- passer answersGrid pour avoir une disposition custom (sinon automatisé mais alors passer modelStructures)
///- passer candidateBasses pour spécifier les absses (sinon utiliser les getRandomModel())
class ReadingExercice<Concrete extends Model, Structure extends ModelStructure>
    extends StatefulWidget {
  List<Structure>? modelStructures;
  final List<List<dynamic>>? answersGrid;
  final String title;
  final int questionsNumber;
  List<Note>? candidateBasses;
  String Function(String id)? labelsMap;

  ReadingExercice({
    Key? key,
    required this.title,
    required this.questionsNumber,
    this.answersGrid,
    this.candidateBasses,
    this.modelStructures,
    this.labelsMap,
  }) : super(key: key) {
    if (modelStructures == null) {
      modelStructures = getStructuresFromAnswersGrid<Structure>(answersGrid!);
    }
  }

  @override
  _ReadingExerciceState<Concrete, Structure> createState() =>
      _ReadingExerciceState<Concrete, Structure>();
}

class _ReadingExerciceState<Concrete extends Model,
    Structure extends ModelStructure> extends State<ReadingExercice> {
  Concrete? model;
  bool? isRightAnswer;
  int answersCount = 0;
  int rightAnswersCount = 0;
  String? selectedStructureId;

  @override
  void initState() {
    super.initState();
    setNewQuestion();
  }

  void setNewQuestion() {
    Structure randStructure = randomFrom(widget.modelStructures!);
    setState(() {
      if (widget.candidateBasses != null) {
        var bass = randomFrom<Note>(widget.candidateBasses!);
        model = randStructure.projectOnNote(bass);
      } else {
        model = randStructure.getRandomModel();
      }
      isRightAnswer = null;
      selectedStructureId = null;
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

  void onClick(structureId) {
    setState(() {
      if (selectedStructureId == null) {
        selectedStructureId = structureId;
        isRightAnswer = model?.structure.id == structureId;
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
        var structure = widget.modelStructures!
            .firstWhere(((element) => element.id == structureId));
      }
    });
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
                              song: model?.getSheetData(false) ?? [])),
                    ])),
            AnswersGrid(
              answersGrid: widget.answersGrid,
              ids: widget.modelStructures?.map((e) => e.id).toList() ?? [],
              onClick: onClick,
              rightId: model!.structure.id,
              selectedId: selectedStructureId,
              labelsMap: widget.labelsMap,
            ),
            if (selectedStructureId != null)
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
