import 'package:eartraining/buttons/menuButton.dart';
import 'package:eartraining/exercices/tonalityReadingExercice.dart';
import 'package:eartraining/menu/menuContainer.dart';
import 'package:eartraining/models/scales/tonality.dart';
import 'package:flutter/cupertino.dart';

class FindTonalityMenu extends StatelessWidget {
  const FindTonalityMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuContainer(
      title: "Trouver la tonalité",
      appBarTitle: "Armures",
      image: "../../../assets/images/armor_menu.png",
      buttons: [
        MenuButton(
          text: "Tonalité majeure",
          target: TonalityReadingExercice(
            title: "Tonalité Majeure",
            questionsNumber: 3,
            tonalities:
                TONALITIES.where((element) => !element.isMinor).toList(),
          ),
        ),
        MenuButton(
          text: "Tonalité mineure",
          target: TonalityReadingExercice(
            title: "Tonalité Mineure",
            questionsNumber: 3,
            tonalities: TONALITIES.where((element) => element.isMinor).toList(),
          ),
        ),
        MenuButton(
          text: "Toutes les tonalités",
          target: TonalityReadingExercice(
            title: "Toutes les tonalités",
            questionsNumber: 3,
            tonalities: TONALITIES,
          ),
        ),
      ],
    );
  }
}
