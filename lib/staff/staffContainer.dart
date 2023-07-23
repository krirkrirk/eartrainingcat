import 'dart:async';

import 'package:eartraining/models/armor/armor.dart';
import 'package:eartraining/models/notes/note.dart';
import 'package:eartraining/staff/staff.dart';
import 'package:eartraining/utilities/loadImageAsset.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as UI;

class StaffContainer extends StatefulWidget {
  List<List<Note>> song;
  Armor? armor;
  String clef;
  StaffContainer({Key? key, required this.song, this.armor, this.clef = "C"})
      : super(key: key);

  @override
  _StaffContainerState createState() => _StaffContainerState();
}

class ImageProps {
  String id = "";
  int width = 0;
  int height = 0;
  ImageProps(String id, int width, int height) {
    this.id = id;
    this.width = width;
    this.height = height;
  }
}

class _StaffContainerState extends State<StaffContainer> {
  bool allImagesLoaded = false;

  late Map<String, UI.Image> IMAGES = {};
  UI.Image? img;
  @override
  void initState() {
    super.initState();

    var images = [
      new ImageProps("sharp", 50, 50),
      new ImageProps("double_sharp", 50, 50),
      new ImageProps("gKey", 50, 100),
      new ImageProps("bemol_red", 50, 50),
      new ImageProps("note_white", 50, 50),
      new ImageProps("bemol", 50, 50),
      new ImageProps("double_bemol", 50, 50),
    ];

    for (var i = 0; i < images.length; i++) {
      var image = images[i];
      getUiImage(image.id, image.height, image.width)
          .then((res) => setState(() {
                IMAGES[image.id] = res;
                if (i == images.length - 1) {
                  allImagesLoaded = true;
                }
                //
              }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: allImagesLoaded
            ? Staff(
                song: widget.song,
                armor: widget.armor,
                clef: widget.clef,
                images: IMAGES)
            : Text("ça charge frer"));
  }
}
