import 'package:eartraining/models/intervals/intervalStructure.dart';
import 'package:eartraining/models/model.dart';
import 'package:eartraining/models/notes/note.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/models/absoluteModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:eartraining/models/notes/absoluteNotesCollection.dart';
import 'package:eartraining/models/notes/note.dart';
import 'package:eartraining/models/notes/absoluteNote.dart';

class AbsoluteInterval implements AbsoluteModel<IntervalStructure> {
  @override
  IntervalStructure structure;
  @override
  AbsoluteNotesCollection absoluteNotesCollection;
  @override
  AbsoluteNote root;
  @override
  String? id;
  AbsoluteInterval(
      {required this.structure, required this.absoluteNotesCollection})
      : root = absoluteNotesCollection.absoluteNotes[0];
  @override
  String toString() {
    return structure.toString() + absoluteNotesCollection.toString();
  }
}
