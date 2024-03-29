import 'package:eartraining/models/chords/chordStructure.dart';
import 'package:eartraining/models/model.dart';
import 'package:eartraining/models/notes/note.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/models/absoluteModel.dart';
import 'package:flutter/cupertino.dart';

class Chord implements Model<ChordStructure> {
  @override
  ChordStructure structure;
  @override
  NotesCollection notesCollection;
  String name;
  @override
  Note bass;

  Chord({required this.structure, required this.notesCollection})
      : name = notesCollection.notes[0].id + structure.id,
        bass = notesCollection.notes[0];

  @override
  play(PlayType playType) {
    notesCollection.play(playType: playType);
    debugPrint(toString());
  }

  @override
  stop() {
    notesCollection.stop();
  }

  @override
  List<List<Note>> getSheetData(bool isHarmonic) {
    debugPrint("notesColl $notesCollection");
    return notesCollection.getSheetData(true);
  }

  @override
  String toString() {
    return notesCollection.notes[0].id + structure.id;
  }
}
