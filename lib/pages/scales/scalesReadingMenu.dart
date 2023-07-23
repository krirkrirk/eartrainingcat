import 'package:eartraining/buttons/menuButton.dart';
import 'package:eartraining/exercices/readingExercice.dart';
import 'package:eartraining/menu/menuContainer.dart';
import 'package:eartraining/models/intervals/interval.dart';
import 'package:eartraining/models/intervals/intervalStructure.dart';
import 'package:eartraining/models/scales/scale.dart';
import 'package:eartraining/models/scales/scaleStructure.dart';
import 'package:flutter/cupertino.dart' hide Interval;

class ScalesReadingMenu extends StatelessWidget {
  const ScalesReadingMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuContainer(
      appBarTitle: "Gammes",
      title: "Types de gamme",
      image: "assets/images/double_croche.png",
      buttons: [
        MenuButton(
            text: "Majeure et mineure",
            target: ReadingExercice<Scale, ScaleStructure>(
              questionsNumber: 3,
              title: "Majeure et mineure",
              answersGrid: const [
                [
                  {"label": "Majeure", "id": "diato-1"},
                  {"label": "Mineure", "id": "diato-6"},
                ]
              ],
            )),
        MenuButton(
            text: "Mineure dérivées",
            target: ReadingExercice<Scale, ScaleStructure>(
              questionsNumber: 3,
              title: "Mineure dérivées",
              answersGrid: const [
                [
                  {"id": "diato-2", "label": "Dorien"},
                  {"id": "diato-3", "label": "Phrygien"},
                  {"id": "diato-6", "label": "Aéloien"},
                ]
              ],
            )),
        MenuButton(
            text: "Toutes les gammes",
            target: ReadingExercice<Scale, ScaleStructure>(
              questionsNumber: 3,
              title: "Toutes les gammes",
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
            )),
      ],
    );
  }
}
