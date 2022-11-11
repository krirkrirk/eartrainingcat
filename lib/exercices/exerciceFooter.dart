import 'package:flutter/cupertino.dart';

class ExerciceFooter extends StatefulWidget {
  int rightAnswers;
  int maxAnswers;
  ExerciceFooter(
      {Key? key, required this.rightAnswers, required this.maxAnswers})
      : super(key: key);

  @override
  _ExerciceFooterState createState() => _ExerciceFooterState();
}

class _ExerciceFooterState extends State<ExerciceFooter> {
  int rightAnswers = 0;
  int maxAnswers = 3;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
            "Bonne réponse : $rightAnswers/$maxAnswers  |  Ratio : ${(rightAnswers / maxAnswers * 100).round()}%"));
  }
}
