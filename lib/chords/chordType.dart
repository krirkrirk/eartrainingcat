import 'package:eartraining/chords/chord.dart';
import 'package:eartraining/intervals/intervalType.dart';
import 'package:eartraining/notes/note.dart';
import 'package:eartraining/notes/notesCollection.dart';
import 'package:eartraining/utilities/randomFrom.dart';

///Toujours construire la liste des intervalles dans l'ordre croissant

class ChordType {
  List<IntervalType> structure = [];
  String label;
  String id;
  int numberOfSound;

  ChordType({required List intervalsIds, required this.label, required this.id})
      : numberOfSound = intervalsIds.length + 1 {
    for (var id in intervalsIds) {
      var intervalType = INTERVALS_MAP[id];
      structure.add(intervalType);
    }
  }

  Chord getRandomChord() {
    var maxSemitones = structure.last.semitones;
    var maxScaleSteps = structure.last.scaleSteps;
    var availableRoots = NOTES.where((note) =>
        note.isChromatic &&
        note.soundNumber + maxSemitones <= maxSoundNumber &&
        note.positionInG + maxScaleSteps <= maxPositionInG);
    var root = randomFrom(availableRoots.toList());
    return Chord(
        type: this,
        notesCollection: NotesCollection.fromRootAndStructure(root, structure));
  }

  @override
  String toString() {
    return label;
  }
}

var CHORDS = [
  ChordType(label: "Triade majeure", id: "", intervalsIds: ["3", "5"]),
  ChordType(label: "Triade mineure", id: "m", intervalsIds: ["3m", "5"]),
  ChordType(label: "Sus2", id: "sus2", intervalsIds: ["2", "5"]),
];

final CHORDS_MAP =
    Map.fromIterable(CHORDS, key: (item) => item.id, value: (item) => item);
