import 'package:eartraining/models/chords/absoluteChord.dart';
import 'package:eartraining/models/chords/chord.dart';
import 'package:eartraining/models/exercisable/exercisable.dart';
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

class ChordStructure
    implements ModelStructure<Chord, AbsoluteChord>, Exercisable {
  IntervalsStructure structure;
  @override
  String label;
  @override
  String id;
  int numberOfSounds;
  bool isMajor;
  bool isMinor;
  Note? root;
  AbsoluteNote? absoluteRoot;
  String structureId =
      ""; // eg 3m5- , pour faciliter la recherche par structure
  int inversion = 0;
  ChordStructure({
    required List intervalsIds,
    required this.label,
    required this.id,
  })  : numberOfSounds = intervalsIds.length,
        structure = IntervalsStructure.fromIds(intervalsIds),
        isMajor =
            intervalsIds.any((element) => element == "3" || element == "10"),
        isMinor =
            intervalsIds.any((element) => element == "3m" || element == "10m");

  ChordStructure.fromInversion(
      {required ChordStructure chordStructure, this.inversion = 0})
      : label = "${chordStructure.label} renversement $inversion",
        id = "${chordStructure.id}${inversion > 0 ? ":$inversion" : ""}",
        structure = chordStructure.structure.inversion(inversion),
        numberOfSounds = chordStructure.numberOfSounds,
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
        notesCollection:
            NotesCollection.fromRootAndStructure(rootNote, structure),
        structure: this);
  }

  @override
  AbsoluteChord projectOnAbsoluteNote(AbsoluteNote rootAbsoluteNote) {
    return AbsoluteChord(
        absoluteNotesCollection: AbsoluteNotesCollection.fromRootAndStructure(
            rootAbsoluteNote, structure),
        structure: this);
  }

  @override
  Chord getRandomModel() {
    var maxSemitones = structure.intervals.last.semitones;
    var maxScaleSteps = structure.intervals.last.scaleSteps;
    var availableRoots = NOTES.where((note) =>
        note.type.isChromatic &&
        note.soundNumber + maxSemitones <= maxSoundNumber &&
        note.positionInG + maxScaleSteps <= maxPositionInG);
    var randRoot = randomFrom(availableRoots.toList());
    return Chord(
        structure: this,
        notesCollection:
            NotesCollection.fromRootAndStructure(randRoot, structure));
  }

  @override
  List<List<Note>> getSheetData() {
    // TODO: implement getSheetData
    throw UnimplementedError();
  }

  @override
  void Function()? stop() {
    // TODO: implement stop
    throw UnimplementedError();
  }

  @override
  void Function()? play(PlayType playtype) {
    // TODO: implement stop
    throw UnimplementedError();
  }

  @override
  instantiate() {
    // TODO: implement instantiate
    throw UnimplementedError();
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
  res.forEach((chord) {
    debugPrint("${chord.id}");
  });
  return res;
}

List<ChordStructure> CHORDS = getAllChords();

final CHORDS_MAP = Map<String, ChordStructure>.fromIterable(CHORDS,
    key: (item) => item.id, value: (item) => item);
