import 'package:flutter/material.dart';

class EndExerciceDialog extends StatelessWidget {
  int maxAnswers;
  int rightAnswers;
  void Function() onTryAgain;
  void Function() onBack;
  EndExerciceDialog(
      {Key? key,
      required this.rightAnswers,
      required this.maxAnswers,
      required this.onTryAgain,
      required this.onBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Score'),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text("${(rightAnswers / maxAnswers * 100).round()}%"),
            Text('$rightAnswers/$maxAnswers'),
            Text('Bien joué !'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Réessayer'),
          onPressed: onTryAgain,
        ),
        TextButton(
          child: const Text('Retour'),
          onPressed: onBack,
        ),
      ],
    );
  }
}
