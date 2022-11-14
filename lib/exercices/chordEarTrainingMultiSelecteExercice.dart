import 'package:audioplayers/audioplayers.dart';
import 'package:eartraining/buttons/playButton.dart';
import 'package:eartraining/exercices/answersGrid/answersGrid.dart';
import 'package:eartraining/exercices/answersGrid/multiSelectAnswersGrid.dart';
import 'package:eartraining/exercices/endExerciceDialog.dart';
import 'package:eartraining/exercices/exerciceFooter.dart';
import 'package:eartraining/exercices/utils/getStructuresFromAnswersGrid.dart';
import 'package:eartraining/models/chords/chord.dart';
import 'package:eartraining/models/chords/chordStructure.dart';
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
import 'package:collection/collection.dart';

class ChordEarTrainingMultiSelectExercice extends StatefulWidget {
  List<ChordStructure>? chordsStructures;
  final List<List<dynamic>>? answersGrid;
  final String title;
  final int questionsNumber;
  List<Note>? candidateBasses;
  String Function(String id)? labelsMap;

  ChordEarTrainingMultiSelectExercice({
    Key? key,
    required this.title,
    required this.questionsNumber,
    this.answersGrid,
    this.candidateBasses,
    this.chordsStructures,
    this.labelsMap,
  }) : super(key: key) {
    if (chordsStructures == null) {
      chordsStructures =
          getStructuresFromAnswersGrid<ChordStructure>(answersGrid!);
    }
  }

  @override
  _ChordEarTrainingMultiSelectExerciceState createState() =>
      _ChordEarTrainingMultiSelectExerciceState();
}

class _ChordEarTrainingMultiSelectExerciceState
    extends State<ChordEarTrainingMultiSelectExercice> {
  Chord? chord;
  bool? isRightAnswer;
  int answersCount = 0;
  int rightAnswersCount = 0;
  Chord? chordBeingPlayed;
  bool hasAnswered = false;
  List<String> rightAnswerIds = [];

  @override
  void initState() {
    super.initState();
    setNewQuestion();
  }

  void setNewQuestion() {
    chordBeingPlayed?.stop();
    ChordStructure randStructure = randomFrom(widget.chordsStructures!);
    setState(() {
      if (widget.candidateBasses != null) {
        var bass = randomFrom<Note>(widget.candidateBasses!);
        chord = randStructure.projectOnNote(bass);
      } else {
        chord = randStructure.getRandomModel();
        chordBeingPlayed = chord;
      }
      rightAnswerIds =
          chord!.structure.getNonInversedChordStructureIds().sublist(1);
      if (chord!.structure.inversion > 0)
        rightAnswerIds.add(":${chord!.structure.inversion}");
      else
        rightAnswerIds.add("");
      isRightAnswer = null;
      hasAnswered = false;
      chordBeingPlayed?.play(PlayType.harmonic);
    });
  }

  void onTryAgain() {
    Navigator.pop(context);
    chordBeingPlayed?.stop();
    setState(() {
      answersCount = 0;
      rightAnswersCount = 0;
    });
    setNewQuestion();
  }

  void onValidate(List<String> answerIds) {
    chordBeingPlayed?.stop();
    List<String> nonInversedChordStructureIds =
        chord!.structure.getNonInversedChordStructureIds();
    var intervalsIds = answerIds
        .where((element) => element != "" && !element.contains(":"))
        .toList();
    var inversionNumber = (answerIds.contains(":1") || answerIds.contains(":2"))
        ? answerIds[answerIds.length - 1]
        : 0;
    setState(() {
      hasAnswered = true;
      isRightAnswer =
          nonInversedChordStructureIds.equals(["1", ...intervalsIds]) &&
              inversionNumber == chord!.structure.inversion;
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
  }

  @override
  void dispose() {
    super.dispose();
    chordBeingPlayed?.stop();
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
                              song: chord?.getSheetData(true) ?? [])),
                      Expanded(
                          child: Column(children: [
                        PlayButton(onPressed: () {
                          chordBeingPlayed = chord;
                          chordBeingPlayed?.play(PlayType.harmonic);
                        }),
                      ]))
                    ])),
            MultiSelectAnswersGrid(
              answersGrid: widget.answersGrid!,
              onValidate: onValidate,
              isAnswerRevealed: hasAnswered,
              rightAnswerIds: rightAnswerIds,
            ),
            if (hasAnswered)
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
