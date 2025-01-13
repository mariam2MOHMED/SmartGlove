import 'package:flutter/foundation.dart';

import '../../home/models/section_model.dart';
import '../firebase_functions.dart';

// class SectionProvider with ChangeNotifier {
//   final List<SectionModel> secs = [
//     SectionModel(id: "1", name: "Clinic"),
//     SectionModel(id: "2", name: "Family and relatives"),
//     SectionModel(id: "3", name: "At school"),
//     SectionModel(id: "4", name: "At the store"),
//     SectionModel(id: "5", name: "Colors"),
//     SectionModel(id: "6", name: "Greetings"),
//     SectionModel(id: "7", name: "Days; seasons"),
//     SectionModel(id: "8", name: "At the mall"),
//     SectionModel(id: "9", name: "Dentist"),
//   ];
//   SectionModel? section;
//   List<SectionModel> sections = []; // Combines static + Firestore sections
//
//   // Load static and Firestore sections
//   Future<void> getAllSections(String userId) async {
//     // Start with the static sections
//     sections = List.from(secs);
//
//     // Fetch sections from Firestore
//     final firestoreSections = await FirebaseUtils.
//     getSectionFromFireStore(userId);
//
//     // Add Firestore sections (avoid duplicates)
//     for (var sec in firestoreSections) {
//       if (!sections.any((s) => s.id == sec.id)) {
//         sections.add(sec);
//       }
//     }
//
//     notifyListeners();
//   }
//
//   // Add a new section to Firestore and update the list
//   Future<void> addSection(String text, String userId) async {
//     final newSection = SectionModel(name: text);
//     await FirebaseUtils.addSection(newSection, userId);
//     sections.add(newSection);
//     notifyListeners();
//   }
//
// // Future<void>updateSection(String txt,String userId)async{
// //   final newSection=await FirebaseUtils
// //       .updateSection(SectionModel(text: txt), userId);
// //   notifyListeners();
// // }
// }
class SectionProvider with ChangeNotifier {
  final List<SectionModel> secs = [
    SectionModel(
      id: "1",
      name: "Clinic",
      staticContents: [
        SectionContentModel(title: "I have an appointment with Dr. Smith ", sectionId: "1"),
        SectionContentModel(title: "I’ve been experiencing a sharp pain in my chest", sectionId: "1"),
        SectionContentModel(title: "Can you please check my blood pressure?", sectionId: "1"),
        SectionContentModel(title: "I need a prescription refill for my medication.", sectionId: "1"),
        SectionContentModel(title: "I’ve been feeling dizzy and nauseous", sectionId: "1"),
        SectionContentModel(title: "Could you schedule an X-ray for my injured arm?", sectionId: "1"),
        SectionContentModel(title: " can you take my temperature?", sectionId: "1"),
        SectionContentModel(title: "I’m here for my annual check-up.", sectionId: "1"),
        SectionContentModel(title: "I’ve been having trouble sleeping", sectionId: "1"),
      ],
    ),
    SectionModel(id: "2", name: "Family and relatives",
      staticContents: [
        SectionContentModel(title: "Mother", sectionId: "2"),
        SectionContentModel(title: "Father", sectionId: "2"),
        SectionContentModel(title: "Sister", sectionId: "2"),
        SectionContentModel(title: "Brother", sectionId: "2"),
        SectionContentModel(title: "Grandmother", sectionId: "2"),
        SectionContentModel(title: "Grandfather", sectionId: "2"),
        SectionContentModel(title: "Uncle", sectionId: "2"),
        SectionContentModel(title: "Aunt", sectionId: "2"),
        SectionContentModel(title: "Cousin", sectionId: "2"),
      ],),
    SectionModel(id: "3", name: "At school",
      staticContents: [
        SectionContentModel(title: "Good morning, teacher!", sectionId: "3"),
        SectionContentModel(title: "Can I go to the bathroom, please?", sectionId: "3"),
        SectionContentModel(title: "I forgot my homework at home.", sectionId: "3"),
        SectionContentModel(title: "Can you help me with this problem?", sectionId: "3"),
        SectionContentModel(title: "I finished my work. What should I do next?", sectionId: "3"),
        SectionContentModel(title: "Can I borrow a pencil?", sectionId: "3"),
        SectionContentModel(title: "I don’t understand this lesson.", sectionId: "3"),
        SectionContentModel(title: "Can I play with my friends during recess?", sectionId: "3"),
        SectionContentModel(title: "I lost my lunchbox. Has anyone seen it?", sectionId: "3"),
        SectionContentModel(title: "When is the next holiday?", sectionId: "3"),
      ],
    ),
    SectionModel(id: "4", name: "At the store",
      staticContents: [
        SectionContentModel(title: "Where  the shop?",
            sectionId: "3"),
        SectionContentModel(title:
        "how much is it ", sectionId: "3"),
        SectionContentModel(title: "Where can I find the dairy section?", sectionId: "4"),
        SectionContentModel(title: "Do you have this in a smaller size?", sectionId: "4"),
        SectionContentModel(title: "How much does this cost?", sectionId: "4"),
        SectionContentModel(title: "Is this item on sale?", sectionId: "4"),
        SectionContentModel(title: "Can I get a bag for my groceries?", sectionId: "4"),
        SectionContentModel(title: "Do you accept credit cards?", sectionId: "4"),
        SectionContentModel(title: "Could you help me find the baking aisle?", sectionId: "4"),
        SectionContentModel(title: "Can I get a receipt, please?", sectionId: "4"),
      ],
    ),
    SectionModel(id: "5", name: "Colors"

    ,staticContents: [
      SectionContentModel(title: "Red", sectionId: "5"),
          SectionContentModel(title: "Blue", sectionId: "5"),
          SectionContentModel(title: "Green", sectionId: "5"),
          SectionContentModel(title: "Yellow", sectionId: "5"),
          SectionContentModel(title: "Orange", sectionId: "5"),
          SectionContentModel(title: "Purple", sectionId: "5"),
          SectionContentModel(title: "Pink", sectionId: "5"),
          SectionContentModel(title: "Brown", sectionId: "5"),
          SectionContentModel(title: "Black", sectionId: "5"),
          SectionContentModel(title: "White", sectionId: "5"),
          SectionContentModel(title: "Mint Green", sectionId: "5"),


        ]),
    SectionModel(id: "6", name: "Greetings",staticContents: [
      SectionContentModel(title: "Hello!", sectionId: "6"),
      SectionContentModel(title: "Good morning!", sectionId: "6"),
      SectionContentModel(title: "Good afternoon!", sectionId: "6"),
      SectionContentModel(title: "Good evening!", sectionId: "6"),
      SectionContentModel(title: "Hi there!", sectionId: "6"),
      SectionContentModel(title: "Hey, how are you?", sectionId: "6"),
      SectionContentModel(title: "How’s it going?", sectionId: "6"),
      SectionContentModel(title: "What’s up?", sectionId: "6"),
    ]),
    SectionModel(id: "7", name: "Days, seasons",
    staticContents: [
      SectionContentModel(title: "Today is Monday.", sectionId: "7"),
      SectionContentModel(title: "What day is it tomorrow?", sectionId: "7"),
      SectionContentModel(title: "I have a meeting on Wednesday.", sectionId: "7"),
      SectionContentModel(title: "Friday is my favorite day of the week.", sectionId: "7"),
      SectionContentModel(title: "Spring is the season of flowers.", sectionId: "7"),
      SectionContentModel(title: "It’s very hot in the summer.", sectionId: "7"),
      SectionContentModel(title: "Autumn is when the leaves change color.", sectionId: "7"),
      SectionContentModel(title: "Winter is the coldest season.", sectionId: "7"),
      SectionContentModel(title: "We’re going on vacation next Saturday", sectionId: "7"),
      SectionContentModel(title: "Which season do you like the most?", sectionId: "7"),
 ]
    ),
    SectionModel(id: "8", name: "At the mall"),
    SectionModel(id: "9", name: "Dentist"),
  ];

  SectionModel? section;
  List<SectionModel> sections = [];

  Future<void> getAllSections(String userId) async {
    sections = List.from(secs);
    final firestoreSections = await FirebaseUtils.getSectionFromFireStore(userId);
    for (var sec in firestoreSections) {
      if (!sections.any((s) => s.id == sec.id)) {
        sections.add(sec);
      }
    }
    notifyListeners();
  }

  Future<void> addSection(String text, String userId) async {
    final newSection = SectionModel(name: text);
    await FirebaseUtils.addSection(newSection, userId);
    sections.add(newSection);
    notifyListeners();
  }
}