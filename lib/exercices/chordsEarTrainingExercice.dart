import 'package:eartraining/buttons/playButton.dart';
import 'package:eartraining/exercices/answersGrid.dart';
import 'package:eartraining/models/chords/chord.dart';
import 'package:eartraining/models/chords/chordType.dart';
import 'package:eartraining/models/intervals/interval.dart';
import 'package:eartraining/models/intervals/intervalType.dart';
import 'package:eartraining/mainScaffold.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/staff/staff.dart';
import 'package:eartraining/utilities/randomFrom.dart';
import 'package:flutter/material.dart' hide Interval;

class ChordsEarTrainingExercice extends StatefulWidget {
  List<ChordType> chordTypes;
  List<PlayType> playTypes;
  int nbOfQuestions;
  Function onNewAnswer;
  List answersGrid;

  ChordsEarTrainingExercice(
      {Key? key,
      required this.chordTypes,
      required this.playTypes,
      required this.onNewAnswer,
      required this.answersGrid,
      required this.nbOfQuestions})
      : super(key: key);

  @override
  _ChordsEarTrainingExerciceState createState() =>
      _ChordsEarTrainingExerciceState();
}

class _ChordsEarTrainingExerciceState extends State<ChordsEarTrainingExercice> {
  Chord? chord;
  PlayType? playType;
  bool? rightAnswer;
  String? selectedChordId;

  @override
  void initState() {
    super.initState();
    setNewQuestion();
  }

  void setNewQuestion() {
    var chordType = randomFrom(widget.chordTypes);
    setState(() {
      chord = chordType.getRandomInterval();
      playType = randomFrom(widget.playTypes);
      rightAnswer = null;
      selectedChordId = null;
      chord!.play(playType!);
    });
  }

  void onClick(id) {
    setState(() {
      if (selectedChordId == null) {
        rightAnswer = chord!.type.id == id;
        widget.onNewAnswer(rightAnswer);
        selectedChordId = id;
      } else {
        CHORDS_MAP[id]!.getChordFromBass(chord!.root).play(playType!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(children: [
      Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
                flex: 2,
                child:
                    Staff(song: chord?.notesCollection.getSheetData() ?? [])),
            Expanded(
                child: Column(children: [
              PlayButton(onPressed: () {
                chord!.play(playType!);
              }),
            ]))
          ])),
      AnswersGrid(
        answersGrid: widget.answersGrid,
        onClick: onClick,
        rightId: chord!.type.id,
        selectedId: selectedChordId,
      ),
      if (selectedChordId != null)
        OutlinedButton(
          onPressed: setNewQuestion,
          child: const Text("Next"),
        )
    ]));
  }
}
