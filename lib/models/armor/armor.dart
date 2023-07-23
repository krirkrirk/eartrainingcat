import 'package:eartraining/models/notes/absoluteNotesCollection.dart';
import 'package:eartraining/models/notes/absoluteNote.dart';
import 'package:eartraining/models/notes/note.dart';
import 'package:eartraining/models/notes/notesCollection.dart';

var _sharps = ["F#", "C#", "G#", "D#", "A#", "E#", "B#"];
var _staffSharps = ["F#2", "C#2", "G#2", "D#2", "A#1", "E#2", "B#1"];
var _bemols = ["Bb", "Eb", "Ab", "Db", "Gb", "Cb", "Fb"];
var _staffBemols = ["Bb1", "Eb2", "Ab1", "Db2", "Gb1", "Cb2", "Fb1"];

class Armor {
  String id;
  int alteration; //+3 = 3# ; -2 = 2b
  AbsoluteNotesCollection notesAltered;
  NotesCollection staffNotes;
  Armor({required this.alteration})
      : id = alteration == 0
            ? "0"
            : alteration > 0
                ? "$alteration#"
                : "${alteration.abs()}b",
        staffNotes = alteration > 0
            ? NotesCollection(
                notes: _staffSharps
                    .sublist(0, alteration)
                    .map((e) => NOTES_MAP[e]!)
                    .toList())
            : NotesCollection(
                notes: _staffBemols
                    .sublist(0, alteration.abs())
                    .map((e) => NOTES_MAP[e]!)
                    .toList()),
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
