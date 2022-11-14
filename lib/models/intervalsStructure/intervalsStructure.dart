import 'dart:math';

import 'package:eartraining/models/intervals/intervalStructure.dart';
import 'package:flutter/cupertino.dart';

class IntervalsStructure {
  List<IntervalStructure> intervals = [];
  List<String> ids = [];
  IntervalsStructure({required this.intervals})
      : ids = intervals.map((e) => e.id).toList();

  IntervalsStructure.fromIds(intervalIds) {
    ids = intervalIds;
    intervals = [];
    ids.forEach((id) {
      intervals.add(INTERVALS_MAP[id]!);
    });
  }

  IntervalsStructure translation(int degree) {
    assert(degree > 0, "degrees start at 1");
    if (degree == 1) return this;
    var newRoot = intervals[degree - 1];
    List<IntervalStructure> res = _getIntervalsFromDegree(newRoot);
    return IntervalsStructure(
        intervals: res.sublist(degree - 1) + res.sublist(0, degree - 1));
  }

  IntervalsStructure inversion(int degree) {
    assert(degree < intervals.length, "0 est l'EF");
    if (degree == 0) return this;
    var newRoot = intervals[intervals.length - degree];
    List<IntervalStructure> res = _getIntervalsFromDegree(newRoot);
    return IntervalsStructure(
        intervals: res.sublist(degree - 1) + res.sublist(0, degree - 1));
  }

  List<IntervalStructure> _getIntervalsFromDegree(IntervalStructure newRoot) {
    var res = <IntervalStructure>[];
    for (var intervalType in intervals) {
      var newType = (intervalType.type - newRoot.type) % 7 + 1;
      var newSemitones = (intervalType.semitones - newRoot.semitones) % 12;
      var newInterval = INTERVALS.firstWhere((element) =>
          element.type == newType && element.semitones == newSemitones);
      res.add(newInterval);
    }
    return res;
  }

  @override
  String toString() {
    return "intervals structure";
  }
}
