import 'package:eartraining/buttons/menuButton.dart';
import 'package:eartraining/exercices/readingExercice.dart';
import 'package:eartraining/menu/menuContainer.dart';
import 'package:eartraining/models/chords/chord.dart';
import 'package:eartraining/models/chords/chordStructure.dart';
import 'package:eartraining/models/intervals/interval.dart';
import 'package:eartraining/models/intervals/intervalStructure.dart';
import 'package:eartraining/models/scales/scale.dart';
import 'package:eartraining/models/scales/scaleStructure.dart';
import 'package:flutter/cupertino.dart' hide Interval;

class ThreeSoundsChordsReadingMenu extends StatelessWidget {
  const ThreeSoundsChordsReadingMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuContainer(
      appBarTitle: "Accords",
      title: "Types d'accord",
      image: "assets/images/double_croche.png",
      buttons: [
        MenuButton(
            text: "Majeurs et mineurs",
            target: ReadingExercice<Chord, ChordStructure>(
              questionsNumber: 3,
              title: "Majeurs et mineurs",
              answersGrid: const [
                [
                  {"label": "Majeur", "id": ""},
                  {"label": "Mineur", "id": "m"},
                ]
              ],
            )),
        MenuButton(
            text: "Accords sus",
            target: ReadingExercice<Chord, ChordStructure>(
              questionsNumber: 3,
              title: "Accords sus",
              answersGrid: const [
                [
                  {"label": "sus2", "id": "sus2"},
                  {"label": "sus4", "id": "sus4"},
                ]
              ],
            )),
        MenuButton(
            text: "Diminués & augmentés",
            target: ReadingExercice<Chord, ChordStructure>(
              questionsNumber: 3,
              title: "Diminués & augmentés",
              answersGrid: const [
                [
                  {"id": "Majb5", "label": "Dim"},
                  {"id": "augm", "label": "Augm"},
                ]
              ],
            )),
        MenuButton(
            text: "Tous les accords",
            target: ReadingExercice<Chord, ChordStructure>(
              questionsNumber: 3,
              title: "Tous les accords",
              modelStructures: CHORDS
                  .where((chord) =>
                      chord.numberOfSounds == 3 && chord.inversion == 0)
                  .toList(),
            )),
      ],
    );
  }
}
