import 'package:eartraining/chords/chordType.dart';
import 'package:eartraining/exercices/chordsEarTrainingExercice.dart';
import 'package:eartraining/exercices/scalesEarTrainingExercice.dart';
import 'package:eartraining/intervals/interval.dart';
import 'package:eartraining/intervals/intervalType.dart';
import 'package:eartraining/exercices/intervalsEarTrainingExercice.dart';
import 'package:eartraining/mainScaffold.dart';
import 'package:eartraining/notes/notesCollection.dart';
import 'package:eartraining/scales/scaleType.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScalesEarTrainingMenu extends StatelessWidget {
  const ScalesEarTrainingMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        appBar: AppBar(
          title: Text("Scales"),
        ),
        child: Column(children: [
          const Text("Menu ear training Scales"),
          ElevatedButton(
            child: const Text("All"),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ScalesEarTrainingExercice(
                      scalesTypes: SCALES,
                      playTypes: [PlayType.ascendant, PlayType.descendant]),
                ),
              );
            },
          )
        ]));
  }
}
