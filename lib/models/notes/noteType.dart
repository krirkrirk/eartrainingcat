import 'package:eartraining/models/notes/note.dart';
import 'package:flutter/cupertino.dart';

List<String> LETTERS = ["C", "D", "E", "F", "G", "A", "B"];
List<int> structure = [0, 2, 4, 5, 7, 9, 11];
Map<String, List<dynamic>> _alterations = {
  "bb": [-2, "double_bemol"],
  "b": [-1, "bemol"],
  "": [0, ""],
  "#": [1, "sharp"],
  "##": [2, "double_sharp"],
};

class Alteration {
  int semitones;
  String label;
  String imgId;
  Alteration({required this.label})
      : semitones = _alterations[label]![0],
        imgId = _alterations[label]![1];
}

///NoteType
class NoteType {
  String letter;
  Alteration alteration;
  String id;

  int octaveIncrement = 0;

  ///C = 0, B = 6
  int diatonicPosition;

  ///C = 0, B = 11
  int chromaticPosition;

  bool isChromatic = true;
  NoteType({required this.letter, required this.alteration})
      : id = letter + alteration.label,
        diatonicPosition = LETTERS.indexOf(letter),
        chromaticPosition =
            (structure[LETTERS.indexOf(letter)] + alteration.semitones) % 12 {
    isChromatic = alteration.label != "bb" &&
        alteration.label != "##" &&
        !["Cb", "E#", "B#", "Fb"].contains(id);
    octaveIncrement = letter == "B" && alteration.semitones > 0
        ? 1
        : letter == "C" && alteration.semitones < 0
            ? -1
            : 0;
  }
}

List<NoteType> _getNotesTypes() {
  List<NoteType> res = [];
  LETTERS.forEach(((letter) {
    _alterations.forEach((key, value) {
      res.add(NoteType(letter: letter, alteration: Alteration(label: key)));
    });
  }));
  return res;
}

List<NoteType> NOTES_TYPES = _getNotesTypes();
var NOTES_TYPES_MAP = Map<String, NoteType>.fromIterable(NOTES_TYPES,
    key: (item) => item.id, value: (item) => item);
