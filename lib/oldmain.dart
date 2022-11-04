import 'package:eartraining/exercicesMenus/chordsEarTrainingMenu.dart';
import 'package:eartraining/exercicesMenus/intervalsEarTrainingMenu.dart';
import 'package:eartraining/exercicesMenus/scalesEarTrainingMenu.dart';
import 'dart:ui' as UI;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// load the image async and then draw with `canvas.drawImage(image, Offset.zero, Paint());`
Future<UI.Image> loadImageAsset(String assetName) async {
  final data = await rootBundle.load(assetName);
  return decodeImageFromList(data.buffer.asUint8List());
}

late UI.Image sharpImage;
void main() {
  // loadImageAsset("../../assets/images/sharp.png")
  // .then((value) => sharpImage = value);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ear training cat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Ear training cat'),
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
  @override
  initState() {
    super.initState();
    loadImageAsset("../../assets/images/sharp.png")
        .then((value) => sharpImage = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.indigo[900]!,
              Colors.indigo[700]!,
              Colors.indigo[600]!,
              Colors.indigo[400]!,
            ],
          )),
          child: Center(
              child: Column(children: [
            ElevatedButton(
              child: const Text("Intervals"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const IntervalsEarTrainingMenu(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text("Chords"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ChordsEarTrainingMenu(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text("Scales"),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ScalesEarTrainingMenu(),
                  ),
                );
              },
            )
          ])),
        ));
  }
}
