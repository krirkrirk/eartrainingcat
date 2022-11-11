import 'package:eartraining/models/armor/armor.dart';
import 'package:eartraining/models/chords/chordType.dart';
import 'package:eartraining/models/intervals/intervalType.dart';
import 'package:eartraining/models/scales/scaleType.dart';

enum ModelTypes {
  NoteType,
  IntervalType,
  ChordType,
  ScaleType,
  Armor,
}

Map<String, Map> MODELS_MAP = {
  "IntervalType": INTERVALS_MAP,
  "ChordType": CHORDS_MAP,
  "ScaleType": SCALES_MAP,
  "Armor": ARMORS_MAP
};
