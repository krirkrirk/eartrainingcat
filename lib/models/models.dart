import 'package:eartraining/models/chords/chordType.dart';
import 'package:eartraining/models/intervals/intervalType.dart';

enum ModelTypes {
  NoteType,
  IntervalType,
  ChordType,
  ScaleType,
}

Map<String, Map> modelMaps = {
  "IntervalType": INTERVALS_MAP,
  "ChordType": CHORDS_MAP
};
