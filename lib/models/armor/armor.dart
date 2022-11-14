import 'package:eartraining/models/notes/absoluteNotesCollection.dart';
import 'package:eartraining/models/notes/absoluteNote.dart';

var _sharps = ["F#", "C#", "G#", "D#", "A#", "E#", "B#"];
var _bemols = ["Bb", "Eb", "Ab", "Db", "Gb", "Cb", "Fb"];

class Armor {
  String id;
  int alteration; //+3 = 3# ; -2 = 2b
  AbsoluteNotesCollection notesAltered;

  Armor({required this.alteration})
      : id = alteration == 0
            ? "0"
            : alteration > 0
                ? "$alteration#"
                : "${alteration.abs()}b",
        notesAltered = alteration > 0
            ? AbsoluteNotesCollection(
                absoluteNotes: _sharps
                    .sublist(0, alteration)
                    .map((e) => ABSOLUTE_NOTES_MAP[e]!)
                    .toList())
            : AbsoluteNotesCollection(
                absoluteNotes: _bemols
                    .sublist(0, alteration.abs())
                    .map((e) => ABSOLUTE_NOTES_MAP[e]!)
                    .toList());
}

var ARMORS = List.generate(15, (index) => Armor(alteration: index - 7));

final ARMORS_MAP = Map<String, Armor>.fromIterable(ARMORS,
    key: (item) => item.id, value: (item) => item);
