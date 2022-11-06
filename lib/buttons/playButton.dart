import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  void Function() onPressed;
  PlayButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: IconButton(
          constraints: BoxConstraints(
            minWidth: 100,
          ),
          padding: EdgeInsets.all(0.0),
          icon: const Icon(Icons.play_arrow, color: Colors.blue, size: 80),
          tooltip: 'Play',
          onPressed: onPressed,
        ));
  }
}
