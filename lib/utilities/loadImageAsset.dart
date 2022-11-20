import 'dart:ui' as UI;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

Future<UI.Image> loadImageAsset(String imageId) async {
  var path = "assets/images/sharp.png";
  final data = await rootBundle.load("assets/images/$imageId.png");
  return decodeImageFromList(data.buffer.asUint8List());
}

Future<UI.Image> getUiImage(String imageId, int height, int width) async {
  var path = "assets/images/$imageId.png";
  final ByteData assetImageByteData = await rootBundle.load(path);
  final codec = await UI.instantiateImageCodec(
    assetImageByteData.buffer.asUint8List(),
    targetHeight: height,
    targetWidth: width,
  );
  final image = (await codec.getNextFrame()).image;
  return image;
}
