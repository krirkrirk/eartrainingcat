import 'package:eartraining/intervals/interval.dart';
import 'package:eartraining/notes/note.dart';
import 'package:eartraining/notes/notesCollection.dart';
import 'package:eartraining/utilities/randomFrom.dart';

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
    return Interval(type: this, notes: NotesCollection(notes: [note, note2]));
  }

  Interval getRandomInterval() {
    var availableRoots = NOTES.where((note) =>
        note.isChromatic &&
        note.soundNumber + semitones <= maxSoundNumber &&
        note.positionInG + scaleSteps <= maxPositionInG);
    var root = randomFrom(availableRoots.toList());
    return Interval(
        type: this,
        notes: NotesCollection(notes: [root, getSecondNoteFromBass(root)]));
  }
}

final INTERVALS = [
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
      label: "Quinte juste", id: "5", semitones: 7, type: 5, isDiatonic: true),
];

final INTERVALS_MAP =
    Map.fromIterable(INTERVALS, key: (item) => item.id, value: (item) => item);
