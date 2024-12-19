import 'package:flutter/cupertino.dart';
import 'package:graduationproject/home/models/section_content_model.dart';
import 'package:graduationproject/home/models/section_model.dart';
import 'package:graduationproject/utils/firebase_functions.dart';

class SectionContentProvider with   ChangeNotifier{
  List<SectionContentModel> sectionContents=[];
  Future<void> getAlSecsContent(String userId,
      SectionModel sectionModel) async {
    print("Fetching content for section: ${sectionModel.id}");

    if (SectionContentModel.secsContent.containsKey(sectionModel.text)) {
      sectionContents = List.from(SectionContentModel.
      secsContent[sectionModel.text]!);
    } else {
      sectionContents = [];
    }

    final firebaseSectionContents =
    await FirebaseUtils.getSectionsContent(userId, sectionModel);

    print("Fetched from Firebase: ${firebaseSectionContents.length} items");

    for (var sec in firebaseSectionContents) {
      if (!sectionContents.any((s) => s.id == sec.id)) {
        sectionContents.add(sec);
      }
    }

    print("Final SectionContents List: ${sectionContents.length} items");
    notifyListeners();
  }
  Future<void>addContentSection(
      String userId, SectionModel sectionModel,
      SectionContentModel sectionContentModel
      )async{
    final newSec=await FirebaseUtils.
    addSectionContent(userId,
        sectionModel,
        sectionContentModel);
    sectionContents.add(newSec!);
    notifyListeners();
  }


  List<SectionContentModel> _sectionContents = [];



  Future<void> getSectionContentBySectionId(SectionModel sectionModel) async {
    // Simulate fetching data from an API or database
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    _sectionContents = sectionContents
        .where((content) => content.id == sectionModel.id)
        .toList(); // Filter data by sectionId
    notifyListeners();
  }












}