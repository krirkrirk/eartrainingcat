import 'package:eartraining/models/intervals/intervalStructure.dart';
import 'package:eartraining/models/intervalsStructure/intervalsStructure.dart';
import 'package:flutter/foundation.dart';

class Ladder {
  IntervalsStructure structure;
  String label;
  String id;
  int numberOfSounds;
  List<String> modes;
  Ladder(
      {required List<String> intervalsIds,
      required this.label,
      required this.id,
      required this.modes})
      : numberOfSounds = intervalsIds.length,
        structure = IntervalsStructure.fromIds(intervalsIds);

  @override
  String toString() {
    return label;
  }
}

var LADDERS = [
  Ladder(label: "Echelle Diatonique", id: "diato", intervalsIds: [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
  ], modes: [
    "Ionien (Gamme majeure)",
    "Dorien",
    "Phrygien",
    "Lydien",
    "Mixolidien",
    "Aéolien (Gamme mineure naturelle)",
    "Locrien"
  ]),
  Ladder(label: "Echelle G#", id: "G#", intervalsIds: [
    "1",
    "2",
    "3",
    "4",
    "5+",
    "6",
    "7"
  ], modes: [
    "Ionien #5",
    "Dorien #4",
    "Phrygien majeur (3M)",
    "Lydien 2M",
    "Mixolidien #1",
    "Mineur Harmonique (Aeolien 7M)",
    "Locrien 6M"
  ]),
  Ladder(label: "Echelle Eb", id: "Eb", intervalsIds: [
    "1",
    "2",
    "3m",
    "4",
    "5",
    "6",
    "7"
  ], modes: [
    "Mineur Mélodique (Ionien 3m) ",
    "Dorien 2m",
    "Phrygien b1",
    "Mode de Bartok (Lydien 7m)",
    "Mixolidien 6m",
    "Aéolien b5",
    "Altéré (Locrien b4)"
  ]),
  Ladder(label: "Echelle Ab", id: "Ab", intervalsIds: [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6m",
    "7"
  ], modes: [
    "Ionien 6m",
    "Dorien b5",
    "Phrygien b4",
    "Lydien mineur (3m)",
    "Mixolidien 2m",
    "Aeolien b1",
    "Locrien b7"
  ]),
  Ladder(label: "Echelle Gb", id: "Gb", intervalsIds: [
    "1",
    "2",
    "3",
    "4",
    "5-",
    "6",
    "7"
  ], modes: [
    "Ionien b5",
    "Dorien b4",
    "Phrygien b3",
    "Lydien 2m",
    "Mixolidien b1",
    "Aeolien b7",
    "Locrien b6"
  ]),
];
