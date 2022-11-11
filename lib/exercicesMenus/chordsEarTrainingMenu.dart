import 'package:eartraining/buttons/menuButton.dart';
import 'package:eartraining/exercices/basicEarTrainingExercice.dart';

import 'package:eartraining/menu/menuContainer.dart';
import 'package:eartraining/models/chords/chord.dart';
import 'package:eartraining/models/chords/chordType.dart';
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
          target: BasicEarTrainingExercice<ChordType, Chord>(
              title: "Majeur & mineur",
              questionsNumber: 3,
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
        MenuButton(
          text: "Accords majeur renversés",
          target: BasicEarTrainingExercice<ChordType, Chord>(
              title: "Accord majeur renversé 3 sons",
              questionsNumber: 3,
              answersGrid: const [
                [
                  {"id": "", "label": "EF"},
                  {"id": ":1", "label": "1e"},
                  {"id": ":2", "label": "2e"},
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
