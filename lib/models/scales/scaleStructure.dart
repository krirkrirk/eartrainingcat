import 'package:eartraining/models/chords/chord.dart';
import 'package:eartraining/models/chords/chordStructure.dart';
import 'package:eartraining/models/intervals/intervalStructure.dart';
import 'package:eartraining/models/intervalsStructure/intervalsStructure.dart';
import 'package:eartraining/models/ladders/ladder.dart';
import 'package:eartraining/models/notes/absoluteNote.dart';
import 'package:eartraining/models/notes/absoluteNotesCollection.dart';
import 'package:eartraining/models/notes/note.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/models/scales/absoluteScale.dart';
import 'package:eartraining/models/scales/scale.dart';
import 'package:eartraining/models/modelStructure.dart';
import 'package:eartraining/utilities/randomFrom.dart';
import 'package:flutter/cupertino.dart';

class ScaleStructure implements ModelStructure<Scale, AbsoluteScale> {
  Ladder ladder;
  @override
  String label;
  IntervalsStructure intervalsStructure;
  @override
  String id;
  int degree;
  ScaleStructure({
    required this.ladder,
    required this.intervalsStructure,
    required this.label,
    required this.degree,
    // required this.id,
  }) : id = "${ladder.id}-${degree.toString()}" {
    // for (var intervalType in structure) {
    //   var intervalType = INTERVALS_MAP[id];
    //   structure.add(intervalType!);
    // }
  }

  @override
  Scale getRandomModel() {
    var maxSemitones = intervalsStructure.intervals.last.semitones;
    var maxScaleSteps = intervalsStructure.intervals.last.scaleSteps;
    var availableRoots = NOTES.where((note) =>
        note.absoluteNote.isChromatic &&
        note.soundNumber < 26 && //26 = C2, on interdit les toniques supérierues
        note.soundNumber + maxSemitones <= maxSoundNumber &&
        note.positionInG + maxScaleSteps <= maxPositionInG);
    var root = randomFrom(availableRoots.toList());
    debugPrint("scale chosen $root and ${id},");
    return Scale(
        structure: this,
        notesCollection: NotesCollection.fromRootAndStructure(
            root, intervalsStructure, true));
  }

  @override
  Scale projectOnNote(Note note) {
    return Scale(
        structure: this,
        notesCollection: NotesCollection.fromRootAndStructure(
            note, intervalsStructure, true));
  }

  @override
  AbsoluteScale projectOnAbsoluteNote(AbsoluteNote absoluteNote) {
    return AbsoluteScale(structure: this, root: absoluteNote);
  }

  @override
  String toString() {
    return label;
  }
}

List<ScaleStructure> getScales() {
  var res = <ScaleStructure>[];
  LADDERS.forEach((ladder) {
    for (var i = 0; i < ladder.numberOfSounds; i++) {
      res.add(ScaleStructure(
          ladder: ladder,
          degree: i + 1,
          intervalsStructure: ladder.structure.translation(i + 1),
          label: ladder.modes[i]));
    }
  });
  return res;
}

var SCALES = getScales();
//Il faut qu'on voit comment marche les appels d'intervalle car il y a des modes un peu particuliers avec sixte diminuée ou tonique b1...

var SCALES_MAP = Map<String, ScaleStructure>.fromIterable(SCALES,
    key: (item) => item.id, value: (item) => item);
