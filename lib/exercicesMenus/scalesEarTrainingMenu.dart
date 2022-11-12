// import 'package:eartraining/buttons/menuButton.dart';
// import 'package:eartraining/exercices/basicEarTrainingExercice.dart';
// import 'package:eartraining/menu/menuContainer.dart';
// import 'package:eartraining/models/notes/notesCollection.dart';
// import 'package:eartraining/models/scales/scale.dart';
// import 'package:eartraining/models/scales/scaleStructure.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class ScalesEarTrainingMenu extends StatelessWidget {
//   const ScalesEarTrainingMenu({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MenuContainer(
//         appBarTitle: "Gammes",
//         title: "Types de gamme",
//         image: "../../assets/images/gamme.png",
//         buttons: [
//           MenuButton(
//             text: "Majeure & mineure",
//             target: BasicEarTrainingExercice<ScaleStructure, Scale>(
//                 title: "Gammes Majeure & mineure",
//                 questionsNumber: 3,
//                 answersGrid: const [
//                   [
//                     {"id": "diato-1", "label": "Majeure"},
//                     {"id": "diato-6", "label": "Mineure"},
//                   ]
//                 ],
//                 playTypes: const [
//                   PlayType.ascendant
//                 ]),
//           ),
//           MenuButton(
//             text: "toutes",
//             target: BasicEarTrainingExercice<ScaleStructure, Scale>(
//                 title: "toutes",
//                 questionsNumber: 3,
//                 exercisables: SCALES,
//                 playTypes: const [PlayType.ascendant]),
//           )
//         ]);
//   }
// }
