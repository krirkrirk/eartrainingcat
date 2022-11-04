import 'package:eartraining/mainScaffold.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  // late AnimationController controller;
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
            child: Column(children: const [
          Text("Musical", style: TextStyle(fontFamily: "Forte", fontSize: 40)),
          Text("Training", style: TextStyle(fontFamily: "Forte", fontSize: 40)),
          Text("Cat", style: TextStyle(fontFamily: "Forte", fontSize: 40)),
        ])),
        Expanded(
            child: Image.asset(
          "../assets/images/cat.png",
        )),
        Expanded(
            child: Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
              Text("Watch out !", style: TextStyle(fontSize: 20)),
              Text("An elegant cat is discreetly looking at you.",
                  style: TextStyle(fontSize: 20)),
              CircularProgressIndicator(
                value: null,
                color: Colors.white,
                semanticsLabel: 'Circular progress indicator',
              )
            ])))
      ])),
    );
  }
}
