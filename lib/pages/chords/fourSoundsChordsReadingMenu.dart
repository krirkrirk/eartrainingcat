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

class FourSoundsChordsReadingMenu extends StatelessWidget {
  const FourSoundsChordsReadingMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuContainer(
      appBarTitle: "Accords",
      title: "Types d'accord",
      image: "assets/images/double_croche.png",
      buttons: [
        MenuButton(
            text: "Septièmes majeures",
            target: ReadingExercice<Chord, ChordStructure>(
              questionsNumber: 3,
              title: "Septièmes majeures",
              answersGrid: const [
                [
                  {"id": "7M", "label": "Majeur"},
                  {"id": "7", "label": "Dominante"},
                ],
              ],
            )),
        MenuButton(
            text: "Accords mineurs",
            target: ReadingExercice<Chord, ChordStructure>(
              questionsNumber: 3,
              title: "Accords mineurs",
              answersGrid: const [
                [
                  {"id": "m7", "label": "m7"},
                  {"id": "o7", "label": "Diminué"},
                  {"id": "m7b5", "label": "m7b5"},
                ],
              ],
            )),
        MenuButton(
            text: "Tous les accords 4 sons",
            target: ReadingExercice<Chord, ChordStructure>(
              questionsNumber: 3,
              title: "Tous les accords 4 sons",
              modelStructures: CHORDS
                  .where((element) =>
                      element.numberOfSounds == 4 && element.inversion == 0)
                  .toList(),
            )),
      ],
    );
  }
}
