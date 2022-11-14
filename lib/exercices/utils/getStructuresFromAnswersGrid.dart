import 'package:eartraining/models/model.dart';
import 'package:eartraining/models/modelStructure.dart';
import 'package:flutter/foundation.dart';

List<Structure> getStructuresFromAnswersGrid<Structure extends ModelStructure>(
    List<List<dynamic>> answersGrid) {
  var structures = STRUCTURES_MAP[Structure.toString()];
  List<Structure> res = [];
  answersGrid.forEach((row) {
    row.forEach((el) {
      if (el == null) return;
      res.add(structures![el is String ? el : el["id"]]);
    });
  });
  return res;
}
