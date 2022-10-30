import 'package:eartraining/intervals/intervalType.dart';
import 'package:eartraining/notes/note.dart';

enum PlayType { harmonic, ascendant, descendant }

class NotesCollection {
  List<Note> notes = [];
  NotesCollection({required this.notes});

  NotesCollection.fromRootAndStructure(
      Note root, List<IntervalType> intervals) {
    notes.add(root);
    for (var interval in intervals) {
      notes.add(interval.getSecondNoteFromBass(root));
    }
  }

  void playInAscendant(i) {
    if (i == notes.length) return;
    var player = notes[i].play();
    player.onPlayerComplete.listen((event) {
      playInAscendant(i + 1);
    });
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

  @override
  String toString() {
    return "(${notes.fold("", (acc, curr) => '$acc , ${curr.toString()}')})";
  }
}
