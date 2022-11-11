import 'package:eartraining/models/chords/chord.dart';
import 'package:eartraining/models/chords/chordType.dart';
import 'package:eartraining/models/intervals/intervalType.dart';
import 'package:eartraining/models/intervalsStructure/intervalsStructure.dart';
import 'package:eartraining/models/ladders/ladder.dart';
import 'package:eartraining/models/notes/note.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/models/scales/scale.dart';
import 'package:eartraining/models/theoricTypeModel.dart';
import 'package:eartraining/utilities/randomFrom.dart';
import 'package:flutter/cupertino.dart';

class ScaleType implements TheoricTypeModel<Scale> {
  Ladder ladder;
  String label;
  IntervalsStructure structure;
  @override
  String id;
  int degree;
  ScaleType({
    required this.ladder,
    required this.structure,
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
  Scale getRandom() {
    var maxSemitones = structure.intervals.last.semitones;
    var maxScaleSteps = structure.intervals.last.scaleSteps;
    var availableRoots = NOTES.where((note) =>
        note.type.isChromatic &&
        note.soundNumber + maxSemitones <= maxSoundNumber &&
        note.positionInG + maxScaleSteps <= maxPositionInG);
    var root = randomFrom(availableRoots.toList());
    return Scale(
        type: this,
        notesCollection: NotesCollection.fromRootAndStructure(root, structure));
  }

  @override
  Scale fromBass(Note note) {
    return Scale(
        type: this,
        notesCollection: NotesCollection.fromRootAndStructure(note, structure));
  }

  @override
  String toString() {
    return label;
  }
}

List<ScaleType> getScales() {
  var res = <ScaleType>[];
  LADDERS.forEach((ladder) {
    for (var i = 0; i < ladder.numberOfSounds; i++) {
      res.add(ScaleType(
          ladder: ladder,
          degree: i + 1,
          structure: ladder.structure.translation(i + 1),
          label: ladder.modes[i]));
    }
  });
  return res;
}

var SCALES = getScales();
//Il faut qu'on voit comment marche les appels d'intervalle car il y a des modes un peu particuliers avec sixte diminuée ou tonique b1...

var SCALES_MAP = Map<String, ScaleType>.fromIterable(SCALES,
    key: (item) => item.id, value: (item) => item);
