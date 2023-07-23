import 'package:eartraining/buttons/menuButton.dart';
import 'package:eartraining/exercices/basicEarTrainingExercice.dart';
import 'package:eartraining/exercices/chordEarTrainingMultiSelecteExercice.dart';
import 'package:eartraining/menu/menuContainer.dart';
import 'package:eartraining/models/chords/chord.dart';
import 'package:eartraining/models/chords/chordStructure.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/pages/chords/threeSoundsInversedChordsEarTrainingMenu.dart';
import 'package:flutter/cupertino.dart';

class FourSoundsChordsEarTrainingMenu extends StatelessWidget {
  const FourSoundsChordsEarTrainingMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuContainer(
      appBarTitle: "Accords",
      buttons: [
        MenuButton(
          text: "Septièmes majeures",
          target: BasicEarTrainingExercice<Chord, ChordStructure>(
              title: "4 sons | Septièmes majeures",
              questionsNumber: 3,
              answersGrid: const [
                [
                  {"id": "7M", "label": "Majeur"},
                  {"id": "7", "label": "Dominante"},
                ],
              ],
              playTypes: const [
                PlayType.harmonic
              ]),
        ),
        MenuButton(
          text: "Accords mineurs",
          target: BasicEarTrainingExercice<Chord, ChordStructure>(
              title: "4 sons | accords mineurs",
              questionsNumber: 3,
              answersGrid: const [
                [
                  {"id": "m7", "label": "m7"},
                  {"id": "o7", "label": "Diminué"},
                  {"id": "m7b5", "label": "m7b5"},
                ],
              ],
              playTypes: const [
                PlayType.harmonic
              ]),
        ),
        MenuButton(
            text: "Tous les accords 4 sons",
            target: BasicEarTrainingExercice<Chord, ChordStructure>(
              questionsNumber: 3,
              title: "4 sons | Tous les accords",
              // answersGrid:
              // candidateBasses: [],
              modelStructures: CHORDS
                  .where((element) =>
                      element.numberOfSounds == 4 && element.inversion == 0)
                  .toList(),
              playTypes: const [PlayType.harmonic],
            )),
      ],
      image: "assets/images/double_croche.png",
      title: "Types d'accords",
    );
  }
}
