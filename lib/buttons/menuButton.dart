import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  String text;
  Widget target;
  MenuButton({Key? key, required this.text, required this.target})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ElevatedButton(
            child: Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF618dac)),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => target,
                ),
              );
            },
            style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 10)),
                backgroundColor:
                    MaterialStatePropertyAll<Color>(Color(0xFFdae1d6)))));
  }
}
