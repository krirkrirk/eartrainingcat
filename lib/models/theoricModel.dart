import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/models/theoricTypeModel.dart';

abstract class TheoricModel {
  // type,
  // notescollection,
  // name,
  // root,
  // tostring
  final NotesCollection notesCollection;
  final TheoricTypeModel theoricType;
  TheoricModel({required this.notesCollection, required this.theoricType});

  play([playType]) {
    notesCollection.play(playType: playType);
  }
}
