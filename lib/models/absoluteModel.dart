import 'package:eartraining/models/notes/absoluteNote.dart';
import 'package:eartraining/models/notes/absoluteNotesCollection.dart';
import 'package:eartraining/models/notes/note.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/models/modelStructure.dart';

abstract class AbsoluteModel<Structure extends ModelStructure> {
  AbsoluteNotesCollection absoluteNotesCollection;
  Structure structure;
  AbsoluteNote root;
  String? id;

  AbsoluteModel(
      {required this.absoluteNotesCollection, required this.structure})
      : root = absoluteNotesCollection.absoluteNotes[0];
}
