import 'package:eartraining/exercicesMenus/chordsEarTrainingMenu.dart';
import 'package:eartraining/exercicesMenus/intervalsEarTrainingMenu.dart';
import 'package:eartraining/exercicesMenus/scalesEarTrainingMenu.dart';
import 'package:eartraining/mainScaffold.dart';
import 'package:eartraining/menuButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        appBar: AppBar(
          title: Text("Musical Training Cat"),
        ),
        child: Column(
          children: [
            Image.asset("../assets/images/notes.png"),
            MenuButton(text: "Intervalles", target: IntervalsEarTrainingMenu()),
            MenuButton(text: "Accords", target: ChordsEarTrainingMenu()),
            MenuButton(text: "Gammes", target: ScalesEarTrainingMenu()),
            Image.asset("../assets/images/cat.png")
          ],
        ));
  }
}
