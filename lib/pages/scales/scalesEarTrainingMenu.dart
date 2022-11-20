import 'package:eartraining/buttons/menuButton.dart';
import 'package:eartraining/exercices/basicEarTrainingExercice.dart';
import 'package:eartraining/menu/menuContainer.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/models/scales/scale.dart';
import 'package:eartraining/models/scales/scaleStructure.dart';
import 'package:flutter/cupertino.dart';

class ScalesEarTrainingMenu extends StatelessWidget {
  const ScalesEarTrainingMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuContainer(
      title: "Types de gammes",
      appBarTitle: "Gammes",
      image: "assets/images/gamme_menu.png",
      buttons: [
        MenuButton(
          text: "Majeure & Mineure",
          target: BasicEarTrainingExercice<Scale, ScaleStructure>(
              title: "Gammes Majeure & mineure",
              questionsNumber: 3,
              answersGrid: const [
                [
                  {"id": "diato-1", "label": "Majeure"},
                  {"id": "diato-6", "label": "Mineure"},
                ]
              ],
              playTypes: const [
                PlayType.ascendant
              ]),
        ),
        MenuButton(
          text: "Mineures dérivées",
          target: BasicEarTrainingExercice<Scale, ScaleStructure>(
              title: "Mineures dérivées",
              questionsNumber: 3,
              answersGrid: const [
                [
                  {"id": "diato-6", "label": "Naturelle"},
                  {"id": "G#-6", "label": "Harmonique"},
                  {"id": "Eb-1", "label": "Mélodique"},
                ]
              ],
              playTypes: const [
                PlayType.ascendant
              ]),
        ),
        MenuButton(
          text: "Modes majeurs",
          target: BasicEarTrainingExercice<Scale, ScaleStructure>(
              title: "Mineures dérivées",
              questionsNumber: 3,
              answersGrid: const [
                [
                  {"id": "diato-1", "label": "Ionien"},
                  {"id": "diato-4", "label": "Lydien"},
                  {"id": "diato-5", "label": "Mixolydien"},
                ]
              ],
              playTypes: const [
                PlayType.ascendant
              ]),
        ),
        MenuButton(
          text: "Modes mineurs",
          target: BasicEarTrainingExercice<Scale, ScaleStructure>(
              title: "Mineures dérivées",
              questionsNumber: 3,
              answersGrid: const [
                [
                  {"id": "diato-2", "label": "Dorien"},
                  {"id": "diato-3", "label": "Phrygien"},
                  {"id": "diato-6", "label": "Aéloien"},
                ]
              ],
              playTypes: const [
                PlayType.ascendant
              ]),
        ),
        MenuButton(
          text: "Tous les modes",
          target: BasicEarTrainingExercice<Scale, ScaleStructure>(
              title: "Tous les modes",
              questionsNumber: 3,
              answersGrid: const [
                [
                  {"id": "diato-1", "label": "Ionien"},
                  {"id": "diato-6", "label": "Aéolien"},
                ],
                [
                  {"id": "diato-2", "label": "Dorien"},
                  {"id": "diato-3", "label": "Phrygien"},
                  {"id": "diato-4", "label": "Lydien"},
                  {"id": "diato-5", "label": "Mixolydien"},
                ],
                [
                  {"id": "diato-7", "label": "Locrien"},
                  {"id": "G#-6", "label": "Harmonique"},
                  {"id": "Eb-1", "label": "Mélodique"},
                ]
              ],
              playTypes: const [
                PlayType.ascendant
              ]),
        ),
        MenuButton(
          text: "Toutes les gammes",
          target: BasicEarTrainingExercice<Scale, ScaleStructure>(
              title: "Toutes les gammes",
              questionsNumber: 3,
              modelStructures: SCALES,
              playTypes: const [PlayType.ascendant]),
        ),
      ],
    );
  }
}
