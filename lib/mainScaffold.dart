import 'package:flutter/material.dart';

class MainScaffold extends StatelessWidget {
  Widget child;
  AppBar? appBar;
  MainScaffold({Key? key, required this.child, this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
              radius: 0.4, colors: [Color(0xFFFFF9E2), Color(0xFF2f5d95)]),
        ),
        child: child,
      ),
    );
  }
}
