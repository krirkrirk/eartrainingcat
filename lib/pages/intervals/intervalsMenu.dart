import 'package:eartraining/buttons/menuButton.dart';
import 'package:eartraining/exercices/basicEarTrainingExercice.dart';
import 'package:eartraining/menu/menuContainer.dart';
import 'package:eartraining/models/intervals/interval.dart';
import 'package:eartraining/models/intervals/intervalStructure.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/pages/intervals/intervalsEarTrainingMenu.dart';
import 'package:eartraining/pages/intervals/intervalsReadingMenu.dart';
import 'package:flutter/cupertino.dart' hide Interval;

class IntervalsMenu extends StatelessWidget {
  const IntervalsMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuContainer(
        appBarTitle: "Intervalles",
        title: "Type d'exerice",
        image: "../../../assets/images/double_croche.png",
        buttons: [
          MenuButton(text: "Ear training", target: IntervalsEarTrainingMenu()),
          MenuButton(text: "Lecture", target: IntervalsReadingMenu())
        ]);
  }
}
