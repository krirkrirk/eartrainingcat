import 'package:eartraining/buttons/menuButton.dart';
import 'package:eartraining/menu/menuContainer.dart';
import 'package:eartraining/pages/scales/scalesEarTrainingMenu.dart';
import 'package:eartraining/pages/scales/scalesReadingMenu.dart';
import 'package:flutter/cupertino.dart';

class ScalesMenu extends StatelessWidget {
  const ScalesMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuContainer(
      appBarTitle: "Gammes",
      title: "Type d'exercice",
      image: "../../../assets/images/gamme_menu.png",
      buttons: [
        MenuButton(text: "Ear training", target: ScalesEarTrainingMenu()),
        MenuButton(text: "Lecture", target: ScalesReadingMenu()),
      ],
    );
  }
}
