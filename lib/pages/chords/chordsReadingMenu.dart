import 'package:eartraining/buttons/menuButton.dart';
import 'package:eartraining/exercices/basicEarTrainingExercice.dart';
import 'package:eartraining/menu/menuContainer.dart';
import 'package:eartraining/models/chords/chord.dart';
import 'package:eartraining/models/chords/chordStructure.dart';
import 'package:eartraining/models/intervals/interval.dart';
import 'package:eartraining/models/intervals/intervalStructure.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/pages/chords/fourSoundsChordsEarTrainingMenu.dart';
import 'package:eartraining/pages/chords/fourSoundsChordsReadingMenu.dart';
import 'package:eartraining/pages/chords/threeSoundsChordsEarTrainingMenu.dart';
import 'package:eartraining/pages/chords/threeSoundsChordsReadingMenu.dart';
import 'package:eartraining/pages/chords/threeSoundsInversedChordsEarTrainingMenu.dart';
import 'package:flutter/cupertino.dart' hide Interval;

class ChordsReadingMenu extends StatelessWidget {
  const ChordsReadingMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuContainer(
        appBarTitle: "Accords",
        image: "assets/images/chord_menu.png",
        title: "Type d'accord",
        buttons: [
          MenuButton(text: "3 sons", target: ThreeSoundsChordsReadingMenu()),
          MenuButton(text: "4 sons", target: FourSoundsChordsReadingMenu()),
        ]);
  }
}
