import 'package:eartraining/models/chords/chordType.dart';
import 'package:eartraining/models/notes/note.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/models/scales/scaleType.dart';
import 'package:flutter/cupertino.dart';

class Scale {
  ScaleType type;
  NotesCollection notesCollection;
  String name;
  Scale({required this.type, required this.notesCollection})
      : name = notesCollection.notes[0].name + type.label;

  play([playType]) {
    notesCollection.play(playType: playType);
    debugPrint(toString());
  }

  // getMode(int degree) {
  //   var modeStructure = type.getModeStructure(degree);
  //   debugPrint(modeStructure.toString());
  //   debugPrint(NotesCollection.fromRootAndStructure(
  //           notesCollection.notes[0], modeStructure)
  //       .toString());
  // }

  @override
  String toString() {
    return notesCollection.toString();
  }
}