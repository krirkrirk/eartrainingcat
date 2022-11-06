import 'package:eartraining/exercices/exercicePage.dart';
import 'package:eartraining/models/intervals/interval.dart';
import 'package:eartraining/models/intervals/intervalType.dart';
import 'package:eartraining/exercices/intervalsEarTrainingExercice.dart';
import 'package:eartraining/mainScaffold.dart';
import 'package:eartraining/menu/menuContainer.dart';
import 'package:eartraining/buttons/menuButton.dart';
import 'package:eartraining/models/models.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntervalsEarTrainingMenu extends StatelessWidget {
  const IntervalsEarTrainingMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuContainer(
      appBarTitle: "Intervalles",
      buttons: [
        MenuButton(
          text: "Diatoniques",
          target: ExercicePage(
              title: "Intervals Diatonique",
              exerciceType: ExerciceType.intervalsEarTraining,
              answersGrid: const [
                ["2", "3", "4", "5"],
                ["6", "7", "8"]
              ],
              playTypes: const [
                PlayType.harmonic,
                PlayType.ascendant
              ]),
        ),
        MenuButton(
          text: "Arpège",
          target: ExercicePage(
              title: "Notes de l'arpège",
              exerciceType: ExerciceType.intervalsEarTraining,
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
          target: ExercicePage(
              title: "Chromatique",
              exerciceType: ExerciceType.intervalsEarTraining,
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
