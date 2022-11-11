import 'package:audioplayers/audioplayers.dart';
import 'package:eartraining/models/notes/noteType.dart';
import 'package:flutter/cupertino.dart';

var maxSoundNumber = 37;
var maxPositionInG = 22;

class Note {
  NoteType type;
  String id;
  int octave; //C0 to C3
  int soundNumber; // C0 is 1
  int positionInG; // C0 is 1
  AudioPlayer player;

  Note({
    required this.type,
    required this.octave,
  })  : id = type.id + octave.toString(),
        soundNumber =
            1 + (octave + type.octaveIncrement) * 12 + type.chromaticPosition,
        positionInG = 1 + (octave) * 7 + type.diatonicPosition,
        player = AudioPlayer() {
    player.setSource(AssetSource('../assets/sounds/$soundNumber.mp3'));
  }

  AudioPlayer play() {
    player.play(AssetSource('../assets/sounds/$soundNumber.mp3'),
        position: Duration(seconds: 1));
    return player;
  }

  @override
  String toString() {
    return id;
  }
}

List<Note> getAllNotes() {
  var res = <Note>[];
  for (var octave = 0; octave < 3; octave++) {
    NOTES_TYPES.forEach((noteType) {
      var id = noteType.id + octave.toString();
      if ([
        "Cbb0",
        "Cb0",
        "B##2",
      ].contains(id)) return;
      res.add(Note(octave: octave, type: noteType));
    });
  }
  res.add(Note(type: NOTES_TYPES_MAP["C"]!, octave: 3));
  res.add(Note(type: NOTES_TYPES_MAP["Cb"]!, octave: 3));
  res.add(Note(type: NOTES_TYPES_MAP["Cbb"]!, octave: 3));
  res.forEach((note) => debugPrint(
      "$note , sound ${note.soundNumber} , pos ${note.positionInG}"));
  return res;
}

var NOTES = getAllNotes();
var NOTES_MAP = Map.fromIterable(NOTES,
    key: (item) => item.fullName, value: (item) => item as Note);
