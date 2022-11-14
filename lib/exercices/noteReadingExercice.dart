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
import 'package:eartraining/staff/staff.dart';
import 'package:eartraining/staff/staffContainer.dart';
import 'package:eartraining/utilities/randomFrom.dart';
import 'package:flutter/material.dart' hide Interval;

class NoteReadingExercice extends StatefulWidget {
  final List<List<dynamic>>? answersGrid;
  final String title;
  final int questionsNumber;
  String clef;
  List<Note> notes;

  NoteReadingExercice(
      {Key? key,
      required this.title,
      required this.questionsNumber,
      this.answersGrid,
      this.clef = "G",
      required this.notes})
      : super(key: key);

  @override
  _NoteReadingExerciceState createState() => _NoteReadingExerciceState();
}

class _NoteReadingExerciceState<Concrete extends Model,
    Structure extends ModelStructure> extends State<NoteReadingExercice> {
  Note? note;
  bool? isRightAnswer;
  int answersCount = 0;
  int rightAnswersCount = 0;
  String? selectedAbsoluteNoteId;

  @override
  void initState() {
    super.initState();
    setNewQuestion();
  }

  void setNewQuestion() {
    setState(() {
      note = randomFrom(widget.notes);
      isRightAnswer = null;
      selectedAbsoluteNoteId = null;
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

  void onClick(absoluteNoteId) {
    setState(() {
      if (selectedAbsoluteNoteId == null) {
        selectedAbsoluteNoteId = absoluteNoteId;
        isRightAnswer = note?.absoluteNote.id == absoluteNoteId;
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
                              StaffContainer(song: note?.getSheetData() ?? []))
                    ])),
            AnswersGrid(
              answersGrid: widget.answersGrid,
              ids: ABSOLUTE_NOTES.map((e) => e.id).toList(),
              onClick: onClick,
              rightId: note!.absoluteNote.id,
              selectedId: selectedAbsoluteNoteId,
            ),
            if (selectedAbsoluteNoteId != null)
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
