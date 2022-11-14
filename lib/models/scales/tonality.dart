import 'package:eartraining/models/absoluteModel.dart';
import 'package:eartraining/models/armor/armor.dart';
import 'package:eartraining/models/intervals/intervalStructure.dart';
import 'package:eartraining/models/modelStructure.dart';
import 'package:eartraining/models/notes/absoluteNote.dart';
import 'package:eartraining/models/notes/absoluteNotesCollection.dart';
import 'package:eartraining/models/notes/note.dart';
import 'package:eartraining/models/scales/absoluteScale.dart';
import 'package:eartraining/models/scales/scaleStructure.dart';

sortLetters(List<String> letters) {
  // LETTERS.asMap()
  letters.sort((a, b) => LETTERS.indexOf(a) - LETTERS.indexOf(b));
}

class Tonality {
  @override
  String id;
  String label;
  bool isMinor;
  AbsoluteNote tonic;
  Armor armor;
  AbsoluteScale absoluteScale;

  Tonality({required this.tonic, this.isMinor = false, required alteration})
      : label = "${tonic.id} ${isMinor ? "Mineure" : "Majeure"}",
        id = "${tonic.id}${isMinor ? "m" : ""}",
        absoluteScale = SCALES_MAP["diato-${isMinor ? "6" : "1"}"]!
            .projectOnAbsoluteNote(tonic),
        armor = Armor(alteration: alteration);
  // super(
  //     root: tonic,
  //     structure: SCALES_MAP["diato-${isMinor ? "6" : "1"}"]!);

  Armor getSheetData() {
    return armor;
  }
}

var _majors = {
  "Cb": -7,
  "Gb": -6,
  "Db": -5,
  "Ab": -4,
  "Eb": -3,
  "Bb": -2,
  "F": -1,
  "C": 0,
  "G": 1,
  "D": 2,
  "A": 3,
  "E": 4,
  "B": 5,
  "F#": 6,
  "C#": 7
};

var _minors = {
  "Ab": -7,
  "Eb": -6,
  "Bb": -5,
  "F": -4,
  "C": -3,
  "G": -2,
  "D": -1,
  "A": 0,
  "E": 1,
  "B": 2,
  "F#": 3,
  "C#": 4,
  "G#": 5,
  "D#": 6,
  "A#": 7
};

List<Tonality> getAllTonalities() {
  List<Tonality> res = [];
  _majors.forEach((key, value) {
    res.add(Tonality(
        isMinor: false, tonic: ABSOLUTE_NOTES_MAP[key]!, alteration: value));
  });
  _minors.forEach((key, value) {
    res.add(Tonality(
        isMinor: true, tonic: ABSOLUTE_NOTES_MAP[key]!, alteration: value));
  });
  return res;
}

List<Tonality> TONALITIES = getAllTonalities();

final TONALITIES_MAP = Map<String, Tonality>.fromIterable(TONALITIES,
    key: (item) => item.id, value: (item) => item);
