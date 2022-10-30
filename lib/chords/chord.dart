import 'package:eartraining/chords/chordType.dart';
import 'package:eartraining/notes/note.dart';
import 'package:eartraining/notes/notesCollection.dart';
import 'package:flutter/cupertino.dart';

class Chord {
  ChordType type;
  NotesCollection notesCollection;
  String name;
  Chord({required this.type, required this.notesCollection})
      : name = notesCollection.notes[0].name + type.id;

  play([playType]) {
    notesCollection.play(playType: playType);
    debugPrint(toString());
  }

  @override
  String toString() {
    return notesCollection.notes[0].name + type.id;
  }
}
