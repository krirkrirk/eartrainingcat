import 'package:eartraining/models/notes/note.dart';

abstract class TheoricTypeModel<T> {
  String id;
  T fromBass(Note note);
  T getRandom();
  TheoricTypeModel({required this.id});
}
