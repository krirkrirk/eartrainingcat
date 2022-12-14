import 'package:eartraining/models/intervals/absoluteInterval.dart';
import 'package:eartraining/models/intervals/interval.dart';
import 'package:eartraining/models/notes/absoluteNotesCollection.dart';
import 'package:eartraining/models/notes/note.dart';
import 'package:eartraining/models/notes/absoluteNote.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/models/modelStructure.dart';
import 'package:eartraining/utilities/randomFrom.dart';
import 'package:flutter/cupertino.dart' hide Interval;

class IntervalStructure implements ModelStructure<Interval, AbsoluteInterval> {
  @override
  String id;
  @override
  String label;
  int semitones;
  int scaleSteps;
  int type;
  bool isDiatonic;
  bool isArpegio;
  int octave;
  Note? root;
  AbsoluteNote? absoluteRoot;
  Interval? interval;
  IntervalStructure(
      {required this.label,
      required this.id,
      required this.semitones,
      required this.type,
      this.isArpegio = false,
      required this.isDiatonic})
      : scaleSteps = type - 1,
        octave = type < 9 ? 1 : 2;

  @override
  String toString() {
    return id;
  }

  Note resultFromBass(Note note) {
    return NOTES.firstWhere((el) =>
        el.soundNumber - note.soundNumber == semitones &&
        el.positionInG - note.positionInG == scaleSteps);
  }

  AbsoluteNote resultFromAbsoluteBass(AbsoluteNote root) {
    var diato = (root.diatonicPosition + this.scaleSteps) % 7;
    var chroma = (root.chromaticPosition + this.semitones) % 12;
    return ABSOLUTE_NOTES.firstWhere((element) =>
        element.diatonicPosition == diato &&
        element.chromaticPosition == chroma);
  }

  @override
  Interval getRandomModel() {
    var availableRoots = NOTES.where((note) =>
        note.absoluteNote.isChromatic &&
        note.soundNumber + semitones <= maxSoundNumber &&
        note.positionInG + scaleSteps <= maxPositionInG);
    var root = randomFrom(availableRoots.toList());
    return Interval(
        structure: this,
        notesCollection: NotesCollection(notes: [root, resultFromBass(root)]));
  }

  @override
  Interval projectOnNote(Note note) {
    var note2 = resultFromBass(note);
    return Interval(
        structure: this,
        notesCollection: NotesCollection(notes: [note, note2]));
  }

  @override
  AbsoluteInterval projectOnAbsoluteNote(AbsoluteNote note) {
    var note2 = resultFromAbsoluteBass(note);

    return AbsoluteInterval(
        structure: this,
        absoluteNotesCollection:
            AbsoluteNotesCollection(absoluteNotes: [note, note2]));
  }
}

