import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///clé, notes dans l'ordre
///plus tard liste de mesures, temps etc...

class Staff extends StatelessWidget {
  const Staff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: Painter(),
      child: const SizedBox.square(
        dimension: 200.0,
      ),
    );
  }
}

class Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
        Offset(30, 30), Offset(130, 130), Paint()..color = Colors.blue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
