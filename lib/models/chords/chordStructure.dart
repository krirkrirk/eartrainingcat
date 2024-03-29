import 'package:eartraining/models/chords/absoluteChord.dart';
import 'package:eartraining/models/chords/chord.dart';
import 'package:eartraining/models/intervals/intervalStructure.dart';
import 'package:eartraining/models/intervalsStructure/intervalsStructure.dart';
import 'package:eartraining/models/notes/absoluteNotesCollection.dart';
import 'package:eartraining/models/notes/note.dart';
import 'package:eartraining/models/notes/absoluteNote.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/models/absoluteModel.dart';
import 'package:eartraining/models/modelStructure.dart';
import 'package:eartraining/utilities/randomFrom.dart';
import 'package:flutter/cupertino.dart';

class ChordStructure implements ModelStructure<Chord, AbsoluteChord> {
  IntervalsStructure intervalsStructure;
  @override
  String label;
  @override
  String id;
  int numberOfSounds;
  bool isMajor;
  bool isMinor;
  Note? root;
  AbsoluteNote? absoluteRoot;
  int inversion = 0;
  String structureId;
  ChordStructure({
    required List<String> intervalsIds,
    required this.label,
    required this.id,
  })  : numberOfSounds = intervalsIds.length,
        structureId = intervalsIds.reduce((acc, curr) => acc + curr + "/"),
        intervalsStructure = IntervalsStructure.fromIds(intervalsIds),
        isMajor =
            intervalsIds.any((element) => element == "3" || element == "10"),
        isMinor =
            intervalsIds.any((element) => element == "3m" || element == "10m");

  ChordStructure.fromInversion(
      {required ChordStructure chordStructure, this.inversion = 0})
      : label = "${chordStructure.label} renversement $inversion",
        id = "${chordStructure.id}${inversion > 0 ? ":$inversion" : ""}",
        intervalsStructure =
            chordStructure.intervalsStructure.inversion(inversion),
        numberOfSounds = chordStructure.numberOfSounds,
        structureId =
            chordStructure.structureId + (inversion > 0 ? ":$inversion" : ""),
        isMajor = chordStructure.isMajor,
        isMinor = chordStructure.isMinor;

  List<ChordStructure> getAllInversions() {
    List<ChordStructure> res = [];
    for (var i = 0; i < numberOfSounds; i++) {
      res.add(ChordStructure.fromInversion(chordStructure: this, inversion: i));
    }
    return res;
  }

  @override
  Chord projectOnNote(Note rootNote) {
    return Chord(
        notesCollection: NotesCollection.fromRootAndStructure(
            rootNote, intervalsStructure, false),
        structure: this);
  }

  @override
  AbsoluteChord projectOnAbsoluteNote(AbsoluteNote rootAbsoluteNote) {
    return AbsoluteChord(
        absoluteNotesCollection: AbsoluteNotesCollection.fromRootAndStructure(
            rootAbsoluteNote, intervalsStructure),
        structure: this);
  }

  @override
  Chord getRandomModel() {
    debugPrint("chord id $id");
    debugPrint("struct ${intervalsStructure.ids}");
    var maxSemitones = intervalsStructure.intervals.last.semitones;
    var maxScaleSteps = intervalsStructure.intervals.last.scaleSteps;
    debugPrint(" get random model : $maxScaleSteps et $maxSemitones");
    var availableRoots = NOTES.where((note) =>
        note.absoluteNote.isChromatic &&
        note.soundNumber + maxSemitones <= maxSoundNumber &&
        note.positionInG + maxScaleSteps <= maxPositionInG);
    debugPrint("av roots : $availableRoots");

    var randRoot = randomFrom(availableRoots.toList());

    return Chord(
        structure: this,
        notesCollection: NotesCollection.fromRootAndStructure(
            randRoot, intervalsStructure, false));
  }

