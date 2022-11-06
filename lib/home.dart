import 'package:eartraining/exercicesMenus/chordsEarTrainingMenu.dart';
import 'package:eartraining/exercicesMenus/intervalsEarTrainingMenu.dart';
import 'package:eartraining/exercicesMenus/scalesEarTrainingMenu.dart';
import 'package:eartraining/mainScaffold.dart';
import 'package:eartraining/menu/menuContainer.dart';
import 'package:eartraining/buttons/menuButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuContainer(
      appBarTitle: "Musical Training Cat",
      image: "../assets/images/notes.png",
      title: "Miaou !",
      buttons: [
        MenuButton(text: "Intervalles", target: IntervalsEarTrainingMenu()),
        MenuButton(text: "Accords", target: ChordsEarTrainingMenu()),
        MenuButton(text: "Gammes", target: ScalesEarTrainingMenu()),
      ],
    );
  }
}
