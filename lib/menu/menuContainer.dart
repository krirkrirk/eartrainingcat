import 'package:eartraining/mainScaffold.dart';
import 'package:eartraining/buttons/menuButton.dart';
import 'package:flutter/material.dart';

class MenuContainer extends StatelessWidget {
  String appBarTitle;
  String image;
  String title;
  List<MenuButton> buttons;
  MenuContainer(
      {Key? key,
      required this.appBarTitle,
      required this.image,
      required this.title,
      required this.buttons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Image.asset(image)),
              Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 20),
                  )),
              ...buttons.map((button) {
                return Padding(
                    padding: EdgeInsets.only(top: 10), child: button);
              }),
            ]),
            Image.asset("assets/images/small_cat.png")
          ],
        ));
  }
}
