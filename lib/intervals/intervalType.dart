import 'package:eartraining/intervals/interval.dart';
import 'package:eartraining/notes/note.dart';
import 'package:eartraining/notes/notesCollection.dart';
import 'package:eartraining/utilities/randomFrom.dart';
import 'package:flutter/cupertino.dart' hide Interval;

class IntervalType {
  String label;
  String id;
  int semitones;
  int scaleSteps;
  int type;
  bool isDiatonic;

  IntervalType(
      {required this.label,
      required this.id,
      required this.semitones,
      required this.type,
      required this.isDiatonic})
      : scaleSteps = type - 1;

  @override
  String toString() {
    return id;
  }

  Note getSecondNoteFromBass(Note note) {
    return NOTES.firstWhere((el) =>
        el.soundNumber - note.soundNumber == semitones &&
        el.positionInG - note.positionInG == scaleSteps);
  }

  Interval getIntervalFromBass(Note note) {
    var note2 = NOTES.firstWhere((el) =>
        el.soundNumber - note.soundNumber == semitones &&
        el.positionInG - note.positionInG == scaleSteps);

    return Interval(
        type: this, notesCollection: NotesCollection(notes: [note, note2]));
  }

  Interval getRandomInterval() {
    var availableRoots = NOTES.where((note) =>
        note.isChromatic &&
        note.soundNumber + semitones <= maxSoundNumber &&
        note.positionInG + scaleSteps <= maxPositionInG);
    var root = randomFrom(availableRoots.toList());
    return Interval(
        type: this,
        notesCollection:
            NotesCollection(notes: [root, getSecondNoteFromBass(root)]));
  }
}

final INTERVALS = [
  IntervalType(
      label: "Unisson", id: "1", semitones: 0, type: 1, isDiatonic: true),
  IntervalType(
      label: "Seconde mineure",
      id: "2m",
      semitones: 1,
      type: 2,
      isDiatonic: false),
  IntervalType(
      label: "Seconde majeure",
      id: "2",
      semitones: 2,
      type: 2,
      isDiatonic: true),
  IntervalType(
      label: "Seconde augmentée",
      id: "2+",
      semitones: 3,
      type: 2,
      isDiatonic: false),
  IntervalType(
      label: "Tierce diminuée",
      id: "3-",
      semitones: 2,
      type: 3,
      isDiatonic: false),
  IntervalType(
      label: "Tierce mineure",
      id: "3m",
      semitones: 3,
      type: 3,
      isDiatonic: false),
  IntervalType(
      label: "Tierce majeure",
      id: "3",
      semitones: 4,
      type: 3,
      isDiatonic: true),
  IntervalType(
      label: "Quarte juste", id: "4", semitones: 5, type: 4, isDiatonic: true),
  IntervalType(
      label: "Quarte augmentée",
      id: "4+",
      semitones: 6,
      type: 4,
      isDiatonic: false),
  IntervalType(
      label: "Quinte diminuée",
      id: "5-",
      semitones: 6,
      type: 5,
      isDiatonic: false),
  IntervalType(
      label: "Quinte juste", id: "5", semitones: 7, type: 5, isDiatonic: true),
  IntervalType(
      label: "Quinte augmentee",
      id: "5+",
      semitones: 8,
      type: 5,
      isDiatonic: false),
  IntervalType(
    label: "Sixte diminuée",
    id: "6-",
    semitones: 7,
    type: 6,
    isDiatonic: false,
  ),
  IntervalType(
      label: "Sixte mineure",
      id: "6m",
      semitones: 8,
      type: 6,
      isDiatonic: false),
  IntervalType(
      label: "Sixte majeure", id: "6", semitones: 9, type: 6, isDiatonic: true),
  IntervalType(
      label: "Sixte augmentée",
      id: "6+",
      semitones: 10,
      type: 6,
      isDiatonic: false),
  IntervalType(
      label: "Septième diminuee",
      id: "7-",
      semitones: 9,
      type: 7,
      isDiatonic: false),
  IntervalType(
      label: "Septième mineure",
      id: "7m",
      semitones: 10,
      type: 7,
      isDiatonic: false),
  IntervalType(
      label: "Septième majeure",
      id: "7",
      semitones: 11,
      type: 7,
      isDiatonic: true),
  IntervalType(
      label: "Octave1", id: "8", semitones: 12, type: 8, isDiatonic: true),
  IntervalType(
      label: "Neuvième mineure",
      id: "9m",
      semitones: 13,
      type: 9,
      isDiatonic: false),
  IntervalType(
      label: "Neuvième majeure",
      id: "9",
      semitones: 14,
      type: 9,
      isDiatonic: true),
  IntervalType(
      label: "Neuvième augmentée",
      id: "9+",
      semitones: 15,
      type: 9,
      isDiatonic: false),
  IntervalType(
      label: "Dixième diminuée",
      id: "10-",
      semitones: 14,
      type: 10,
      isDiatonic: false),
  IntervalType(
      label: "Dixième mineure",
      id: "10m",
      semitones: 15,
      type: 10,
      isDiatonic: false),
  IntervalType(
      label: "Dixième majeure",
      id: "10",
      semitones: 16,
      type: 10,
      isDiatonic: true),
  IntervalType(
      label: "Onzième juste",
      id: "11",
      semitones: 17,
      type: 11,
      isDiatonic: true),
  IntervalType(
      label: "Onzième augmentée",
      id: "11+",
      semitones: 18,
      type: 11,
      isDiatonic: false),
  IntervalType(
      label: "Douzième diminuée",
      id: "12-",
      semitones: 18,
      type: 12,
      isDiatonic: false),
  IntervalType(
      label: "Douzième juste",
      id: "12",
      semitones: 19,
      type: 12,
      isDiatonic: true),
  IntervalType(
      label: "Douzième augmentée",
      id: "12+",
      semitones: 20,
      type: 12,
      isDiatonic: false),
  IntervalType(
      label: "Treizième mineure",
      id: "13m",
      semitones: 20,
      type: 13,
      isDiatonic: false),
  IntervalType(
      label: "Treizième majeure",
      id: "13",
      semitones: 21,
      type: 13,
      isDiatonic: true),
  IntervalType(
      label: "Treizième augmentée",
      id: "13+",
      semitones: 22,
      type: 13,
      isDiatonic: false),
  IntervalType(
      label: "Quatorzième diminuée",
      id: "14-",
      semitones: 21,
      type: 14,
      isDiatonic: false),
  IntervalType(
      label: "Quatorzième mineure",
      id: "14m",
      semitones: 22,
      type: 14,
      isDiatonic: false),
  IntervalType(
      label: "Quatorzième majeure",
      id: "14",
      semitones: 23,
      type: 14,
      isDiatonic: true),
  IntervalType(
      label: "Octave2", id: "15", semitones: 24, type: 15, isDiatonic: true),
];

//ajouter IntervalType octave (1 ou 2)
//faire un lien entre les octaves (3=10, 5=12, 7=14)

final INTERVALS_MAP =
    Map.fromIterable(INTERVALS, key: (item) => item.id, value: (item) => item);
