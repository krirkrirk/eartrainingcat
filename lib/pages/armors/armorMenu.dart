import 'package:eartraining/buttons/menuButton.dart';
import 'package:eartraining/menu/menuContainer.dart';
import 'package:eartraining/pages/armors/findArmorMenu.dart';
import 'package:eartraining/pages/armors/findTonalityMenu.dart';
import 'package:flutter/cupertino.dart';

class ArmorMenu extends StatelessWidget {
  const ArmorMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuContainer(
      appBarTitle: "Armures",
      title: "Types d'exercice",
      image: "assets/images/armor_menu.png",
      buttons: [
        MenuButton(text: "Trouver la tonalité", target: FindTonalityMenu()),
        MenuButton(text: "Trouver l'armure", target: FindArmorMenu())
      ],
    );
  }
}
