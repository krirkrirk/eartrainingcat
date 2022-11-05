import 'package:eartraining/chords/chord.dart';
import 'package:eartraining/chords/chordType.dart';
import 'package:eartraining/intervals/interval.dart';
import 'package:eartraining/intervals/intervalType.dart';
import 'package:eartraining/mainScaffold.dart';
import 'package:eartraining/notes/notesCollection.dart';
import 'package:eartraining/staff/staff.dart';
import 'package:eartraining/utilities/randomFrom.dart';
import 'package:flutter/material.dart' hide Interval;

class ChordsEarTrainingExercice extends StatefulWidget {
  List<ChordType> chordsTypes;
  List<PlayType> playTypes;

  ChordsEarTrainingExercice(
      {Key? key, required this.chordsTypes, required this.playTypes})
      : super(key: key);

  @override
  _ChordsEarTrainingExerciceState createState() =>
      _ChordsEarTrainingExerciceState();
}

class _ChordsEarTrainingExerciceState extends State<ChordsEarTrainingExercice> {
  Chord? chord;
  PlayType? playType;
  bool? rightAnswer;
  @override
  void initState() {
    super.initState();
    setNewQuestion();
  }

  void setNewQuestion() {
    var chordtype = randomFrom(widget.chordsTypes);
    setState(() {
      chord = chordtype.getRandomChord();
      playType = randomFrom(widget.playTypes);
      rightAnswer = null;
    });
  }

  void onClick(id) {
    setState(() {
      rightAnswer = chord!.type.id == id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        appBar: AppBar(
          title: Text("Chords exercice"),
        ),
        child: Container(
            child: Column(children: [
          Staff(song: chord!.notesCollection.getSheetData(true)),
          OutlinedButton(
            child: const Text("Play"),
            onPressed: () {
              chord!.play(playType!);
            },
          ),
          ...widget.chordsTypes.map(
            (e) => OutlinedButton(
                onPressed: () {
                  onClick(e.id);
                },
                child: Text(e.label)),
          ),
          if (rightAnswer == true) Text("Oui !"),
          if (rightAnswer == false) Text("Non"),
          OutlinedButton(onPressed: setNewQuestion, child: const Text("Next"))
        ])));
  }
}
