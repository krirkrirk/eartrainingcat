import 'package:eartraining/models/intervals/intervalType.dart';
import 'package:eartraining/models/notes/noteType.dart';

var _sharps = ["F", "C", "G", "D", "A", "E", "B"];
var circleOfSharps = _sharps.map((e) => NOTES_TYPES_MAP["$e#"]!);
var _bemols = ["B", "E", "A", "D", "G", "C", "F"];
var circleOfBemols = _sharps.map((e) => NOTES_TYPES_MAP["${e}b"]!);

class Armor {
  String id;
  int alteration; //+3 = 3# ; -2 = 2b
  NoteType majorTona;
  NoteType minorTona;
  List<NoteType> notes;
  Armor({required this.alteration, required this.majorTona})
      : id = alteration == 0
            ? "0"
            : alteration > 0
                ? "$alteration#"
                : "${alteration.abs()}b",
        minorTona = INTERVALS_MAP["6"]!.getSecondNote(majorTona),
        notes = alteration > 0
            ? circleOfSharps.toList().sublist(0, alteration)
            : circleOfBemols.toList().sublist(0, alteration.abs());
}

var ARMORS = [
  Armor(alteration: -7, majorTona: NOTES_TYPES_MAP["Cb"]!),
  Armor(alteration: -6, majorTona: NOTES_TYPES_MAP["Gb"]!),
  Armor(alteration: -5, majorTona: NOTES_TYPES_MAP["Db"]!),
  Armor(alteration: -4, majorTona: NOTES_TYPES_MAP["Ab"]!),
  Armor(alteration: -3, majorTona: NOTES_TYPES_MAP["Eb"]!),
  Armor(alteration: -2, majorTona: NOTES_TYPES_MAP["Bb"]!),
  Armor(alteration: -1, majorTona: NOTES_TYPES_MAP["F"]!),
  Armor(alteration: 0, majorTona: NOTES_TYPES_MAP["C"]!),
  Armor(alteration: 1, majorTona: NOTES_TYPES_MAP["G"]!),
  Armor(alteration: 2, majorTona: NOTES_TYPES_MAP["D"]!),
  Armor(alteration: 3, majorTona: NOTES_TYPES_MAP["A"]!),
  Armor(alteration: 4, majorTona: NOTES_TYPES_MAP["E"]!),
  Armor(alteration: 5, majorTona: NOTES_TYPES_MAP["B"]!),
  Armor(alteration: 6, majorTona: NOTES_TYPES_MAP["F#"]!),
  Armor(alteration: 7, majorTona: NOTES_TYPES_MAP["C#"]!)
];

final ARMORS_MAP = Map<String, Armor>.fromIterable(ARMORS,
    key: (item) => item.id, value: (item) => item);
