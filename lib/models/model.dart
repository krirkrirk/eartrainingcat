import 'package:eartraining/models/notes/note.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/models/modelStructure.dart';

abstract class Model<Structure extends ModelStructure> {
  NotesCollection notesCollection;
  Structure structure;
  Note root;
  void play(PlayType playType);
  void stop() {
    notesCollection.stop();
  }

  Model({required this.notesCollection, required this.structure})
      : root = notesCollection.notes[0];
}
