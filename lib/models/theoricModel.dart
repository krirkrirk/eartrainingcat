import 'package:eartraining/models/notes/note.dart';
import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/models/theoricTypeModel.dart';

abstract class TheoricModel<Type extends TheoricTypeModel> {
  NotesCollection notesCollection;
  Type type;
  Note root;
  void play(PlayType playType);
  void stop() {
    notesCollection.stop();
  }

  TheoricModel({required this.notesCollection, required this.type})
      : root = notesCollection.notes[0];

  // play([playType]) {
  //   notesCollection.play(playType: playType);
  // }
}
