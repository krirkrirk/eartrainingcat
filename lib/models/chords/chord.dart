import 'package:eartraining/models/chords/chordType.dart';
import 'package:eartraining/models/notes/note.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/models/theoricModel.dart';
import 'package:flutter/cupertino.dart';

class Chord implements TheoricModel<ChordType> {
  @override
  ChordType type;
  @override
  NotesCollection notesCollection;
  String name;
  @override
  Note root;

  Chord({required this.type, required this.notesCollection})
      : name = notesCollection.notes[0].id + type.id,
        root = notesCollection.notes[0];

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
  String toString() {
    return notesCollection.notes[0].id + type.id;
  }
}
