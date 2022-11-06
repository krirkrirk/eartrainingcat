import 'package:eartraining/models/intervals/intervalType.dart';
import 'package:eartraining/models/notes/note.dart';
import 'package:flutter/cupertino.dart';

enum PlayType { harmonic, ascendant, descendant }

class NotesCollection {
  List<Note> notes = [];
  NotesCollection({required this.notes});

  NotesCollection.fromRootAndStructure(
      Note root, List<IntervalType> intervals) {
    for (var interval in intervals) {
      notes.add(interval.getSecondNoteFromBass(root));
      // debugPrint(notes.toString());
    }
  }

  void playInAscendant(i) {
    if (i == notes.length) return;
    var player = notes[i].play();
    player.onPlayerComplete.listen((event) {
      playInAscendant(i + 1);
    });
    // notes[i].play().then((data) {
    //   data.listen((event) {
    //     playInAscendant(i + 1);
    //   });
    // });
  }

  void playInDescendant(i) {
    if (i < 0) return;
    var player = notes[i].play();
    player.onPlayerComplete.listen((event) {
      playInAscendant(i - 1);
    });
  }

  void playInHarmonic() {
    for (var note in notes) {
      note.play();
    }
  }

  void play({PlayType playType = PlayType.ascendant}) {
    switch (playType) {
      case PlayType.harmonic:
        playInHarmonic();
        break;
      case PlayType.descendant:
        playInDescendant(notes.length);
        break;
      case PlayType.ascendant:
        playInAscendant(0);
        break;
    }
  }

  List<List<Note>> getSheetData([isHarmonic = false]) {
    var res = <List<Note>>[[]];

    if (isHarmonic) {
      notes.forEach((element) {
        res[0].add(element);
      });
    } else {
      notes.forEach((element) {
        res.add([element]);
      });
    }
    return res;
  }

  @override
  String toString() {
    return "(${notes.fold("", (acc, curr) => '$acc , ${curr.toString()}')})";
  }
}
