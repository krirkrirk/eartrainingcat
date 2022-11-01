import 'package:eartraining/notes/note.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///clé, notes dans l'ordre
///plus tard liste de mesures, temps etc...

class Staff extends StatelessWidget {
  Staff({Key? key}) : super(key: key);

  final song = [
    [NOTES_MAP["C1"]!, NOTES_MAP["E1"]!, NOTES_MAP["G1"]!],
    [NOTES_MAP["G1"]!, NOTES_MAP["B1"]!, NOTES_MAP["D2"]!]
  ];

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: Painter(song: song),
      child: const SizedBox.square(
        dimension: 240.0,
      ),
    );
  }
}

class Painter extends CustomPainter {
  List<List<Note>> song;
  Painter({required this.song});

  @override
  var notePosition = 18;
  void paint(Canvas canvas, Size size) {
    var sheetHeight = size.height;
    var sheetWidth = size.width;
    var deltaH = sheetHeight / 12;
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 1;
    for (var i = 3; i < 8; i++) {
      canvas.drawLine(
          Offset(0, i * deltaH), Offset(sheetWidth, i * deltaH), paint);
    }
    for (var i = 0; i < song.length; i++) {
      var x = (i + 1) * 50.0;
      var time = song[i];
      for (var note in time) {
        var y = ((12) * 2 - note.positionInG) * deltaH / 2;
        canvas.drawCircle(Offset(x, y), deltaH / 2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant Painter oldDelegate) {
    return false;
  }
}
