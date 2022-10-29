//widget, recoit les types d'intervalles, la facon de lire (ascend/descend/harmo),
// en prend un au pif, le lit,
// affiche les choix parmi tous les types

import 'package:eartraining/interval.dart';
import 'package:eartraining/intervalType.dart';
import 'package:eartraining/utilities/randomFrom.dart';
import 'package:flutter/material.dart' hide Interval;

class IntervalsEarTrainingExercice extends StatefulWidget {
  List<IntervalType> intervalTypes;
  List<PlayType> playTypes;

  IntervalsEarTrainingExercice(
      {Key? key, required this.intervalTypes, required this.playTypes})
      : super(key: key);

  @override
  _IntervalsEarTrainingExerciceState createState() =>
      _IntervalsEarTrainingExerciceState();
}

class _IntervalsEarTrainingExerciceState
    extends State<IntervalsEarTrainingExercice> {
  Interval? interval;
  PlayType? playType;
  bool? rightAnswer;
  @override
  void initState() {
    super.initState();
    setNewQuestion();
  }

  void setNewQuestion() {
    var intervalType = randomFrom(widget.intervalTypes);
    setState(() {
      interval = intervalType.getRandomInterval();
      playType = randomFrom(widget.playTypes);
      rightAnswer = null;
    });
  }

  void onClick(id) {
    setState(() {
      rightAnswer = interval!.type.id == id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      OutlinedButton(
        child: const Text("Play"),
        onPressed: () {
          interval!.play(playType: playType!);
        },
      ),
      ...widget.intervalTypes.map(
        (e) => OutlinedButton(
            onPressed: () {
              onClick(e.id);
            },
            child: Text(e.label)),
      ),
      if (rightAnswer == true) Text("Oui !"),
      if (rightAnswer == false) Text("Non"),
      OutlinedButton(onPressed: setNewQuestion, child: const Text("Next"))
    ]);
  }
}
