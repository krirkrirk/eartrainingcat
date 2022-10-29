import 'package:eartraining/interval.dart';
import 'package:eartraining/intervalType.dart';
import 'package:eartraining/intervalsEarTrainingExercice.dart';
import 'package:eartraining/note.dart';
import 'package:eartraining/utilities/randomFrom.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var intervalTypes = ALL_INTERVAL_TYPES
      .where((interval) => interval.id == "2m" || interval.id == "3")
      .toList();
  void onClick() {
    var intervalType = ALL_INTERVAL_TYPES[0];
    var interval = intervalType.getRandomInterval();
    debugPrint(interval.toString());
    interval.play(playType: PlayType.harmonic);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: IntervalsEarTrainingExercice(
            intervalTypes: intervalTypes,
            playTypes: [PlayType.harmonic, PlayType.ascendant]),
      ),
    );
  }
}
