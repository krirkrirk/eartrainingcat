import 'package:eartraining/models/intervals/intervalStructure.dart';
import 'package:eartraining/models/model.dart';
import 'package:eartraining/models/notes/note.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/models/absoluteModel.dart';
import 'package:flutter/cupertino.dart';

class Interval implements Model<IntervalStructure> {
  @override
  IntervalStructure structure;
  @override
  NotesCollection notesCollection;
  @override
  Note bass;

  Interval({required this.structure, required this.notesCollection})
      : bass = notesCollection.notes[0];
  @override
  String toString() {
    return structure.toString() + notesCollection.toString();
  }

  @override
  play(playType) {
    notesCollection.play(playType: playType);
  }

  @override
  stop() {
    notesCollection.stop();
  }

  @override
  List<List<Note>> getSheetData(bool isHarmonic) {
    return notesCollection.getSheetData(isHarmonic);
  }
}
