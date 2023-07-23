import 'package:audioplayers/audioplayers.dart';
import 'package:eartraining/models/notes/absoluteNote.dart';
import 'package:flutter/cupertino.dart';

var maxSoundNumber = 37;
var maxPositionInG = 22;

class Note {
  AbsoluteNote absoluteNote;
  String id;
  int octave; //C0 to C3
  int soundNumber; // C0 is 1
  int positionInG; // C0 is 1
  int positionInF; //C0 is 1
  AudioPlayer player;
  Note({
    required this.absoluteNote,
    required this.octave,
  })  : id = absoluteNote.id + octave.toString(),
        soundNumber = 1 +
            (octave + absoluteNote.octaveIncrement) * 12 +
            absoluteNote.chromaticPosition,
        positionInG = 1 + (octave) * 7 + absoluteNote.diatonicPosition,
        positionInF = 1 + (octave) * 7 + absoluteNote.diatonicPosition - 2,
        player = AudioPlayer() {
    player.setSource(AssetSource('sounds/$soundNumber.mp3'));
  }

  AudioPlayer play() {
    player.play(AssetSource('sounds/$soundNumber.mp3'),
        volume: 4.0, position: Duration(seconds: 1));
    return player;
  }

  List<List<Note>> getSheetData() {
    return [
      [this]
    ];
  }

  @override
  String toString() {
    return id;
  }
}

List<Note> getAllNotes() {
  var res = <Note>[];
  for (var octave = 0; octave < 3; octave++) {
    ABSOLUTE_NOTES.forEach((noteType) {
      var id = noteType.id + octave.toString();
      if ([
        "Cbb0",
        "Cb0",
        "B##2",
      ].contains(id)) return;
      res.add(Note(octave: octave, absoluteNote: noteType));
    });
  }
  res.add(Note(absoluteNote: ABSOLUTE_NOTES_MAP["C"]!, octave: 3));
  res.add(Note(absoluteNote: ABSOLUTE_NOTES_MAP["Cb"]!, octave: 3));
  res.add(Note(absoluteNote: ABSOLUTE_NOTES_MAP["Cbb"]!, octave: 3));
  // res.forEach((note) => debugPrint(
  //     "$note , sound ${note.soundNumber} , pos ${note.positionInG}"));
  return res;
}

var NOTES = getAllNotes();
var NOTES_MAP = Map.fromIterable(NOTES,
    key: (item) => item.id, value: (item) => item as Note);
