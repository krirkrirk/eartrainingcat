import 'dart:math';

import 'package:eartraining/main.dart';
import 'package:eartraining/notes/note.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui' as UI;

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/painting.dart' show decodeImageFromList;

class Staff extends StatelessWidget {
  List<List<Note>> song;
  Staff({Key? key, required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: Painter(song: song),
      child: const SizedBox(
        width: 480.0,
        height: 150.0,
      ),
    );
  }
}

class Painter extends CustomPainter {
  List<List<Note>> song;
  bool loaded = false;
  Painter({required this.song});

  void drawNotes(Canvas canvas, Size size) {
    var sheetHeight = size.height;
    var deltaH = sheetHeight / 12;

    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 1;

    var sheetWidth = size.width;

    var barElementWidth = max(sheetWidth / 10, 20);

    var clefWidth = 30;
    var barStart = clefWidth + 20;

    for (var i = 0; i < song.length; i++) {
      var barElementStart = barStart + i * barElementWidth;
      var barElementCenter = barElementStart + barElementWidth / 2;

      for (var note in song[i]) {
        var noteY = ((12) * 2 - note.positionInG) * deltaH / 2;
        canvas.drawCircle(Offset(barElementCenter, noteY), deltaH / 2, paint);

        ///Additional lines
        if (note.positionInG > 19) {
          canvas.drawLine(
              Offset(barElementStart + barElementWidth / 4, 2 * deltaH),
              Offset(barElementStart + 3 * barElementWidth / 4, 2 * deltaH),
              paint);
          if (note.positionInG > 22) {
            canvas.drawLine(
                Offset(barElementStart + barElementWidth / 4, deltaH),
                Offset(barElementStart + 3 * barElementWidth / 4, deltaH),
                paint);
          }
        } else if (note.positionInG < 9) {
          for (var i = 8; i < 8 + (8 - note.positionInG) ~/ 2 + 1; i++) {
            canvas.drawLine(
                Offset(barElementStart + barElementWidth / 4, i * deltaH),
                Offset(barElementStart + 3 * barElementWidth / 4, i * deltaH),
                paint);
          }
        }
      }
    }
  }

  void drawStaff(Canvas canvas, Size size) {
    var sheetHeight = size.height;
    var sheetWidth = size.width;
    var deltaH = sheetHeight / 12;
    var paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1;
    for (var i = 3; i < 8; i++) {
      canvas.drawLine(
          Offset(0, i * deltaH), Offset(sheetWidth, i * deltaH), paint);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    // if (sharpImage != null)
    canvas.drawImage(sharpImage, Offset(100.0, 100.0), Paint());
    drawStaff(canvas, size);
    drawNotes(canvas, size);
  }

  @override
  bool shouldRepaint(covariant Painter oldDelegate) {
    return false;
  }
}
