import 'package:eartraining/models/armor/armor.dart';
import 'package:eartraining/models/chords/chordStructure.dart';
import 'package:eartraining/models/model.dart';
import 'package:eartraining/models/notes/note.dart';
import 'package:eartraining/models/notes/absoluteNotesCollection.dart';
import 'package:eartraining/models/notes/absoluteNote.dart';

import 'package:eartraining/models/notes/notesCollection.dart';
import 'package:eartraining/models/scales/scaleStructure.dart';
import 'package:eartraining/models/absoluteModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:eartraining/models/armor/armor.dart';

class AbsoluteScale implements AbsoluteModel<ScaleStructure> {
  @override
  ScaleStructure structure;
  @override
  AbsoluteNotesCollection absoluteNotesCollection;
  @override
  String? id;
  @override
  AbsoluteNote root;
  AbsoluteScale({required this.structure, required this.root})
      : absoluteNotesCollection = AbsoluteNotesCollection.fromRootAndStructure(
            root, structure.structure),
        id = root.id + structure.label;

  Armor getArmor() {
    var count = 0;
    absoluteNotesCollection.absoluteNotes.forEach((element) {
      count += element.alteration.semitones;
    });
    return Armor(alteration: count);
  }

  @override
  String toString() {
    return absoluteNotesCollection.toString();
  }
}
