import 'package:eartraining/buttons/menuButton.dart';
import 'package:eartraining/exercices/basicEarTrainingExercice.dart';
import 'package:eartraining/menu/menuContainer.dart';
import 'package:eartraining/models/chords/chord.dart';
import 'package:eartraining/models/chords/chordStructure.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:flutter/cupertino.dart';

class ThreeSoundsInversedChordsEarTrainingMenu extends StatelessWidget {
  const ThreeSoundsInversedChordsEarTrainingMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuContainer(
      image: "assets/images/double_croche.png",
      title: "Accords 3 sons renversés",
      appBarTitle: "Accords",
      buttons: [
        MenuButton(
          text: "Majeurs",
          target: BasicEarTrainingExercice<Chord, ChordStructure>(
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
        MenuButton(
          text: "Mineur",
          target: BasicEarTrainingExercice<Chord, ChordStructure>(
              title: "3 sons renversé | mineur",
              questionsNumber: 3,
              answersGrid: const [
                [
                  {"id": "m", "label": "EF"},
                  {"id": "m:1", "label": "1e"},
                  {"id": "m:2", "label": "2e"},
                ],
              ],
              playTypes: const [
                PlayType.ascendant
              ]),
        ),
        MenuButton(
          text: "Diminué",
          target: BasicEarTrainingExercice<Chord, ChordStructure>(
              title: "3 sons renversé | Diminué",
              questionsNumber: 3,
              answersGrid: const [
                [
                  {"id": "mb5", "label": "EF"},
                  {"id": "mb5:1", "label": "1e"},
                  {"id": "mb5:2", "label": "2e"},
                ],
              ],
              playTypes: const [
                PlayType.ascendant
              ]),
        ),
        MenuButton(
          text: "Augmentés",
          target: BasicEarTrainingExercice<Chord, ChordStructure>(
              title: "3 sons renversé | Augmentés",
              questionsNumber: 3,
              answersGrid: const [
                [
                  {"id": "augm", "label": "EF"},
                  {"id": "augm:1", "label": "1e"},
                  {"id": "augm:2", "label": "2e"},
                ],
              ],
              playTypes: const [
                PlayType.ascendant
              ]),
        ),
      ],
    );
  }
}
