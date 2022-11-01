import 'package:eartraining/intervals/interval.dart';
import 'package:eartraining/intervals/intervalType.dart';
import 'package:eartraining/exercices/intervalsEarTrainingExercice.dart';
import 'package:eartraining/notes/notesCollection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntervalsEarTrainingMenu extends StatelessWidget {
  const IntervalsEarTrainingMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Intervals"),
        ),
        body: Column(
          children: [
            ElevatedButton(
              child: const Text("Diatoniques"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => IntervalsEarTrainingExercice(
                        intervalTypes: INTERVALS
                            .where((interval) => interval.isDiatonic)
                            .toList(),
                        playTypes: [PlayType.harmonic, PlayType.ascendant]),
                  ),
                );
              },
            )
          ],
        ));
  }
}
