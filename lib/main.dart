import 'dart:async';

import 'package:eartraining/exercicesMenus/chordsEarTrainingMenu.dart';
import 'package:eartraining/exercicesMenus/intervalsEarTrainingMenu.dart';
import 'package:eartraining/exercicesMenus/scalesEarTrainingMenu.dart';
import 'package:eartraining/home.dart';
import 'package:eartraining/mainScaffold.dart';
import 'package:eartraining/splashScreen.dart';
import 'dart:ui' as UI;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

//!!!TODOOOOOO
///réfléchir au concept de taonlité
///
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ear training cat',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.deepPurple,
        ),
        fontFamily: 'Segoe',
        textTheme: TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Color(0xFFFFF9E2),
          displayColor: Color(0xFFFFF9E2),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Color(0xFF618dac),
          ),
          foregroundColor: MaterialStateProperty.all<Color>(
            Color(0xFFFFF9E2),
          ),
        )),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Color(0xFFdae1d6),
          ),
          foregroundColor: MaterialStateProperty.all<Color>(
            Color(0xFF618dac),
          ),
        )),
      ),
      home: const MyHomePage(),
    );
  }
}

late Map<String, UI.Image> IMAGES;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool loaded = false;
  bool ready = false;
  @override
  initState() {
    super.initState();
    Timer(
        Duration(seconds: 1),
        () => setState(() {
              ready = true;
              loaded = true;
            }));

    // loadImageAsset("../assets/images/gKey.png").then((value) {
    //   gKey = value;
    // });
    // loadImageAsset("../assets/images/sharp.png").then((value) {
    //   sharpImage = value;
    //   setState(() {
    //     loaded = true;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return loaded && ready ? Home() : SplashScreen();
  }
}