  List<String> getNonInversedChordStructureIds() {
    if (inversion == 0)
      return intervalsStructure.ids;
    else {
      ChordStructure nonInversed = CHORDS_MAP[id.substring(0, id.length - 2)]!;
      debugPrint("id $id");

      debugPrint("non inv ${nonInversed.intervalsStructure.ids} ");
      return nonInversed.intervalsStructure.ids;
    }
  }

  @override
  String toString() {
    return label;
  }
}

var _DEFAULTCHORDS = [
  ChordStructure(label: "MAJEUR", id: "", intervalsIds: ["1", "3", "5"]),
  ChordStructure(label: "DIMINUE", id: "Majb5", intervalsIds: ["1", "3", "5-"]),
  ChordStructure(label: "AUGMENTE", id: "augm", intervalsIds: ["1", "3", "5+"]),
  ChordStructure(label: "MINEUR", id: "m", intervalsIds: ["1", "3m", "5"]),
  ChordStructure(
      label: "MINEUR DIM", id: "mb5", intervalsIds: ["1", "3m", "5-"]),
  ChordStructure(
      label: "MINEUR AUGM", id: "m+", intervalsIds: ["1", "3m", "5+"]),
  ChordStructure(label: "SUS2", id: "sus2", intervalsIds: ["1", "2", "5"]),
  ChordStructure(label: "SUS4", id: "sus4", intervalsIds: ["1", "4", "5"]),
  ChordStructure(
      label: "MAJEUR 7M", id: "7M", intervalsIds: ["1", "3", "5", "7"]),
  ChordStructure(
      label: "MAJEUR 7Mb5", id: "7Mb5", intervalsIds: ["1", "3", "5-", "7"]),
  ChordStructure(
      label: "MAJEUR AUGM 7M",
      id: "augm7M",
      intervalsIds: ["1", "3", "5+", "7"]),
  ChordStructure(
      label: "MAJEUR 6", id: "6", intervalsIds: ["1", "3", "5", "6"]),
  ChordStructure(
      label: "MAJEUR 7", id: "7", intervalsIds: ["1", "3", "5", "7m"]),
  ChordStructure(
      label: "MAJEUR 7b5", id: "7b5", intervalsIds: ["1", "3", "5-", "7m"]),
  ChordStructure(
      label: "MAJEUR 7AUGM", id: "7#5", intervalsIds: ["1", "3", "5+", "7m"]),
  ChordStructure(
      label: "MINEUR 7", id: "m7", intervalsIds: ["1", "3m", "5", "7m"]),
  ChordStructure(
      label: "MINEUR 7#5", id: "m7#5", intervalsIds: ["1", "3m", "5+", "7m"]),
  ChordStructure(
      label: "SEMI-DIMINUE", id: "m7b5", intervalsIds: ["1", "3m", "5-", "7m"]),
  ChordStructure(
      label: "MINEUR 6", id: "m6", intervalsIds: ["1", "3m", "5", "6"]),
  ChordStructure(
      label: "MINEUR b6", id: "mb6", intervalsIds: ["1", "3m", "5", "6m"]),
  ChordStructure(
      label: "DIMINUE 7", id: "o7", intervalsIds: ["1", "3m", "5-", "7-"]),
  ChordStructure(
      label: "7SUS2", id: "7sus2", intervalsIds: ["1", "2", "5", "7m"]),
  ChordStructure(
      label: "7SUS4", id: "7sus4", intervalsIds: ["1", "4", "5", "7m"]),
];

List<ChordStructure> getAllChords() {
  List<ChordStructure> res = [];
  _DEFAULTCHORDS.forEach((element) {
    res.addAll(element.getAllInversions());
  });
  // res.forEach((chord) {
  //   debugPrint("${chord.id}");
  // });
  return res;
}

List<ChordStructure> CHORDS = getAllChords();

final CHORDS_MAP = Map<String, ChordStructure>.fromIterable(CHORDS,
    key: (item) => item.id, value: (item) => item);
