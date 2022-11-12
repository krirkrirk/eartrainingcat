// import 'package:eartraining/buttons/menuButton.dart';
// import 'package:eartraining/exercices/readingExercice.dart';
// import 'package:eartraining/exercices/tonalitiesRecognitionExercice.dart';
// import 'package:eartraining/menu/menuContainer.dart';
// import 'package:eartraining/models/armor/armor.dart';
// import 'package:eartraining/models/scales/tonality.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class TonalitiesRecognitionMenu extends StatelessWidget {
//   const TonalitiesRecognitionMenu({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MenuContainer(
//       appBarTitle: "Armures",
//       buttons: [
//         MenuButton(
//           text: "Tonalité Majeure",
//           target: ReadingExercice(
//             title: "Tonalité Majeure",
//             questionsNumber: 3,
//             // modelTypes: TONALITIES.where((element) => !element.isMinor),
//           ),
//         ),
//         MenuButton(
//           text: "Tonalité Mineure",
//           target: TonalitiesRecognitionExercice(
//             title: "Tonalité Mineure",
//             questionsNumber: 3,
//             answersGrid: const [
//               ["1#", "2#", "3#", "4#", "5#", "6#", "7#"],
//               ["0"],
//               ["1b", "2b", "3b", "4b", "5b", "6b", "7b"],
//             ],
//           ),
//         ),
//       ],
//       image: "../../assets/images/doubleCroche.png",
//       title: "Armures",
//     );
//   }
// }
