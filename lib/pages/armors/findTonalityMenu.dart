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
      image: "assets/images/armor_menu.png",
      buttons: [
        MenuButton(
          text: "Tonalités majeures (dièses)",
          target: TonalityReadingExercice(
            title: "Tonalités majeures (dièses)",
            questionsNumber: 3,
            tonalities: TONALITIES
                .where((element) =>
                    !element.isMinor && element.armor.alteration > 0)
                .toList(),
          ),
        ),
        MenuButton(
          text: "Tonalités majeures (bémols)",
          target: TonalityReadingExercice(
            title: "Tonalités majeures (bémols)",
            questionsNumber: 3,
            tonalities: TONALITIES
                .where((element) =>
                    !element.isMinor && element.armor.alteration < 0)
                .toList(),
          ),
        ),
        MenuButton(
          text: "Tonalités majeures (toutes)",
          target: TonalityReadingExercice(
            title: "Tonalités majeures (toutes)",
            questionsNumber: 3,
            tonalities: TONALITIES
                .where((element) =>
                    !element.isMinor && element.armor.alteration != 0)
                .toList(),
          ),
        ),
        MenuButton(
          text: "Tonalités mineures (dièses)",
          target: TonalityReadingExercice(
            title: "Tonalités mineures (dièses)",
            questionsNumber: 3,
            tonalities: TONALITIES
                .where((element) =>
                    element.isMinor && element.armor.alteration > 0)
                .toList(),
          ),
        ),
        MenuButton(
          text: "Tonalités mineures (bémols)",
          target: TonalityReadingExercice(
            title: "Tonalités mineures (bémols)",
            questionsNumber: 3,
            tonalities: TONALITIES
                .where((element) =>
                    element.isMinor && element.armor.alteration < 0)
                .toList(),
          ),
        ),
        MenuButton(
          text: "Tonalités mineures (toutes)",
          target: TonalityReadingExercice(
            title: "Tonalités mineures (toutes)",
            questionsNumber: 3,
            tonalities: TONALITIES
                .where((element) =>
                    element.isMinor && element.armor.alteration != 0)
                .toList(),
          ),
        ),
      ],
    );
  }
}
