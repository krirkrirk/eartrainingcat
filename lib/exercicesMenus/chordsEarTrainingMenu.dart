import 'package:eartraining/chords/chordType.dart';
import 'package:eartraining/exercices/chordsEarTrainingExercice.dart';
import 'package:eartraining/intervals/interval.dart';
import 'package:eartraining/intervals/intervalType.dart';
import 'package:eartraining/exercices/intervalsEarTrainingExercice.dart';
import 'package:eartraining/mainScaffold.dart';
import 'package:eartraining/notes/notesCollection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChordsEarTrainingMenu extends StatelessWidget {
  const ChordsEarTrainingMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        appBar: AppBar(
          title: Text("Chords"),
        ),
        child: Column(children: [
          ElevatedButton(
            child: const Text("Triades"),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChordsEarTrainingExercice(
                      chordsTypes: CHORDS,
                      playTypes: [PlayType.harmonic, PlayType.ascendant]),
                ),
              );
            },
          )
        ]));
  }
}
