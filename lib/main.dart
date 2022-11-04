import 'package:eartraining/exercicesMenus/chordsEarTrainingMenu.dart';
import 'package:eartraining/exercicesMenus/intervalsEarTrainingMenu.dart';
import 'package:eartraining/exercicesMenus/scalesEarTrainingMenu.dart';
import 'package:eartraining/home.dart';
import 'package:eartraining/mainScaffold.dart';
import 'package:eartraining/splashScreen.dart';
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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ear training cat',
      theme: ThemeData(
        fontFamily: 'Segoe',
        textTheme: TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Color(0xFFFFF9E2),
          displayColor: Colors.blue,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool ready = false;
  @override
  initState() {
    super.initState();
    loadImageAsset("../../assets/images/sharp.png").then((value) {
      sharpImage = value;
      setState(() {
        ready = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return !ready ? SplashScreen() : Home();
  }
}
