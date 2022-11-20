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

class _StaffContainerState extends State<StaffContainer> {
  bool allImagesLoaded = false;

  late Map<String, UI.Image> IMAGES = {};
  UI.Image? img;
  @override
  void initState() {
    super.initState();
    var ids = [
      "sharp",
      "double_sharp",
      "gKey",
      "bemol_red",
      "note_white",
      "bemol",
      "double_bemol"
    ];
    for (var i = 0; i < ids.length; i++) {
      getUiImage(ids[i], 100, 100).then((res) => setState(() {
            IMAGES[ids[i]] = res;
            if (i == ids.length - 1) {
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
