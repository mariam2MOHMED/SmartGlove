// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:graduationproject/auth/model/user_model.dart';
// import 'package:graduationproject/home/models/section_content_model.dart';
//
// import '../home/models/section_model.dart';
//
// class FirebaseUtils{
// static CollectionReference<UserModel> getUserCollection()=>
//     FirebaseFirestore.instance.collection("users").
// withConverter<UserModel>(fromFirestore: (docSnapshot,_)=>
//         UserModel.fromJson(docSnapshot.data()!),
//     toFirestore: (user,_)=>user.toJson());
// static Future<UserModel> register({
//   required String email,
//   required String name,
//   required String password,
//
// })async{
//   final getusers=getUserCollection();
//   final userCrediental=await FirebaseAuth.instance.
//   createUserWithEmailAndPassword(email: email,
//       password: password);
//   final user=UserModel(
//       id: userCrediental.user!.uid,
//       name: name,
//       email: email, password: password);
//   getusers.doc(user.id).set(user);
//   return user;
// }
// static Future<UserModel> login({
//   required String email,
//   required String password,
//
// })async{
//   final getusers=getUserCollection();
//   final userCrediental=await FirebaseAuth.instance.
//   signInWithEmailAndPassword(email: email,
//       password: password);
//   final doc=await  getusers.
//   doc(userCrediental.user!.uid).get();
//   return doc.data()!;
// }
// static CollectionReference<SectionModel>
// getSectionsCollection
//     (String userId)=>
//     getUserCollection().doc(userId).collection("sections").
//     withConverter<SectionModel>(fromFirestore: (docSnapshot,_)=>
//         SectionModel.fromJson(docSnapshot.data()!),
//         toFirestore: (user,_)=>user.toJson());
// static Future<void> addSection(SectionModel sectionModel,
//     String userId)
// async{
//   CollectionReference<SectionModel>
//   getsecs=getSectionsCollection(userId);
//   DocumentReference<SectionModel> doc=  getsecs.doc();
// sectionModel.id!=doc.id;
//
// return  doc.set(sectionModel);
// }
// static Future<void>updateSection(SectionModel sectionModel,
//     String userId)async{
//   CollectionReference<SectionModel>
//   getsecs=getSectionsCollection(userId);
//
//
// return getsecs.doc(sectionModel.id).update(sectionModel.toJson());
// }
// static Future<void>deleteSection(SectionModel sectionModel,
//     String userId)async{
//   CollectionReference<SectionModel>
//   getsecs=getSectionsCollection(userId);
//
//   return getsecs.doc(sectionModel.id).delete();
// }
//
// static Future<List<SectionModel>>getSectionFromFireStore(
//     String userId)async{
//   CollectionReference<SectionModel>
//   getsecs=getSectionsCollection(userId);
//  QuerySnapshot<SectionModel> querySnapshot=await getsecs.get();
//  return querySnapshot.docs.map((e) => e.data()).toList();
// }
//
//   static CollectionReference<SectionContentModel> getContentSectionCollection(
//       SectionModel sectionModel,
//       String userId, SectionContentModel sectionContentModel,
//       ) {
//     return getSectionsCollection(userId)
//         .doc(sectionModel.id) // Reference the specific section
//         .collection("contents") // Subcollection for section content
//         .withConverter<SectionContentModel>(
//       fromFirestore: (docSnapshot, _) =>
//           SectionContentModel.fromJson(docSnapshot.data()!),
//       toFirestore: (sectionContent, _) => sectionContent.toJson(),
//     );
//   }
//
//   static Future<void> addSectionContent(
//       String userId,
//       SectionModel sectionModel,
//       SectionContentModel sectionContentModel,
//       ) async {
//     try {
//       final getSecContent = getContentSectionCollection(sectionModel, userId,sectionContentModel);
//       final doc = getSecContent.doc(); // Generate a new document ID
//       sectionContentModel.sectionContentId = doc.id; // Assign the ID to the model
//       await doc.set(sectionContentModel); // Add the content to Firestore
//     } catch (e) {
//       print("Error adding section content: $e");
//       rethrow;
//     }
//   }
// static Future<void> updateSectionContent(
//     String userId,
//     SectionModel sectionModel,
//     SectionContentModel sectionContentModel,
//     ) async {
//   try {
//     final getSecContent = getContentSectionCollection(sectionModel, userId,
//         sectionContentModel);
//     final doc = getSecContent.doc(sectionContentModel.sectionContentId); // Use the correct document ID
//     await doc.update(sectionContentModel.toJson());
//   } catch (e) {
//     print("Error updating section content: $e");
//     rethrow;
//   }
// }

