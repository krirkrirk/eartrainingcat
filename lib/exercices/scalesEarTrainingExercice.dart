import 'package:eartraining/chords/chord.dart';
import 'package:eartraining/chords/chordType.dart';
import 'package:eartraining/intervals/interval.dart';
import 'package:eartraining/intervals/intervalType.dart';
import 'package:eartraining/notes/notesCollection.dart';
import 'package:eartraining/scales/scale.dart';
import 'package:eartraining/scales/scaleType.dart';
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

  void onClick(id) {
    setState(() {
      rightAnswer = scale!.type.id == id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Scales exercice"),
        ),
        body: Column(children: [
          Staff(
            song: [],
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
                  onClick(e.id);
                },
                child: Text(e.label)),
          ),
          if (rightAnswer == true) Text("Oui !"),
          if (rightAnswer == false) Text("Non"),
          OutlinedButton(onPressed: setNewQuestion, child: const Text("Next"))
        ]));
  }
}
