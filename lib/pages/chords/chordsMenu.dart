import 'package:eartraining/buttons/menuButton.dart';
import 'package:eartraining/menu/menuContainer.dart';
import 'package:eartraining/pages/chords/chordsEarTrainingMenu.dart';
import 'package:flutter/cupertino.dart';

class ChordsMenu extends StatelessWidget {
  const ChordsMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuContainer(
      appBarTitle: "Accords",
      title: "Type d'exercice",
      image: "assets/images/chord_menu.png",
      buttons: [
        MenuButton(text: "Ear training", target: ChordsEarTrainingMenu()),
      ],
    );
  }
}
