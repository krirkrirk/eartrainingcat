import 'package:eartraining/intervals/intervalType.dart';
import 'package:eartraining/notes/note.dart';
import 'package:eartraining/notes/notesCollection.dart';
import 'package:flutter/cupertino.dart';

class Interval {
  IntervalType type;
  NotesCollection notesCollection;

  Interval({required this.type, required this.notesCollection});

  @override
  String toString() {
    return type.toString() + notesCollection.toString();
  }

  play([playType]) {
    notesCollection.play(playType: playType);
  }
}
