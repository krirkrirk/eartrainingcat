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
  String structureId = ""; // pour faciliter la recherche par structure
  ChordType({required List intervalsIds, required this.label, required this.id})
      : numberOfSound = intervalsIds.length {
    for (var id in intervalsIds) {
      var intervalType = INTERVALS_MAP[id];
      structure.add(intervalType);
      structureId += id;
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
  ChordType(label: "MAJEUR", id: "", intervalsIds: ["int1", "int3", "int5"], type: 3, reversetype: 0, Majchord: true, Minchord: false),
  ChordType(label: "DIMINUE", id: "Majb5", intervalsIds: ["int1", "int3", "int5-"], type: 3, reversetype: 0, Majchord: true, Minchord: false),
  ChordType(label: "AUGMENTE", id: "augm", intervalsIds: ["int1", "int3", "int5+"], type: 3, reversetype: 0, Majchord: true, Minchord: false),
  ChordType(label: "MINEUR", id: "m", intervalsIds: ["int1", "int3m", "int5"], type: 3, reversetype: 0, Majchord: false, Minchord: true),
  ChordType(label: "MINEUR DIM", id: "m+", intervalsIds: ["int1", "int3m", "int5-"], type: 3, reversetype: 0, Majchord: false, Minchord: true),
  ChordType(label: "MINEUR AUGM", id: "mb5", intervalsIds: ["int1", "int3m", "int5+"], type: 3, reversetype: 0, Majchord: false, Minchord: true),
  ChordType(label: "SUS2", id: "sus2", intervalsIds: ["int1", "int2", "int5"], type: 3, reversetype: 0, Majchord: false, Minchord: false),
  ChordType(label: "SUS4", id: "sus4", intervalsIds: ["int1", "int4", "int5"], type: 3, reversetype: 0, Majchord: false, Minchord: false),

  ChordType(label: "MAJEUR 7M", id: "7M", intervalsIds: ["int1", "int3", "int5", "int7"], type: 4, reversetype: 0, Majchord: true, Minchord: false),
  ChordType(label: "MAJEUR 7Mb5", id: "7Mb5", intervalsIds: ["int1", "int3", "int5-", "int7"], type: 4, reversetype: 0, Majchord: true, Minchord: false),
  ChordType(label: "MAJEUR AUGM 7M", id: "augm7M", intervalsIds: ["int1", "int3", "int5+", "int7"], type: 4, reversetype: 0, Majchord: true, Minchord: false),
  ChordType(label: "MAJEUR 6", id: "6", intervalsIds: ["int1", "int3", "int5", "int6"], type: 4, reversetype: 0, Majchord: true, Minchord: false),
  ChordType(label: "MAJEUR 7", id: "7", intervalsIds: ["int1", "int3", "int5", "int7m"], type: 4, reversetype: 0, Majchord: true, Minchord: false),
  ChordType(label: "MAJEUR 7b5", id: "7b5", intervalsIds: ["int1", "int3", "int5-", "int7m"], type: 4, reversetype: 0, Majchord: true, Minchord: false),
  ChordType(label: "MAJEUR 7AUGM", id: "7#5", intervalsIds: ["int1", "int3", "int5+", "int7m"], type: 4, reversetype: 0, Majchord: true, Minchord: false),
  ChordType(label: "MINEUR 7", id: "m7", intervalsIds: ["int1", "int3m", "int5", "int7m"], type: 4, reversetype: 0, Majchord: false, Minchord: true),
  ChordType(label: "MINEUR 7#5", id: "m7#5", intervalsIds: ["int1", "int3m", "int5+", "int7m"], type: 4, reversetype: 0, Majchord: false, Minchord: true),
  ChordType(label: "SEMI-DIMINUE", id: "m7b5", intervalsIds: ["int1", "int3m", "int5-", "int7m"], type: 4, reversetype: 0, Majchord: false, Minchord: true),
  ChordType(label: "MINEUR 6", id: "m6", intervalsIds: ["int1", "int3m", "int5", "int6"], type: 4, reversetype: 0, Majchord: false, Minchord: true),
  ChordType(label: "MINEUR b6", id: "mb6", intervalsIds: ["int1", "int3m", "int5", "int6m"], type: 4, reversetype: 0, Majchord: false, Minchord: true),
  ChordType(label: "DIMINUE 7", id: "o7", intervalsIds: ["int1", "int3m", "int5-", "int7-"], type: 4, reversetype: 0, Majchord: false, Minchord: true),
  ChordType(label: "7SUS2", id: "7sus2", intervalsIds: ["int1", "int2", "int5", "int7m"], type: 4, reversetype: 0, Majchord: false, Minchord: false),
  ChordType(label: "7SUS4", id: "7sus4", intervalsIds: ["int1", "int4", "int5", "int7m"], type: 4, reversetype: 0, Majchord: false, Minchord: false),

];

//ajouter les ChordType : type (3, 4, ou 5sons), reversetype (renversement), Majchord (majeurs), Minchords (mineurs)


final CHORDS_MAP =
    Map.fromIterable(CHORDS, key: (item) => item.id, value: (item) => item);
