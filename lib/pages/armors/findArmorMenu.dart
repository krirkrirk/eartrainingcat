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
      image: "assets/images/armor_menu.png",
      buttons: [
        MenuButton(
          text: "Tonalité majeure (dièses)",
          target: TonalityWritingExercice(
            title: "Tonalité majeure (dièses)",
            questionsNumber: 3,
            tonalities: TONALITIES
                .where((element) =>
                    !element.isMinor && element.armor.alteration > 0)
                .toList(),
          ),
        ),
        MenuButton(
          text: "Tonalité majeure (bémols)",
          target: TonalityWritingExercice(
            title: "Tonalité majeure (bémols)",
            questionsNumber: 3,
            tonalities: TONALITIES
                .where((element) =>
                    !element.isMinor && element.armor.alteration < 0)
                .toList(),
          ),
        ),
        MenuButton(
          text: "Tonalité majeure (toutes)",
          target: TonalityWritingExercice(
            title: "Tonalité majeure (toutes)",
            questionsNumber: 3,
            tonalities: TONALITIES
                .where((element) =>
                    !element.isMinor && element.armor.alteration != 0)
                .toList(),
          ),
        ),
        MenuButton(
          text: "Tonalités mineures  (dièses)",
          target: TonalityWritingExercice(
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
          target: TonalityWritingExercice(
            title: "Tonalités mineures (bémols)",
            questionsNumber: 3,
            tonalities: TONALITIES
                .where((element) =>
                    element.isMinor && element.armor.alteration > 0)
                .toList(),
          ),
        ),
        MenuButton(
          text: "Tonalités mineures (toutes)",
          target: TonalityWritingExercice(
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
