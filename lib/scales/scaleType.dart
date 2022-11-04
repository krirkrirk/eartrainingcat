import 'package:eartraining/chords/chord.dart';
import 'package:eartraining/chords/chordType.dart';
import 'package:eartraining/intervals/intervalType.dart';
import 'package:eartraining/notes/note.dart';
import 'package:eartraining/notes/notesCollection.dart';
import 'package:eartraining/scales/scale.dart';
import 'package:eartraining/utilities/randomFrom.dart';

///Toujours construire la liste des intervalles dans l'ordre croissant

class ScaleType {
  List<IntervalType> structure = [];
  String label;
  String id;
  int numberOfSound;
  List<String>? modeNames;
  ScaleType(
      {required List intervalsIds,
      required this.label,
      required this.id,
      this.modeNames})
      : numberOfSound = intervalsIds.length + 1 {
    for (var id in intervalsIds) {
      var intervalType = INTERVALS_MAP[id];
      structure.add(intervalType);
    }
  }

  Scale getRandomScale() {
    var maxSemitones = structure.last.semitones;
    var maxScaleSteps = structure.last.scaleSteps;
    var availableRoots = NOTES.where((note) =>
        note.isChromatic &&
        note.soundNumber + maxSemitones <= maxSoundNumber &&
        note.positionInG + maxScaleSteps <= maxPositionInG);
    var root = randomFrom(availableRoots.toList());
    return Scale(
        type: this,
        notesCollection: NotesCollection.fromRootAndStructure(root, structure));
  }

  List<IntervalType> getModeFromDegree(int degree) {
    if (degree == 1) return structure;
    var newRoot = structure[degree - 1];
    var modeStructure = <IntervalType>[];
    for (var intervalType in structure) {
      var newType = (intervalType.type - newRoot.type) % 7 + 1;
      var newSemitones = (intervalType.semitones - newRoot.semitones) % 12;
      var newInterval = INTERVALS.firstWhere((element) =>
          element.type == newType && element.semitones == newSemitones);
      modeStructure.add(newInterval);
    }

    return modeStructure.sublist(degree - 1) +
        modeStructure.sublist(0, degree - 1);
  }

  // ChordType getChord(int degree, int numberOfSounds) {
  //   var structureId = getModeFromDegree(degree);
  //   var chordIntervals=[];
  //   for(var i =0; i<numberOfSounds; i++){

  //   }
  // }

  @override
  String toString() {
    return label;
  }
}

var SCALES = [
  ScaleType(label: "Echelle Diatonique", intervalsIds: ["int1","int2","int3","int4","int5","int6","int7"], modeNames: ["Ionien (Gamme majeure)","Dorien","Phrygien","Lydien","Mixolidien","Aéolien (Gamme mineure naturelle)","Locrien"]),
  ScaleType(label: "Echelle G#", intervalsIds: ["int1","int2","int3","int4","int5+","int6","int7"], modeNames: ["Ionien #5","Dorien #4","Phrygien majeur (3M)","Lydien 2M","Mixolidien #1","Mineur Harmonique (Aeolien 7M)","Locrien 6M"]),
  ScaleType(label: "Echelle Eb", intervalsIds: ["int1","int2","int3m","int4","int5","int6","int7"], modeNames: ["Mineur Mélodique (Ionien 3m) ","Dorien 2m","Phrygien b1","Mode de Bartok (Lydien 7m)","Mixolidien 6m","Aéolien b5","Altéré (Locrien b4)"]),
  ScaleType(label: "Echelle Ab", intervalsIds: ["int1","int2","int3","int4","int5","int6m","int7"], modeNames: ["Ionien 6m","Dorien b5","Phrygien b4","Lydien mineur (3m)","Mixolidien 2m","Aeolien b1","Locrien b7"]),
  ScaleType(label: "Echelle Gb", intervalsIds: ["int1","int2","int3","int4","int5-","int6","int7"], modeNames: ["Ionien b5","Dorien b4","Phrygien b3","Lydien 2m","Mixolidien b1","Aeolien b7","Locrien b6"]),

];

//Il faut qu'on voit comment marche les appels d'intervalle car il y a des modes un peu particuliers avec sixte diminuée ou tonique b1...

final SCALES_MAP =
    Map.fromIterable(SCALES, key: (item) => item.id, value: (item) => item);