final INTERVALS = [
  IntervalStructure(
      label: "Unisson", id: "1", semitones: 0, type: 1, isDiatonic: true),
  IntervalStructure(
      label: "Seconde mineure",
      id: "2m",
      semitones: 1,
      type: 2,
      isDiatonic: false),
  IntervalStructure(
    label: "Seconde majeure",
    id: "2",
    semitones: 2,
    type: 2,
    isDiatonic: true,
  ),
  IntervalStructure(
      label: "Seconde augment??e",
      id: "2+",
      semitones: 3,
      type: 2,
      isDiatonic: false),
  IntervalStructure(
      label: "Seconde sur-augment??e",
      id: "2++",
      semitones: 4,
      type: 2,
      isDiatonic: false),
  IntervalStructure(
      label: "Tierce diminu??e",
      id: "3-",
      semitones: 2,
      type: 3,
      isDiatonic: false),
  IntervalStructure(
      label: "Tierce mineure",
      id: "3m",
      semitones: 3,
      type: 3,
      isArpegio: true,
      isDiatonic: false),
  IntervalStructure(
    label: "Tierce majeure",
    id: "3",
    semitones: 4,
    type: 3,
    isDiatonic: true,
    isArpegio: true,
  ),
  IntervalStructure(
    label: "Tierce augment??e",
    id: "3+",
    semitones: 5,
    type: 3,
    isDiatonic: false,
    isArpegio: false,
  ),
  IntervalStructure(
      label: "Quarte diminu??e",
      id: "4-",
      semitones: 4,
      type: 4,
      isDiatonic: false),
  IntervalStructure(
      label: "Quarte juste", id: "4", semitones: 5, type: 4, isDiatonic: true),
  IntervalStructure(
      label: "Quarte augment??e",
      id: "4+",
      semitones: 6,
      type: 4,
      isDiatonic: false),
  IntervalStructure(
    label: "Quinte diminu??e",
    id: "5-",
    semitones: 6,
    type: 5,
    isDiatonic: false,
    isArpegio: true,
  ),
  IntervalStructure(
    label: "Quinte juste",
    id: "5",
    semitones: 7,
    type: 5,
    isDiatonic: true,
    isArpegio: true,
  ),
  IntervalStructure(
      label: "Quinte augmentee",
      id: "5+",
      semitones: 8,
      type: 5,
      isDiatonic: false),
  IntervalStructure(
    label: "Sixte diminu??e",
    id: "6-",
    semitones: 7,
    type: 6,
    isDiatonic: false,
  ),
  IntervalStructure(
      label: "Sixte mineure",
      id: "6m",
      semitones: 8,
      type: 6,
      isDiatonic: false),
  IntervalStructure(
      label: "Sixte majeure", id: "6", semitones: 9, type: 6, isDiatonic: true),
  IntervalStructure(
      label: "Sixte augment??e",
      id: "6+",
      semitones: 10,
      type: 6,
      isDiatonic: false),
  IntervalStructure(
      label: "Septi??me diminuee",
      id: "7-",
      semitones: 9,
      type: 7,
      isDiatonic: false),
  IntervalStructure(
    label: "Septi??me mineure",
    id: "7m",
    semitones: 10,
    type: 7,
    isDiatonic: false,
    isArpegio: true,
  ),
  IntervalStructure(
    label: "Septi??me majeure",
    id: "7",
    semitones: 11,
    type: 7,
    isDiatonic: true,
    isArpegio: true,
  ),
  IntervalStructure(
    label: "Octave1",
    id: "8",
    semitones: 12,
    type: 8,
    isDiatonic: true,
    isArpegio: true,
  ),
  IntervalStructure(
      label: "Neuvi??me mineure",
      id: "9m",
      semitones: 13,
      type: 9,
      isDiatonic: false),
  IntervalStructure(
      label: "Neuvi??me majeure",
      id: "9",
      semitones: 14,
      type: 9,
      isDiatonic: true),
  IntervalStructure(
      label: "Neuvi??me augment??e",
      id: "9+",
      semitones: 15,
      type: 9,
      isDiatonic: false),
  IntervalStructure(
      label: "Dixi??me diminu??e",
      id: "10-",
      semitones: 14,
      type: 10,
      isDiatonic: false),
  IntervalStructure(
      label: "Dixi??me mineure",
      id: "10m",
      semitones: 15,
      type: 10,
      isDiatonic: false),
  IntervalStructure(
      label: "Dixi??me majeure",
      id: "10",
      semitones: 16,
      type: 10,
      isDiatonic: true),
  IntervalStructure(
      label: "Onzi??me juste",
      id: "11",
      semitones: 17,
      type: 11,
      isDiatonic: true),
  IntervalStructure(
      label: "Onzi??me augment??e",
      id: "11+",
      semitones: 18,
      type: 11,
      isDiatonic: false),
  IntervalStructure(
      label: "Douzi??me diminu??e",
      id: "12-",
      semitones: 18,
      type: 12,
      isDiatonic: false),
  IntervalStructure(
      label: "Douzi??me juste",
      id: "12",
      semitones: 19,
      type: 12,
      isDiatonic: true),
  IntervalStructure(
      label: "Douzi??me augment??e",
      id: "12+",
      semitones: 20,
      type: 12,
      isDiatonic: false),
  IntervalStructure(
      label: "Treizi??me mineure",
      id: "13m",
      semitones: 20,
      type: 13,
      isDiatonic: false),
  IntervalStructure(
      label: "Treizi??me majeure",
      id: "13",
      semitones: 21,
      type: 13,
      isDiatonic: true),
  IntervalStructure(
      label: "Treizi??me augment??e",
      id: "13+",
      semitones: 22,
      type: 13,
      isDiatonic: false),
  IntervalStructure(
      label: "Quatorzi??me diminu??e",
      id: "14-",
      semitones: 21,
      type: 14,
      isDiatonic: false),
  IntervalStructure(
      label: "Quatorzi??me mineure",
      id: "14m",
      semitones: 22,
      type: 14,
      isDiatonic: false),
  IntervalStructure(
      label: "Quatorzi??me majeure",
      id: "14",
      semitones: 23,
      type: 14,
      isDiatonic: true),
  IntervalStructure(
      label: "Octave2", id: "15", semitones: 24, type: 15, isDiatonic: true),
];

//ajouter IntervalStructure octave (1 ou 2)
//faire un lien entre les octaves (3=10, 5=12, 7=14)

final INTERVALS_MAP = Map<String, IntervalStructure>.fromIterable(INTERVALS,
    key: (item) => item.id, value: (item) => item);
