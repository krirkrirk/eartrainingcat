import 'package:eartraining/models/notes/absoluteNote.dart';
import 'package:eartraining/models/notes/note.dart';
import 'package:eartraining/models/notes/notesCollection.dart';

abstract class Exercisable<T> {
  //liste d'objets
  String id;
  void Function()? play(PlayType playtype);
  void Function()? stop();

  List<List<Note>> getSheetData();
  T instantiate();
  T projectOnNote(Note note);
  AbsoluteNote? absoluteRoot;
  Note? root;

  Exercisable({required this.id});
}
