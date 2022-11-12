import 'package:eartraining/models/armor/armor.dart';
import 'package:eartraining/models/chords/chordStructure.dart';
import 'package:eartraining/models/intervals/intervalStructure.dart';
import 'package:eartraining/models/scales/scaleStructure.dart';

enum ExercisableType {
  IntervalStructure,
  ChordStructure,
  ScaleStructure,
  Armor,
}

final Map<String, Map> EXERCISABLES_MAP = {
  "IntervalStructure": INTERVALS_MAP,
  "ChordStructure": CHORDS_MAP,
  "ScaleStructure": SCALES_MAP,
  "Armor": ARMORS_MAP
};
