import 'dart:developer';
import 'dart:math' hide log;

import 'package:eartraining/models/armor/armor.dart';
import 'package:eartraining/main.dart';
import 'package:eartraining/models/notes/note.dart';
import 'package:eartraining/utilities/loadImageAsset.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui' as UI;

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/painting.dart' show decodeImageFromList;

class Staff extends StatelessWidget {
  List<List<Note>> song;
  Armor? armor;
  String clef;
  Map<String, UI.Image> images;
  Staff({
    Key? key,
    required this.song,
    required this.images,
    this.armor,
    this.clef = "C",
  }) : super(key: key) {
    debugPrint(images.isEmpty.toString());
    // Future<UI.Image>
    // loadImageAsset("../assets/images/gKey.png").then((value) {
    //   bemolImg = value;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: Painter(song: song, images: images, armor: armor),
      child: Container(
        width: double.infinity,
        height: 150.0,
        decoration: BoxDecoration(
          color: Color(0xFF2f5d95),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF2f5d95).withOpacity(0.8),
              spreadRadius: 5,
              blurRadius: 5,
              // offset: Offset(0, 3)
            )
          ],
          // shape: BoxShape.circle,
          borderRadius: new BorderRadius.all(Radius.elliptical(100, 50)),
        ),
      ),
    );
  }
}

class Painter extends CustomPainter {
  List<List<Note>> song;
  bool loaded = false;
  Map<String, UI.Image> images;
  Armor? armor;
  Painter({required this.song, required this.images, this.armor});

  void drawNotes(Canvas canvas, Size size) {
    var sheetHeight = size.height;
    var deltaH = sheetHeight / 12;

    var paint = Paint()
      ..color = Colors.white
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
        if (note.type.alteration.imgId != "") {
          paintImage(
              canvas: canvas,
              rect: Rect.fromCenter(
                  center: Offset(barElementCenter - barElementWidth / 2, noteY),
                  width: deltaH * 2,
                  height: deltaH * 2),
              image: images[note.type.alteration.imgId]!,
              fit: BoxFit.cover);

          // canvas.drawImage(images[note.type.alteration.imgId]!,
          //     Offset(barElementCenter - barElementWidth / 4, noteY), paint);
        }

        // canvas.drawCircle(Offset(barElementCenter, noteY), deltaH / 2, paint);
        paintImage(
            canvas: canvas,
            rect: Rect.fromCenter(
                center: Offset(barElementCenter, noteY),
                width: deltaH * 1.1,
                height: deltaH * 1.1),
            image: images["note_white"]!,
            fit: BoxFit.cover);

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
    canvas.drawImage(images["gKey"]!, Offset(0, 0), paint);
    for (var i = 3; i < 8; i++) {
      canvas.drawLine(
          Offset(0, i * deltaH), Offset(sheetWidth, i * deltaH), paint);
    }
    var armorX = 50.0;
    armor?.notesAltered.absoluteNotes.forEach((element) {
      var armorY = ((12) * 2 - (element.diatonicPosition + 15)) * deltaH / 2;
      armorX += 10;
      paintImage(
          canvas: canvas,
          rect: Rect.fromCenter(
              center: Offset(armorX, armorY),
              width: deltaH * 2,
              height: deltaH * 2),
          image: images[element.alteration.imgId]!,
          fit: BoxFit.cover);
    });
  }

  @override
  void paint(Canvas canvas, Size size) {
    // canvas.drawImage(sharpImage, Offset(100.0, 100.0), Paint());
    drawStaff(canvas, size);
    drawNotes(canvas, size);
  }

  @override
  bool shouldRepaint(covariant Painter oldDelegate) {
    return false;
  }
}
