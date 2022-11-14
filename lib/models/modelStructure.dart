import 'package:eartraining/models/armor/armor.dart';
import 'package:eartraining/models/chords/chordStructure.dart';
import 'package:eartraining/models/intervals/intervalStructure.dart';
import 'package:eartraining/models/notes/note.dart';
import 'package:eartraining/models/notes/absoluteNote.dart';
import 'package:eartraining/models/scales/scaleStructure.dart';

abstract class ModelStructure<Model, AbstractModel> {
  String id;
  String label;
  Model projectOnNote(Note note);
  AbstractModel projectOnAbsoluteNote(AbsoluteNote note);
  Model getRandomModel();

  ModelStructure({
    required this.id,
    required this.label,
  });
}

final Map<String, Map> STRUCTURES_MAP = {
  "IntervalStructure": INTERVALS_MAP,
  "ChordStructure": CHORDS_MAP,
  "ScaleStructure": SCALES_MAP,
  "Armor": ARMORS_MAP
};
