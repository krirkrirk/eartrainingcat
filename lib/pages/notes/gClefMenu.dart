import 'package:eartraining/buttons/menuButton.dart';
import 'package:eartraining/exercices/noteReadingExercice.dart';
import 'package:eartraining/menu/menuContainer.dart';
import 'package:eartraining/models/notes/note.dart';
import 'package:flutter/material.dart';

class GClefMenu extends StatelessWidget {
  const GClefMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuContainer(
      appBarTitle: "Lecture musicale",
      image: "assets/images/note_menu.png",
      title: "Clef de sol",
      buttons: [
        MenuButton(
          text: "1 octave",
          target: NoteReadingExercice(
              title: "Toutes",
              questionsNumber: 3,
              notes: NOTES
                  .where((element) =>
                      element.absoluteNote.isChromatic && element.octave == 1)
                  .toList()),
        ),
        MenuButton(
          text: "Octave supérieure",
          target: NoteReadingExercice(
              title: "Toutes",
              questionsNumber: 3,
              notes: NOTES
                  .where((element) =>
                      element.absoluteNote.isChromatic && element.octave == 2)
                  .toList()),
        ),
        MenuButton(
          text: "Octave inférieure",
          target: NoteReadingExercice(
              title: "Toutes",
              questionsNumber: 3,
              notes: NOTES
                  .where((element) =>
                      element.absoluteNote.isChromatic && element.octave == 0)
                  .toList()),
        ),
        MenuButton(
          text: "3 octaves",
          target: NoteReadingExercice(
              title: "Toutes",
              questionsNumber: 3,
              notes: NOTES
                  .where((element) => element.absoluteNote.isChromatic)
                  .toList()),
        ),
      ],
    );
  }
}
