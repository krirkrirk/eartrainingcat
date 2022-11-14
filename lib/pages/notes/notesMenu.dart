import 'package:eartraining/buttons/menuButton.dart';
import 'package:eartraining/menu/menuContainer.dart';
import 'package:eartraining/pages/notes/gClefMenu.dart';
import 'package:flutter/material.dart';

class NotesMenu extends StatelessWidget {
  const NotesMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuContainer(
      appBarTitle: "Lecture musicale",
      buttons: [
        MenuButton(text: "Clef de sol", target: GClefMenu()),
        // MenuButton(text: "Clef de fa", target: target),
        // MenuButton(text: "Clef d'UT", target: target),
        // MenuButton(text: "Oreille absolue", target: target),
      ],
      image: "../../../assets/images/note_menu.png",
      title: "Types de clef",
    );
  }
}
