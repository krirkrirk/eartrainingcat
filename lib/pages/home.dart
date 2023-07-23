import 'package:eartraining/mainScaffold.dart';
import 'package:eartraining/menu/menuContainer.dart';
import 'package:eartraining/buttons/menuButton.dart';
import 'package:eartraining/pages/armors/armorMenu.dart';
import 'package:eartraining/pages/chords/chordsEarTrainingMenu.dart';
import 'package:eartraining/pages/chords/chordsMenu.dart';
import 'package:eartraining/pages/intervals/intervalsMenu.dart';
import 'package:eartraining/pages/notes/notesMenu.dart';
import 'package:eartraining/pages/scales/scalesMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuContainer(
      appBarTitle: "Musical Training Cat",
      image: "assets/images/notes.png",
      title: "Miaou !",
      buttons: [
        MenuButton(text: "Armures", target: ArmorMenu()),
        MenuButton(text: "Notes", target: NotesMenu()),
        MenuButton(text: "Intervalles", target: IntervalsMenu()),
        MenuButton(text: "Accords", target: ChordsMenu()),
        MenuButton(text: "Gammes", target: ScalesMenu()),
      ],
    );
  }
}
