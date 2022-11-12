import 'package:eartraining/models/intervalsStructure/intervalsStructure.dart';
import 'package:eartraining/models/notes/absoluteNote.dart';

class AbsoluteNotesCollection {
  List<AbsoluteNote> absoluteNotes = [];
  AbsoluteNotesCollection({required this.absoluteNotes});

  AbsoluteNotesCollection.fromRootAndStructure(
      AbsoluteNote root, IntervalsStructure structure) {
    for (var interval in structure.intervals) {
      absoluteNotes.add(interval.resultFromAbsoluteBass(root));
    }
  }

  AbsoluteNotesCollection projectOnOctave(int octave) {
    var notes = [absoluteNotes[0].projectOnOctave(octave)];
    var currentOctave = octave;

    for (var i = 1; i < absoluteNotes.length; i++) {
      var prev = absoluteNotes[i - 1];
      var curr = absoluteNotes[i];
      if (curr.diatonicPosition - prev.diatonicPosition < 0) {
        currentOctave++;
      }
      notes.add(absoluteNotes[i].projectOnOctave(currentOctave));
    }
    return AbsoluteNotesCollection(absoluteNotes: absoluteNotes);
  }

  @override
  String toString() {
    return "(${absoluteNotes.fold("", (acc, curr) => '$acc , ${curr.toString()}')})";
  }
}
