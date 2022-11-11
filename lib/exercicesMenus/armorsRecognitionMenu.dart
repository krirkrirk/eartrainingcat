import 'package:eartraining/buttons/menuButton.dart';
import 'package:eartraining/exercices/armorsRecognitionExercice.dart';
import 'package:eartraining/menu/menuContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArmorsRecognitionMenu extends StatelessWidget {
  const ArmorsRecognitionMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuContainer(
      appBarTitle: "Armures",
      buttons: [
        MenuButton(
          text: "Tonalité Majeure",
          target: ArmorsRecognitionExercice(
            title: "Tonalité Majeure",
            questionsNumber: 3,
            answersGrid: const [
              [
                {"id": "0", "label": "C"},
                {"id": "2#", "label": "D"},
              ],
            ],
          ),
        ),
        MenuButton(
          text: "Tonalité Mineure",
          target: ArmorsRecognitionExercice(
            title: "Tonalité Mineure",
            questionsNumber: 3,
            answersGrid: const [
              ["1#", "2#", "3#", "4#", "5#", "6#", "7#"],
              ["0"],
              ["1b", "2b", "3b", "4b", "5b", "6b", "7b"],
            ],
          ),
        ),
      ],
      image: "../../assets/images/doubleCroche.png",
      title: "Armures",
    );
  }
}
