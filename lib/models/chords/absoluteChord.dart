import 'package:eartraining/models/chords/chordStructure.dart';
import 'package:eartraining/models/notes/absoluteNote.dart';
import 'package:eartraining/models/notes/absoluteNotesCollection.dart';
import 'package:eartraining/models/absoluteModel.dart';
import 'package:flutter/cupertino.dart';

class AbsoluteChord implements AbsoluteModel<ChordStructure> {
  @override
  ChordStructure structure;
  @override
  AbsoluteNotesCollection absoluteNotesCollection;
  String name;
  @override
  AbsoluteNote root;
  @override
  String? id;
  AbsoluteChord(
      {required this.structure, required this.absoluteNotesCollection})
      : name = absoluteNotesCollection.absoluteNotes[0].id + structure.id,
        root = absoluteNotesCollection.absoluteNotes[0];

  @override
  String toString() {
    return absoluteNotesCollection.absoluteNotes[0].id + structure.id;
  }
}
