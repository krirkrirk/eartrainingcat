import 'package:eartraining/buttons/menuButton.dart';
import 'package:eartraining/exercices/tonalityWritingExercice.dart';
import 'package:eartraining/menu/menuContainer.dart';
import 'package:eartraining/models/scales/tonality.dart';
import 'package:flutter/cupertino.dart';

class FindArmorMenu extends StatelessWidget {
  const FindArmorMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuContainer(
      appBarTitle: "Armures",
      title: "Trouver l'armure",
      image: "../../../assets/images/armor_menu.png",
      buttons: [
        MenuButton(
          text: "Tonalité majeure",
          target: TonalityWritingExercice(
            title: "Tonalité majeure",
            questionsNumber: 3,
            tonalities:
                TONALITIES.where((element) => !element.isMinor).toList(),
            answersGrid: const [
              ["1#", "2#", "3#", "4#", "5#", "6#", "7#"],
              ["0"],
              ["1b", "2b", "3b", "4b", "5b", "6b", "7b"],
            ],
          ),
        ),
        MenuButton(
          text: "Tonalité mineure",
          target: TonalityWritingExercice(
            title: "Tonalité mineure",
            questionsNumber: 3,
            tonalities: TONALITIES.where((element) => element.isMinor).toList(),
            answersGrid: const [
              ["1#", "2#", "3#", "4#", "5#", "6#", "7#"],
              ["0"],
              ["1b", "2b", "3b", "4b", "5b", "6b", "7b"],
            ],
          ),
        ),
        MenuButton(
          text: "Toutes les tonalités",
          target: TonalityWritingExercice(
            title: "Toutes les tonalités",
            questionsNumber: 3,
            tonalities: TONALITIES.toList(),
            answersGrid: const [
              ["1#", "2#", "3#", "4#", "5#", "6#", "7#"],
              ["0"],
              ["1b", "2b", "3b", "4b", "5b", "6b", "7b"],
            ],
          ),
        ),
      ],
    );
  }
}
