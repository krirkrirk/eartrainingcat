import 'package:eartraining/buttons/menuButton.dart';
import 'package:eartraining/exercices/exercicePage.dart';
import 'package:eartraining/menu/menuContainer.dart';
import 'package:eartraining/models/chords/chordType.dart';
import 'package:eartraining/exercices/chordsEarTrainingExercice.dart';
import 'package:eartraining/models/intervals/interval.dart';
import 'package:eartraining/models/intervals/intervalType.dart';
import 'package:eartraining/exercices/intervalsEarTrainingExercice.dart';
import 'package:eartraining/mainScaffold.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChordsEarTrainingMenu extends StatelessWidget {
  const ChordsEarTrainingMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuContainer(
      appBarTitle: "Accords",
      buttons: [
        MenuButton(
          text: "Majeur & mineur",
          target: ExercicePage(
              title: "Majeur & mineur",
              exerciceType: ExerciceType.chordsEarTraining,
              answersGrid: const [
                [
                  {"id": "", "label": "Majeur"},
                  {"id": "m", "label": "Mineur"},
                ],
              ],
              playTypes: const [
                PlayType.ascendant
              ]),
        ),
      ],
      image: "../../assets/images/doubleCroche.png",
      title: "Types d'accords",
    );
  }
}
