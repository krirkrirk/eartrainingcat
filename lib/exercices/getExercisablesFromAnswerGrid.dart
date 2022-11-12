import 'package:eartraining/models/exercisable/exercisable.dart';
import 'package:eartraining/models/exercisables.dart';
import 'package:flutter/foundation.dart';

List<Exercisable> getExercisablesFromAnswersGrid<ExercisableType>(
    List<List<dynamic>> answersGrid) {
  debugPrint(ExercisableType.toString());
  var exercisables = EXERCISABLES_MAP[ExercisableType.toString()];
  List<Exercisable> res = [];
  answersGrid.forEach((row) {
    row.forEach((el) {
      if (el == null) return;
      res.add(exercisables![el is String ? el : el["id"]]);
    });
  });
  return res;
}
