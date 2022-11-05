import 'package:eartraining/exercices/exercicePage.dart';
import 'package:eartraining/intervals/interval.dart';
import 'package:eartraining/intervals/intervalType.dart';
import 'package:eartraining/exercices/intervalsEarTrainingExercice.dart';
import 'package:eartraining/mainScaffold.dart';
import 'package:eartraining/notes/notesCollection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntervalsEarTrainingMenu extends StatelessWidget {
  const IntervalsEarTrainingMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        appBar: AppBar(
          title: Text("Intervals"),
        ),
        child: Column(
          children: [
            ElevatedButton(
              child: const Text("Diatoniques"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ExercicePage(
                      title: "Intervals Diatonique",
                      exerciceType: ExerciceType.intervalsEarTraining,
                      modelTypes: INTERVALS
                          .where((interval) =>
                              interval.isDiatonic && interval.octave == 1)
                          .toList(),
                      playTypes: [PlayType.harmonic, PlayType.ascendant]),
                ));
              },
            ),
            ElevatedButton(
              child: const Text("Arpège"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ExercicePage(
                      title: "Intervals arpège",
                      exerciceType: ExerciceType.intervalsEarTraining,
                      modelTypes: INTERVALS
                          .where((interval) =>
                              interval.isArpegio && interval.octave == 1)
                          .toList(),
                      playTypes: [PlayType.harmonic, PlayType.ascendant]),
                ));
              },
            )
          ],
        ));
  }
}
