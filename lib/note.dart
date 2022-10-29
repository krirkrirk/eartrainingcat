import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';

var maxSoundNumber = 37;
var maxPositionInG = 22;

var notesIntervals = <String, int>{
  "C": 0,
  "D": 2,
  "E": 4,
  "F": 5,
  "G": 7,
  "A": 9,
  "B": 11
};

var alterations = <String, int>{
  "bb": -2,
  "b": -1,
  "": 0,
  "#": 1,
  "##": 2,
};

class Note {
  String name;
  String alteration;
  String fullName;
  int octave; //C0 to C3
  int soundNumber; // C0 is 0
  int positionInG;

  bool isChromatic;
  Note(
      {required this.name,
      required this.alteration,
      required this.octave,
      required this.soundNumber,
      required this.fullName,
      required this.positionInG,
      required this.isChromatic});

  @override
  String toString() {
    return fullName;
  }

  AudioPlayer getPlayer() {
    var player = AudioPlayer();
    player.setSource(AssetSource('../assets/sounds/$soundNumber.mp3'));
    return player;
  }

  AudioPlayer play() {
    var player = AudioPlayer();
    player.play(AssetSource('../assets/sounds/$soundNumber.mp3'));
    return player;
  }
}

List<Note> getAllNotes() {
  var res = <Note>[];
  for (var octave = 0; octave < 3; octave++) {
    ["C", "D", "E", "F", "G", "A", "B"].asMap().forEach((letterIndex, letter) {
      var noteDistance = notesIntervals[letter];
      for (var alteration in ["bb", "b", "", "#", "##"]) {
        if (letter == "E" && alteration == "##") continue;
        if (letter == "B" && alteration == "##") continue;
        if (octave == 0 &&
            letter == "C" &&
            (alteration == "bb" || alteration == "b")) continue;
        if (octave == 2 && (letter == "B" && (alteration == "##"))) continue;

        var alterationDifference = alterations[alteration];
        res.add(Note(
            alteration: alteration,
            name: letter,
            octave: octave,
            isChromatic:
                (alteration == "#" || alteration == "" || alteration == "b") &&
                    !(letter == "E" && alteration == "#" ||
                        letter == "B" && alteration == "#" ||
                        letter == "F" && alteration == "b" ||
                        letter == "C" && alteration == "b"),
            fullName: letter + alteration + octave.toString(),
            positionInG: octave * 7 + letterIndex,
            soundNumber:
                1 + octave * 12 + noteDistance! + alterationDifference!));
      }
    });
  }
  res.add(Note(
      alteration: "",
      name: "C",
      octave: 3,
      fullName: "C3",
      positionInG: 0,
      isChromatic: true,
      soundNumber: 37));
  res.add(Note(
      alteration: "b",
      name: "C",
      octave: 3,
      fullName: "Cb3",
      positionInG: 0,
      isChromatic: false,
      soundNumber: 36));
  res.add(Note(
      alteration: "bb",
      name: "C",
      octave: 3,
      fullName: "Cbb3",
      positionInG: 0,
      isChromatic: false,
      soundNumber: 35));
  // for (var note in res) {
  //   debugPrint(note.fullName + note.positionInG.toString());
  // }
  return res;
}

var notes = getAllNotes();
