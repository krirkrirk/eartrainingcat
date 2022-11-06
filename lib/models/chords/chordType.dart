import 'package:eartraining/models/chords/chord.dart';
import 'package:eartraining/models/intervals/intervalType.dart';
import 'package:eartraining/models/notes/note.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/utilities/randomFrom.dart';
import 'package:flutter/cupertino.dart';

///Toujours construire la liste des intervalles dans l'ordre croissant

class ChordType {
  List<IntervalType> structure = [];
  String label;
  String shortLabel;
  String id;
  int numberOfSounds;
  bool isMajor;
  bool isMinor;
  String structureId =
      ""; // eg 3m5- , pour faciliter la recherche par structure
  ChordType(
      {required List intervalsIds,
      required this.label,
      required this.id,
      shortLabel})
      : shortLabel = shortLabel ?? id,
        numberOfSounds = intervalsIds.length,
        isMajor =
            intervalsIds.any((element) => element == "3" || element == "10"),
        isMinor =
            intervalsIds.any((element) => element == "3m" || element == "10m") {
    for (var id in intervalsIds) {
      var intervalType = INTERVALS_MAP[id];
      structure.add(intervalType!);
      structureId += id;
    }
  }
  Chord getChordFromBass(Note root) {
    return Chord(
        notesCollection: NotesCollection.fromRootAndStructure(root, structure),
        type: this);
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
  ChordType(label: "MAJEUR", id: "", intervalsIds: ["1", "3", "5"]),
  ChordType(label: "DIMINUE", id: "Majb5", intervalsIds: ["1", "3", "5-"]),
  ChordType(label: "AUGMENTE", id: "augm", intervalsIds: ["1", "3", "5+"]),
  ChordType(label: "MINEUR", id: "m", intervalsIds: ["1", "3m", "5"]),
  ChordType(label: "MINEUR DIM", id: "mb5", intervalsIds: ["1", "3m", "5-"]),
  ChordType(label: "MINEUR AUGM", id: "m+", intervalsIds: ["1", "3m", "5+"]),
  ChordType(label: "SUS2", id: "sus2", intervalsIds: ["1", "2", "5"]),
  ChordType(label: "SUS4", id: "sus4", intervalsIds: ["1", "4", "5"]),
  ChordType(label: "MAJEUR 7M", id: "7M", intervalsIds: ["1", "3", "5", "7"]),
  ChordType(
      label: "MAJEUR 7Mb5", id: "7Mb5", intervalsIds: ["1", "3", "5-", "7"]),
  ChordType(
      label: "MAJEUR AUGM 7M",
      id: "augm7M",
      intervalsIds: ["1", "3", "5+", "7"]),
  ChordType(label: "MAJEUR 6", id: "6", intervalsIds: ["1", "3", "5", "6"]),
  ChordType(label: "MAJEUR 7", id: "7", intervalsIds: ["1", "3", "5", "7m"]),
  ChordType(
      label: "MAJEUR 7b5", id: "7b5", intervalsIds: ["1", "3", "5-", "7m"]),
  ChordType(
      label: "MAJEUR 7AUGM", id: "7#5", intervalsIds: ["1", "3", "5+", "7m"]),
  ChordType(label: "MINEUR 7", id: "m7", intervalsIds: ["1", "3m", "5", "7m"]),
  ChordType(
      label: "MINEUR 7#5", id: "m7#5", intervalsIds: ["1", "3m", "5+", "7m"]),
  ChordType(
      label: "SEMI-DIMINUE", id: "m7b5", intervalsIds: ["1", "3m", "5-", "7m"]),
  ChordType(label: "MINEUR 6", id: "m6", intervalsIds: ["1", "3m", "5", "6"]),
  ChordType(
      label: "MINEUR b6", id: "mb6", intervalsIds: ["1", "3m", "5", "6m"]),
  ChordType(
      label: "DIMINUE 7", id: "o7", intervalsIds: ["1", "3m", "5-", "7-"]),
  ChordType(label: "7SUS2", id: "7sus2", intervalsIds: ["1", "2", "5", "7m"]),
  ChordType(label: "7SUS4", id: "7sus4", intervalsIds: ["1", "4", "5", "7m"]),
];

//ajouter les ChordType : type (3, 4, ou 5sons), reversetype (renversement), Majchord (majeurs), Minchords (mineurs)

final CHORDS_MAP = Map<String, ChordType>.fromIterable(CHORDS,
    key: (item) => item.id, value: (item) => item);
