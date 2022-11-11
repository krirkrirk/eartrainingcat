import 'package:eartraining/models/intervals/intervalType.dart';
import 'package:eartraining/models/notes/note.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/models/theoricModel.dart';
import 'package:flutter/cupertino.dart';

class Interval implements TheoricModel<IntervalType> {
  @override
  IntervalType type;
  @override
  NotesCollection notesCollection;
  @override
  Note root;

  Interval({required this.type, required this.notesCollection})
      : root = notesCollection.notes[0];
  @override
  String toString() {
    return type.toString() + notesCollection.toString();
  }

  @override
  play(playType) {
    notesCollection.play(playType: playType);
  }

  @override
  stop() {
    notesCollection.stop();
  }
}
