// import 'package:audioplayers/audioplayers.dart';
// import 'package:eartraining/buttons/playButton.dart';
// import 'package:eartraining/exercices/answersGrid.dart';
// import 'package:eartraining/exercices/endExerciceDialog.dart';
// import 'package:eartraining/exercices/exerciceFooter.dart';
// import 'package:eartraining/exercices/getTypesFromAnswerGrid.dart';
// import 'package:eartraining/models/intervals/intervalStructure.dart';
// import 'package:eartraining/mainScaffold.dart';
// import 'package:eartraining/models/model.dart';
// import 'package:eartraining/models/notes/notesCollection.dart';
// import 'package:eartraining/models/absoluteModel.dart';
// import 'package:eartraining/models/modelStructure.dart';
// import 'package:eartraining/staff/staff.dart';
// import 'package:eartraining/staff/staffContainer.dart';
// import 'package:eartraining/utilities/randomFrom.dart';
// import 'package:flutter/material.dart' hide Interval;

// class ReadingExercice<Structure extends ModelStructure, Concrete extends Model>
//     extends StatefulWidget {
//   List<Structure>? modelTypes;
//   final List<List<dynamic>>? answersGrid;
//   final String title;
//   final int questionsNumber;

//   ReadingExercice({
//     Key? key,
//     required this.title,
//     required this.questionsNumber,
//     this.answersGrid,
//     this.modelTypes,
//   }) : super(key: key) {
//     if (modelTypes == null) {
//       modelTypes = getStructuresFromAnswersGrid<Structure>(answersGrid!);
//     }
//   }

//   @override
//   _ReadingExerciceState<Structure, Concrete> createState() =>
//       _ReadingExerciceState<Structure, Concrete>();
// }

// class _ReadingExerciceState<Type extends ModelStructure, Concrete extends Model>
//     extends State<ReadingExercice> {
//   Concrete? model;
//   bool? isRightAnswer;
//   int answersCount = 0;
//   int rightAnswersCount = 0;
//   String? selectedModelId;

//   @override
//   void initState() {
//     super.initState();
//     setNewQuestion();
//   }

//   void setNewQuestion() {
//     var modelType = randomFrom(widget.modelTypes!);
//     setState(() {
//       isRightAnswer = null;
//       selectedModelId = null;
//     });
//   }

//   void onTryAgain() {
//     Navigator.pop(context);
//     setState(() {
//       answersCount = 0;
//       rightAnswersCount = 0;
//     });
//     setNewQuestion();
//   }

//   void onClick(id) {
//     setState(() {
//       if (selectedModelId == null) {
//         selectedModelId = id;
//         isRightAnswer = model!.structure.id == id;
//         answersCount++;
//         rightAnswersCount += isRightAnswer! ? 1 : 0;
//         if (answersCount == widget.questionsNumber) {
//           showDialog<String>(
//               context: context,
//               barrierDismissible: false,
//               builder: (BuildContext context) => EndExerciceDialog(
//                     rightAnswers: rightAnswersCount,
//                     maxAnswers: widget.questionsNumber,
//                     onBack: () {
//                       Navigator.pop(context);
//                       Navigator.pop(context);
//                     },
//                     onTryAgain: onTryAgain,
//                   ));
//         }
//       } else {
//         // var typeSelected =
//         //     widget.modelTypes!.firstWhere(((element) => element.id == id));
//         // modelBeingPlayed = typeSelected.projectOnNote(model!.root);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MainScaffold(
//         appBar: AppBar(title: Text(widget.title)),
//         child: Column(children: [
//           Expanded(
//               child: StaffContainer(
//                   song: model?.notesCollection.getSheetData() ?? [])),
//           AnswersGrid(
//             answersGrid: widget.answersGrid,
//             models: widget.modelTypes,
//             onClick: onClick,
//             rightId: model!.type.id,
//             selectedId: selectedModelId,
//           ),
//           if (selectedModelId != null)
//             OutlinedButton(
//               onPressed: setNewQuestion,
//               child: const Text("Next"),
//             ),
//           ExerciceFooter(
//               rightAnswers: rightAnswersCount,
//               maxAnswers: widget.questionsNumber)
//         ]));
//   }
// }
