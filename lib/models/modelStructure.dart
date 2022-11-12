import 'package:eartraining/models/notes/note.dart';
import 'package:eartraining/models/notes/absoluteNote.dart';

abstract class ModelStructure<Model, AbstractModel> {
  String id;
  String label;
  Model projectOnNote(Note note);
  AbstractModel projectOnAbsoluteNote(AbsoluteNote note);
  Model getRandomModel();

  ModelStructure({required this.id, required this.label});
}
