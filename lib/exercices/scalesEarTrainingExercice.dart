import 'package:eartraining/models/chords/chord.dart';
import 'package:eartraining/models/chords/chordType.dart';
import 'package:eartraining/models/intervals/interval.dart';
import 'package:eartraining/models/intervals/intervalType.dart';
import 'package:eartraining/mainScaffold.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/models/scales/scale.dart';
import 'package:eartraining/models/scales/scaleType.dart';
import 'package:eartraining/staff/staff.dart';
import 'package:eartraining/utilities/randomFrom.dart';
import 'package:flutter/material.dart' hide Interval;

class ScalesEarTrainingExercice extends StatefulWidget {
  List<ScaleType> scalesTypes;
  List<PlayType> playTypes;

  ScalesEarTrainingExercice(
      {Key? key, required this.scalesTypes, required this.playTypes})
      : super(key: key);

  @override
  _ScalesEarTrainingExerciceState createState() =>
      _ScalesEarTrainingExerciceState();
}

class _ScalesEarTrainingExerciceState extends State<ScalesEarTrainingExercice> {
  Scale? scale;
  PlayType? playType;
  bool? rightAnswer;
  @override
  void initState() {
    super.initState();
    setNewQuestion();
  }

  void setNewQuestion() {
    var scaletype = randomFrom(widget.scalesTypes);
    setState(() {
      scale = scaletype.getRandomScale();
      playType = randomFrom(widget.playTypes);
      rightAnswer = null;
    });
  }

  void onClick(label) {
    setState(() {
      rightAnswer = scale!.type.label == label;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        appBar: AppBar(
          title: Text("Scales exercice"),
        ),
        child: Column(children: [
          Staff(
            song: scale?.notesCollection.getSheetData() ?? [],
          ),
          OutlinedButton(
            child: const Text("Play"),
            onPressed: () {
              scale!.play(playType!);
            },
          ),
          ...widget.scalesTypes.map(
            (e) => OutlinedButton(
                onPressed: () {
                  onClick(e.label);
                },
                child: Text(e.label)),
          ),
          if (rightAnswer == true) Text("Oui !"),
          if (rightAnswer == false) Text("Non"),
          OutlinedButton(onPressed: setNewQuestion, child: const Text("Next"))
        ]));
  }
}
