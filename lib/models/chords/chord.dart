import 'package:eartraining/models/chords/chordType.dart';
import 'package:eartraining/models/notes/note.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:flutter/cupertino.dart';

class Chord {
  ChordType type;
  NotesCollection notesCollection;
  String name;
  Note root;

  Chord({required this.type, required this.notesCollection})
      : name = notesCollection.notes[0].name + type.id,
        root = notesCollection.notes[0];

  play([playType]) {
    notesCollection.play(playType: playType);
    debugPrint(toString());
  }

  @override
  String toString() {
    return notesCollection.notes[0].name + type.id;
  }
}
