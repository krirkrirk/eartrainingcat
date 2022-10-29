import 'package:eartraining/intervalType.dart';
import 'package:eartraining/note.dart';
import 'package:flutter/cupertino.dart';

enum PlayType { harmonic, ascendant, descendant }

class Interval {
  IntervalType type;
  List<Note> notes;

  Interval({required this.type, required this.notes});

  @override
  String toString() {
    return "(${notes[0].toString()}, ${notes[1].toString()})";
  }

  void play({PlayType playType = PlayType.ascendant}) {
    switch (playType) {
      case PlayType.harmonic:
        notes[0].play();
        notes[1].play();
        break;
      case PlayType.descendant:
        var player1 = notes[1].play();
        player1.onPlayerComplete.listen((event) {
          notes[0].play();
        });
        break;
      case PlayType.ascendant:
        var player1 = notes[0].play();
        player1.onPlayerComplete.listen((event) {
          notes[1].play();
        });
        break;
    }
  }
}
