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
      label: "Unisson", id: "int1", semitones: 0, type: 1, isDiatonic: true, octave: 1),
  IntervalType(
      label: "Seconde mineure", id: "int2m", semitones: 1, type: 2, isDiatonic: false, octave: 1),
  IntervalType(
      label: "Seconde majeure", id: "int2", semitones: 2, type: 2, isDiatonic: true, octave: 1),
  IntervalType(
      label: "Seconde augmentee", id: "int2+", semitones: 3, type: 2, isDiatonic: false, octave: 1),    
  IntervalType(
      label: "Tierce diminuee", id: "int3-", semitones: 2, type: 3, isDiatonic: false, octave: 1),
  IntervalType(
      label: "Tierce mineure", id: "int3m", semitones: 3, type: 3, isDiatonic: false, octave: 1),
  IntervalType(
      label: "Tierce majeure", id: "int3", semitones: 4, type: 3, isDiatonic: true, octave: 1),
  IntervalType(
      label: "Quarte juste", id: "int4", semitones: 5, type: 4, isDiatonic: true, octave: 1),
  IntervalType(
      label: "Quarte augmentee", id: "int4+", semitones: 6, type: 4, isDiatonic: false, octave: 1),
  IntervalType(
      label: "Quinte diminuee", id: "int5-", semitones: 6, type: 5, isDiatonic: false, octave: 1),
  IntervalType(
      label: "Quinte juste", id: "int5", semitones: 7, type: 5, isDiatonic: true, octave: 1),
  IntervalType(
      label: "Quinte augmentee", id: "int5+", semitones: 8, type: 5, isDiatonic: false, octave: 1),
  IntervalType(
      label: "Sixte diminuée", id: "int6-", semitones: 7, type: 6, isDiatonic: false, octave: 1),
  IntervalType(
      label: "Sixte mineure", id: "int6m", semitones: 8, type: 6, isDiatonic: false, octave: 1),
  IntervalType(
      label: "Sixte majeure", id: "int6", semitones: 9, type: 6, isDiatonic: true, octave: 1),
  IntervalType(
      label: "Sixte augmentee", id: "int6+", semitones: 10, type: 6, isDiatonic: false, octave: 1),
  IntervalType(
      label: "Septième diminuee", id: "int7-", semitones: 9, type: 7, isDiatonic: false, octave: 1),
  IntervalType(
      label: "Septième mineure", id: "int7m", semitones: 10, type: 7, isDiatonic: false, octave: 1),
  IntervalType(
      label: "Septième majeure", id: "int7", semitones: 11, type: 7, isDiatonic: true, octave: 1),
  IntervalType(
      label: "Octave1", id: "int8", semitones: 12, type: 8, isDiatonic: true, octave: 1),

  IntervalType(
      label: "Neuvième mineure", id: "int9m", semitones: 13, type: 9, isDiatonic: false, octave: 2),
  IntervalType(
      label: "Neuvième majeure", id: "int9", semitones: 14, type: 9, isDiatonic: true, octave: 2),
  IntervalType(
      label: "Neuvième augmentee", id: "int9+", semitones: 15, type: 9, isDiatonic: false, octave: 2),    
  IntervalType(
      label: "Dixième diminuee", id: "int10-", semitones: 14, type: 10, isDiatonic: false, octave: 2),
  IntervalType(
      label: "Dixième mineure", id: "int10m", semitones: 15, type: 10, isDiatonic: false, octave: 2),
  IntervalType(
      label: "Dixième majeure", id: "int10", semitones: 16, type: 10, isDiatonic: true, octave: 2),
  IntervalType(
      label: "Onzième juste", id: "int11", semitones: 17, type: 11, isDiatonic: true, octave: 2),
  IntervalType(
      label: "Onzième augmentee", id: "int11+", semitones: 18, type: 11, isDiatonic: false, octave: 2),
  IntervalType(
      label: "Douzième diminuee", id: "int12-", semitones: 18, type: 12, isDiatonic: false, octave: 2),
  IntervalType(
      label: "Douzième juste", id: "int12", semitones: 19, type: 12, isDiatonic: true, octave: 2),
  IntervalType(
      label: "Douzième augmentee", id: "int12+", semitones: 20, type: 12, isDiatonic: false, octave: 2),
  IntervalType(
      label: "Treizième mineure", id: "int13m", semitones: 20, type: 13, isDiatonic: false, octave: 2),
  IntervalType(
      label: "Treizième majeure", id: "int13", semitones: 21, type: 13, isDiatonic: true, octave: 2),
  IntervalType(
      label: "Treizième augmentee", id: "int13+", semitones: 22, type: 13, isDiatonic: false, octave: 2),
  IntervalType(
      label: "Quatorzième diminuee", id: "int14-", semitones: 21, type: 14, isDiatonic: false, octave: 2),
  IntervalType(
      label: "Quatorzième mineure", id: "int14m", semitones: 22, type: 14, isDiatonic: false, octave: 2),
  IntervalType(
      label: "Quatorzième majeure", id: "int14", semitones: 23, type: 14, isDiatonic: true, octave: 2),
  IntervalType(
      label: "Octave2", id: "int15", semitones: 24, type: 15, isDiatonic: true, octave: 2),
];

//ajouter IntervalType octave (1 ou 2)
//faire un lien entre les octaves (3=10, 5=12, 7=14)

final INTERVALS_MAP =
    Map.fromIterable(INTERVALS, key: (item) => item.id, value: (item) => item);
