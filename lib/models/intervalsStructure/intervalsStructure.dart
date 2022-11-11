import 'package:eartraining/models/intervals/intervalType.dart';
import 'package:flutter/cupertino.dart';

class IntervalsStructure {
  List<IntervalType> intervals = [];

  IntervalsStructure({required this.intervals});

  IntervalsStructure.fromIds(intervalIds) {
    intervals = [];
    intervalIds.forEach((id) {
      intervals.add(INTERVALS_MAP[id]!);
    });
  }

  IntervalsStructure translation(int degree) {
    assert(degree > 0, "degrees start at 1");
    if (degree == 1) return this;
    var newRoot = intervals[degree - 1];
    List<IntervalType> res = _getIntervalsFromDegree(newRoot);
    return IntervalsStructure(
        intervals: res.sublist(degree - 1) + res.sublist(0, degree - 1));
  }

  IntervalsStructure inversion(int degree) {
    assert(degree < intervals.length, "0 est l'EF");
    if (degree == 0) return this;
    var newRoot = intervals[intervals.length - degree];
    List<IntervalType> res = _getIntervalsFromDegree(newRoot);
    return IntervalsStructure(
        intervals: res.sublist(degree - 1) + res.sublist(0, degree - 1));
  }

  List<IntervalType> _getIntervalsFromDegree(IntervalType newRoot) {
    var res = <IntervalType>[];
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
