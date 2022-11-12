import 'package:eartraining/exercices/basicEarTrainingExercice.dart';

import 'package:eartraining/models/intervals/interval.dart';
import 'package:eartraining/models/intervals/intervalStructure.dart';
import 'package:eartraining/menu/menuContainer.dart';
import 'package:eartraining/buttons/menuButton.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:flutter/material.dart' hide Interval;

class IntervalsEarTrainingMenu extends StatelessWidget {
  const IntervalsEarTrainingMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuContainer(
      appBarTitle: "Intervalles",
      buttons: [
        MenuButton(
          text: "Diatoniques",
          target: BasicEarTrainingExercice<IntervalStructure>(
              title: "Intervals Diatonique",
              questionsNumber: 3,
              answersGrid: const [
                ["2", "3", "4", "5"],
                ["6", "7", "8"]
              ],
              playTypes: const [
                PlayType.ascendant
              ]),
        ),
        MenuButton(
          text: "Arpège",
          target: BasicEarTrainingExercice<IntervalStructure>(
              title: "Notes de l'arpège",
              questionsNumber: 3,
              answersGrid: const [
                ["3m", "3", "5-", "5"],
                [
                  "7m",
                  "7",
                  {"id": "8", "label": "prout"}
                ]
              ],
              playTypes: const [
                PlayType.harmonic,
                PlayType.ascendant
              ]),
        ),
        MenuButton(
          text: "Chromatic",
          target: BasicEarTrainingExercice<IntervalStructure>(
              title: "Chromatique",
              questionsNumber: 3,
              answersGrid: const [
                ["2m", "2", null, "3m", "3"],
                ["4", null, "5-", "5"],
                ["6m", "6", null, "7m", "7"],
                ["8"]
              ],
              playTypes: const [
                PlayType.harmonic,
                PlayType.ascendant
              ]),
        )
      ],
      image: "../../assets/images/doubleCroche.png",
      title: "Types d'intervalles",
    );
  }
}
