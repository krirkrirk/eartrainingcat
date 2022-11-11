import 'package:eartraining/models/models.dart';

List<T> getTypesFromAnswersGrid<T>(List<List<dynamic>> answersGrid) {
  var modelMap = MODELS_MAP[T.toString()];
  List<T> res = [];
  answersGrid.forEach((row) {
    row.forEach((el) {
      if (el == null) return;
      res.add(modelMap![el is String ? el : el["id"]]);
    });
  });
  return res;
}
