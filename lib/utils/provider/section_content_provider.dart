// import 'package:flutter/material.dart';
// import 'package:graduationproject/home/models/section_content_model.dart';
// import 'package:graduationproject/home/models/section_model.dart';
// import 'package:graduationproject/utils/firebase_functions.dart';
//
//
// class SectionContentProvider with ChangeNotifier {
//   static Map<String, List<SectionContentModel>> sectionContentsMap = {};
//
//   List<SectionContentModel> getSectionContents(String sectionId) {
//     return sectionContentsMap[sectionId] ?? [];
//   }
//
//   Future<void> getAlSecsContent(String userId, SectionModel sectionModel) async {
//     try {
//       final firebaseSectionContents = await FirebaseUtils.getSectionsContent(userId, sectionModel);
//       sectionContentsMap[sectionModel.id] = firebaseSectionContents;
//       notifyListeners();
//     } catch (e) {
//       print("Error fetching section content: $e");
//       rethrow;
//     }
//   }
//
//   Future<void> addContentSection(
//       String userId,
//       SectionModel sectionModel,
//       SectionContentModel sectionContentModel,
//       ) async {
//     try {
//       await FirebaseUtils.addSectionContent(userId, sectionModel, sectionContentModel);
//       await getAlSecsContent(userId, sectionModel);
//     } catch (e) {
//       print("Error adding section content: $e");
//       rethrow;
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:graduationproject/home/models/section_content_model.dart';
import 'package:graduationproject/home/models/section_model.dart';
import 'package:graduationproject/utils/firebase_functions.dart';

import 'package:flutter/material.dart';
import 'package:graduationproject/home/models/section_content_model.dart';
import 'package:graduationproject/home/models/section_model.dart';
import 'package:graduationproject/utils/firebase_functions.dart';

class SectionContentProvider with ChangeNotifier {
  static Map<String, List<SectionContentModel>> sectionContentsMap = {};

  List<SectionContentModel> getSectionContents(String sectionId) {

    return sectionContentsMap[sectionId] ?? [];
  }
  // Fetch section content from Firebase
  Future<void> getAlSecsContent(String userId, SectionModel sectionModel) async {
    try {

        // Skip fetching for "Clinic" section (if it's entirely static)
        final firebaseSectionContents = await FirebaseUtils.getSectionsContent(userId, sectionModel);
        sectionContentsMap[sectionModel.id] = firebaseSectionContents;

      notifyListeners();
    } catch (e) {
      print("Error fetching section content: $e");
      rethrow;
    }
  }

  // Add new content to a section
  Future<void> addContentSection(
      String userId,
      SectionModel sectionModel,
      SectionContentModel sectionContentModel,
      ) async {
    try {
      await FirebaseUtils.addSectionContent(userId, sectionModel, sectionContentModel);
      await getAlSecsContent(userId, sectionModel);
    } catch (e) {
      print("Error adding section content: $e");
      rethrow;
    }
  }
}