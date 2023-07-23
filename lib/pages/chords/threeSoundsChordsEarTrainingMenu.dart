import 'package:eartraining/buttons/menuButton.dart';
import 'package:eartraining/exercices/basicEarTrainingExercice.dart';
import 'package:eartraining/exercices/chordEarTrainingMultiSelecteExercice.dart';
import 'package:eartraining/menu/menuContainer.dart';
import 'package:eartraining/models/chords/chord.dart';
import 'package:eartraining/models/chords/chordStructure.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/pages/chords/threeSoundsInversedChordsEarTrainingMenu.dart';
import 'package:flutter/cupertino.dart';

class ThreeSoundsChordsEarTrainingMenu extends StatelessWidget {
  const ThreeSoundsChordsEarTrainingMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuContainer(
      appBarTitle: "Accords",
      buttons: [
        MenuButton(
          text: "Majeur & mineur",
          target: BasicEarTrainingExercice<Chord, ChordStructure>(
              title: "3 sons | Majeur & mineur",
              questionsNumber: 3,
              answersGrid: const [
                [
                  {"id": "", "label": "Majeur"},
                  {"id": "m", "label": "Mineur"},
                ],
              ],
              playTypes: const [
                PlayType.harmonic
              ]),
        ),
        MenuButton(
          text: "Accords sus",
          target: BasicEarTrainingExercice<Chord, ChordStructure>(
              title: "3 sons | Accords sus",
              questionsNumber: 3,
              answersGrid: const [
                [
                  {"id": "sus2", "label": "sus2"},
                  {"id": "sus4", "label": "sus4"},
                ],
              ],
              playTypes: const [
                PlayType.harmonic
              ]),
        ),
        MenuButton(
          text: "Diminué & Augmenté",
          target: BasicEarTrainingExercice<Chord, ChordStructure>(
              title: "3 sons | dim & augm",
              questionsNumber: 3,
              answersGrid: const [
                [
                  {"id": "mb5", "label": "Dim"},
                  {"id": "augm", "label": "Augm"},
                ],
              ],
              playTypes: const [
                PlayType.harmonic
              ]),
        ),
        MenuButton(
            text: "Accords renversés",
            target: ThreeSoundsInversedChordsEarTrainingMenu()),
        MenuButton(
            text: "Tous les accords 3 sons",
            target: ChordEarTrainingMultiSelectExercice(
              questionsNumber: 3,
              title: "3 sons | Tous les accords",
              answersGrid: const [
                [
                  {"id": "2", "label": "sus2"},
                  "3m",
                  "3",
                  {"id": "4", "label": "sus4"},
                ],
                [
                  {"id": "5-", "label": "b5"},
                  "5",
                  "5+"
                ],
                [
                  {"id": "", "label": "EF"},
                  {"id": ":1", "label": "1er"},
                  {"id": ":2", "label": "2ème"},
                ]
              ],
              // candidateBasses: [],
              chordsStructures: CHORDS
                  .where((element) => element.numberOfSounds == 3)
                  .toList(),
            )),
      ],
      image: "assets/images/double_croche.png",
      title: "Types d'accords",
    );
  }
}
