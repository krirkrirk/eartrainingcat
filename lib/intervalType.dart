import 'package:eartraining/interval.dart';
import 'package:eartraining/note.dart';
import 'package:eartraining/utilities/randomFrom.dart';

class IntervalType {
  String label;
  String id;
  int semitones;
  int scaleSteps;
  int type;
  IntervalType(
      {required this.label,
      required this.id,
      required this.semitones,
      required this.type})
      : scaleSteps = type - 1;

  Note getSecondNoteFromBass(Note note) {
    return notes.firstWhere((el) =>
        el.soundNumber - note.soundNumber == semitones &&
        el.positionInG - note.positionInG == scaleSteps);
  }

  Interval getIntervalFromBass(Note note) {
    var note2 = notes.firstWhere((el) =>
        el.soundNumber - note.soundNumber == semitones &&
        el.positionInG - note.positionInG == scaleSteps);
    return Interval(type: this, notes: [note, note2]);
  }

  Interval getRandomInterval() {
    var availableRoots = notes.where((note) =>
        note.isChromatic &&
        note.soundNumber + semitones <= maxSoundNumber &&
        note.positionInG + scaleSteps <= maxPositionInG);
    var root = randomFrom(availableRoots.toList());
    return Interval(type: this, notes: [root, getSecondNoteFromBass(root)]);
  }
}

final ALL_INTERVAL_TYPES = [
  IntervalType(label: "Seconde mineure", id: "2m", semitones: 1, type: 2),
  IntervalType(label: "Tierce majeure", id: "3", semitones: 4, type: 3)
];
