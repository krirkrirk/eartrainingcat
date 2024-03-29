import 'package:eartraining/buttons/menuButton.dart';
import 'package:eartraining/exercices/readingExercice.dart';
import 'package:eartraining/menu/menuContainer.dart';
import 'package:eartraining/models/intervals/interval.dart';
import 'package:eartraining/models/intervals/intervalStructure.dart';
import 'package:flutter/cupertino.dart' hide Interval;

class IntervalsReadingMenu extends StatelessWidget {
  const IntervalsReadingMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuContainer(
      appBarTitle: "Intervalles",
      title: "Types d'intervalles",
      image: "assets/images/double_croche.png",
      buttons: [
        MenuButton(
            text: "1 octave diatonique asc",
            target: ReadingExercice<Interval, IntervalStructure>(
              questionsNumber: 3,
              title: "Diatonique asc",
              modelStructures: INTERVALS
                  .where((element) =>
                      element.isDiatonic &&
                      element.type < 9 &&
                      element.type != 1)
                  .toList(),
              answersGrid: const [
                [
                  {"id": "2", "label": "2nd"},
                  {"id": "3", "label": "3rce"},
                  {"id": "4", "label": "4rte"},
                  {"id": "5", "label": "5te"},
                ],
                [
                  {"id": "6", "label": "6xte"},
                  {"id": "7", "label": "7ème"},
                  {"id": "8", "label": "Oct"},
                ]
              ],
            )),
        MenuButton(
            text: "1 octave diatonique desc",
            target: ReadingExercice<Interval, IntervalStructure>(
              questionsNumber: 3,
              title: "Diatonique desc",
              modelStructures: INTERVALS
                  .where((element) =>
                      element.isDiatonic &&
                      element.isDescendant &&
                      element.type < 9 &&
                      element.type != 1)
                  .toList(),
              answersGrid: const [
                [
                  {"id": "2D", "label": "2nd"},
                  {"id": "3D", "label": "3rce"},
                  {"id": "4D", "label": "4rte"},
                  {"id": "5D", "label": "5te"},
                ],
                [
                  {"id": "6D", "label": "6xte"},
                  {"id": "7D", "label": "7ème"},
                  {"id": "8D", "label": "Oct"},
                ]
              ],
            )),
      ],
    );
  }
}
