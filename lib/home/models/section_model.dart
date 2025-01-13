// class SectionModel{
//   String text;
//   String id;
//   SectionModel({
//     this.id=""
//     ,required this.text});
//   SectionModel.fromJson(Map<String,dynamic>json):this(
//     text: json["text"],
//     id: json["id"]
//   );
//   Map<String,dynamic>toJson()=>{
//     "text":text,
//     "id":id
//   };
//   static  List<SectionModel>secs=[
//
//     SectionModel(text: "Colors",id: '1'),
//     SectionModel(text: "Family and\n friends",id: '2'),
//     SectionModel(text: "Days, months\n and seasons"
//         ,id: '3'),
//     // SectionModel(text: "Greetings",id: '4'),
//     // SectionModel(text: "Travel by ship",id: '5'),
//     // SectionModel(text: "Travel by plane",id: '6'),
//     // SectionModel(text: "Adjectives",id: '7'),
//     // SectionModel(text: "Nature",id: '8'),
//     // SectionModel(text: "Weather",id: '9'),
//     // SectionModel(text: "Emergencies",id: '10'),
//     // SectionModel(text: "At the barber",id: '11'),
//     // SectionModel(text: "At the tailor",id: '12'),
//     // SectionModel(text: "At the grocery\n store",id: '13'),
//     // SectionModel(text: "At the dentist",id: '14'),
//     // SectionModel(text: "In the taxi",id: '15'),
//     // SectionModel(text: "At the pharmacy",id: '16'),
//     // SectionModel(text: "At the hotel",id: '17'),
//     // SectionModel(text: "At school",id: '18'),
//     // SectionModel(text: "At the bank",id: '19'),
//     // SectionModel(text: " At the airport",id: '20'),
//   ];
// }
import 'package:flutter/material.dart';
// SectionModel Class
// class SectionModel {
//    String id;
//    String name;
//
//
//   SectionModel({
//     this.id=""
//     ,required this.name});
//   SectionModel.fromJson(Map<String,dynamic>json):this(
//       name: json["text"],
//     id: json["id"]
//   );
//   Map<String,dynamic>toJson()=>{
//     "text":name,
//     "id":id
//   };
// }
class SectionModel {
  String id;
  String name;
  List<SectionContentModel>? staticContents; // Add this field for static items

  SectionModel({
    this.id = "",
    required this.name,
    this.staticContents, // Initialize static items
  });

  SectionModel.fromJson(Map<String, dynamic> json)
      : this(
    name: json["text"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "text": name,
    "id": id,
  };
}

// SectionContentModel Class
class SectionContentModel {
  String sectionContentId;
  String title;
  String sectionId;  // Add this field

  SectionContentModel({
    this.sectionContentId="",
    required this.title,
    this.sectionId = "",  // Add this parameter
  });

  SectionContentModel.fromJson(Map<String,dynamic>json):
        this(
        title: json['txt'],
        sectionContentId: json['sectionContentId'],
        sectionId: json['sectionId'],  // Add this field
      );

  Map<String,dynamic>toJson() => {
    "sectionContentId": sectionContentId,
    "txt": title,
    "sectionId": sectionId,  // Add this field
  };
}
