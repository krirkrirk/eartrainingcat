import 'package:eartraining/models/chords/chordType.dart';
import 'package:eartraining/models/notes/note.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/models/scales/scaleType.dart';
import 'package:eartraining/models/theoricModel.dart';
import 'package:flutter/cupertino.dart';

class Scale implements TheoricModel<ScaleType> {
  @override
  ScaleType type;
  @override
  NotesCollection notesCollection;

  String name;
  @override
  Note root;
  Scale({required this.type, required this.notesCollection})
      : name = notesCollection.notes[0].id + type.label,
        root = notesCollection.notes[0];

  @override
  play(playType) {
    notesCollection.play(playType: playType);
    debugPrint(toString());
  }

  @override
  stop() {
    notesCollection.stop();
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
