import 'package:flutter/foundation.dart';

import '../../home/models/section_model.dart';
import '../firebase_functions.dart';

class SectionProvider with ChangeNotifier {
  SectionModel? section;
  List<SectionModel> sections = []; // Combines static + Firestore sections

  // Load static and Firestore sections
  Future<void> getAllSections(String userId) async {
    // Start with the static sections
    sections = List.from(SectionModel.secs);

    // Fetch sections from Firestore
    final firestoreSections = await FirebaseUtils.
    getSectionFromFireStore(userId);

    // Add Firestore sections (avoid duplicates)
    for (var sec in firestoreSections) {
      if (!sections.any((s) => s.id == sec.id)) {
        sections.add(sec);
      }
    }

    notifyListeners();
  }

  // Add a new section to Firestore and update the list
  Future<void> addSection(String text, String userId) async {
    final newSection = SectionModel(text: text);
    await FirebaseUtils.addSection(newSection, userId);
    sections.add(newSection);
    notifyListeners();
  }

// Future<void>updateSection(String txt,String userId)async{
//   final newSection=await FirebaseUtils
//       .updateSection(SectionModel(text: txt), userId);
//   notifyListeners();
// }
}