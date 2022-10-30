import 'package:eartraining/intervals/intervalType.dart';
import 'package:eartraining/notes/note.dart';
import 'package:eartraining/notes/notesCollection.dart';
import 'package:flutter/cupertino.dart';

class Interval {
  IntervalType type;
  NotesCollection notes;

  Interval({required this.type, required this.notes});

  @override
  String toString() {
    return type.toString() + notes.toString();
  }

  play([playType]) {
    notes.play(playType: playType);
  }
}