// static Future<void> deleteSectionContent(
//     String userId,
//     SectionModel sectionModel,
//     SectionContentModel sectionContentModel,
//     ) async {
//   try {
//     final getSecContent = getContentSectionCollection(sectionModel,
//         userId,sectionContentModel);
//     final doc = getSecContent.doc(sectionContentModel.sectionContentId); // Use the correct document ID
//     await doc.delete();
//   } catch (e) {
//     print("Error deleting section content: $e");
//     rethrow;
//   }
// }
// static Future<List<SectionContentModel>> getSectionsContent(
//     String userId,
//     SectionModel sectionModel,
//     SectionContentModel sectionContentModel
//     ) async {
//   try {
//     final getSecContent = getContentSectionCollection(sectionModel, userId,sectionContentModel);
//     QuerySnapshot<SectionContentModel> querySnapshot = await getSecContent.get();
//     print('Fetched from Firebase: ${querySnapshot.size} items');
//     return querySnapshot.docs.map((e) => e.data()).toList();
//   } catch (e) {
//     print("Error fetching section content: $e");
//     rethrow;
//   }
// }
//
//
//
// // static Future addSectionContent(String userId,
// //     SectionModel sectionModel,
// //
// //     SectionContentModel sectionContentModel
// //     )async{
// //   final getSecContent=
// //   getContentSectionCollection(sectionModel,userId);
// // final doc=  await getSecContent.doc();
// // sectionContentModel.sectionContentId!=doc.id;
// // return doc.set(sectionContentModel);
// // }
// // static Future<void>updateSectionContent(String userId
// //     ,  SectionModel sectionModel,
// //     SectionContentModel sectionContentModel
// //     )async{
// //   final getSecContent=
// //   getContentSectionCollection(sectionModel,userId);
// //   final doc=  await getSecContent.doc();
// //
// //   return doc.update(sectionContentModel.toJson());
// // }
// // static Future<void>deleteSectionContent(String userId
// //     ,   SectionModel sectionModel,
// //     SectionContentModel sectionContentModel
// //     )async{
// //   final getSecContent=
// //   getContentSectionCollection(sectionModel,userId);
// //   final doc=  await getSecContent.doc();
// //
// //   return doc.delete();
// // }
// // static Future<List<SectionContentModel>> getSectionsContent(
// //     String userId,  SectionModel sectionModel) async {
// //   final getSecContent =
// //   getContentSectionCollection(sectionModel,userId);
// //   QuerySnapshot<SectionContentModel> querySnapshot = await
// //   getSecContent.get();
// //   print('Fetched from Firebase: ${querySnapshot.size} items');
// //   return querySnapshot.docs.map((e) => e.data()).toList();
// // }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:graduationproject/auth/model/user_model.dart';
import 'package:graduationproject/home/models/section_content_model.dart';
import '../home/models/section_model.dart';

class FirebaseUtils {
  static CollectionReference<UserModel> getUserCollection() =>
      FirebaseFirestore.instance.collection("users").withConverter<UserModel>(
        fromFirestore: (docSnapshot, _) => UserModel.fromJson(docSnapshot.data()!),
        toFirestore: (user, _) => user.toJson(),
      );

  static Future<UserModel> register({
    required String email,
    required String name,
    required String password,
  }) async {
    final getusers = getUserCollection();
    final userCrediental = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    final user = UserModel(id: userCrediental.user!.uid, name: name, email: email, password: password);
    getusers.doc(user.id).set(user);
    return user;
  }

  static Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final getusers = getUserCollection();
    final userCrediental = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    final doc = await getusers.doc(userCrediental.user!.uid).get();
    return doc.data()!;
  }

  static CollectionReference<SectionModel> getSectionsCollection(String userId) =>
      getUserCollection().doc(userId).collection("sections").withConverter<SectionModel>(
        fromFirestore: (docSnapshot, _) => SectionModel.fromJson(docSnapshot.data()!),
        toFirestore: (user, _) => user.toJson(),
      );

  static Future<void> addSection(SectionModel sectionModel, String userId) async {
    CollectionReference<SectionModel> getsecs = getSectionsCollection(userId);
    DocumentReference<SectionModel> doc = getsecs.doc();
    sectionModel.id = doc.id;
    return doc.set(sectionModel);
  }

  static Future<void> updateSection(SectionModel sectionModel, String userId) async {
    CollectionReference<SectionModel> getsecs = getSectionsCollection(userId);
    return getsecs.doc(sectionModel.id).update(sectionModel.toJson());
  }

  static Future<void> deleteSection(SectionModel sectionModel, String userId) async {
    CollectionReference<SectionModel> getsecs = getSectionsCollection(userId);
    return getsecs.doc(sectionModel.id).delete();
  }

  static Future<List<SectionModel>> getSectionFromFireStore(String userId) async {
    CollectionReference<SectionModel> getsecs = getSectionsCollection(userId);
    QuerySnapshot<SectionModel> querySnapshot = await getsecs.get();
    return querySnapshot.docs.map((e) => e.data()).toList();
  }

  static CollectionReference<SectionContentModel> getContentSectionCollection(
      SectionModel sectionModel,
      String userId,
      ) {
    return getSectionsCollection(userId)
        .doc(sectionModel.id)
        .collection('contents')  // Use a fixed collection name
        .withConverter<SectionContentModel>(
      fromFirestore: (docSnapshot, _) {
        final data = docSnapshot.data() ?? {};
        // Ensure we're passing the section ID when creating from Firestore
        return SectionContentModel.fromJson({
          ...data,
          'sectionId': sectionModel.id,
          'sectionContentId': docSnapshot.id,
        });
      },
      toFirestore: (sec, _) => sec.toJson(),
    );
  }

  static Future<void> addSectionContent(
      String userId,
      SectionModel sectionModel,
      SectionContentModel sectionContentModel,
      ) async {
    try {
      final getSecContent = getContentSectionCollection(sectionModel, userId);
      final doc = getSecContent.doc();

      // Create a new model with all required fields
      final updatedModel = SectionContentModel(
        sectionContentId: doc.id,
        title: sectionContentModel.title,
        sectionId: sectionModel.id,
      );

      await doc.set(updatedModel);
    } catch (e) {
      print("Error adding section content: $e");
      rethrow;
    }
  }

  static Future<List<SectionContentModel>> getSectionsContent(
      String userId,
      SectionModel sectionModel,
      ) async {
    try {
      final getSecContent = getContentSectionCollection(sectionModel, userId);
      final QuerySnapshot<SectionContentModel> querySnapshot = await getSecContent.get();
      return querySnapshot.docs.map((e) => e.data()).toList();
    } catch (e) {
      print("Error fetching section content: $e");
      rethrow;
    }
  }
}