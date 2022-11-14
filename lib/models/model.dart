import 'package:eartraining/models/notes/note.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/models/modelStructure.dart';

abstract class Model<Structure extends ModelStructure> {
  NotesCollection notesCollection;
  Structure structure;
  Note bass;
  void play(PlayType playType);
  void stop() {
    notesCollection.stop();
  }

  List<List<Note>> getSheetData(bool isHarmonic);

  Model({required this.notesCollection, required this.structure})
      : bass = notesCollection.notes[0];
}
