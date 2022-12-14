import 'package:eartraining/models/chords/chordStructure.dart';
import 'package:eartraining/models/model.dart';
import 'package:eartraining/models/notes/note.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/models/scales/scaleStructure.dart';
import 'package:eartraining/models/absoluteModel.dart';
import 'package:flutter/cupertino.dart';

class Scale implements Model<ScaleStructure> {
  @override
  ScaleStructure structure;
  @override
  NotesCollection notesCollection;
  String name;
  @override
  Note bass;
  Scale({required this.structure, required this.notesCollection})
      : name = notesCollection.notes[0].id + structure.label,
        bass = notesCollection.notes[0];

  @override
  play(playType) {
    notesCollection.play(playType: playType);
    debugPrint(toString());
  }

  @override
  stop() {
    notesCollection.stop();
  }

  @override
  List<List<Note>> getSheetData(bool isHarmlonic) {
    return notesCollection.getSheetData(false);
  }

  @override
  String toString() {
    return notesCollection.toString();
  }
}
