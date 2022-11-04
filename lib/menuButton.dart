import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  String text;
  Widget target;
  MenuButton({Key? key, required this.text, required this.target})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text(
          text,
          style: TextStyle(color: Colors.blue),
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => target,
            ),
          );
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll<Color>(Color(0xFFdae1d6))));
  }
}
