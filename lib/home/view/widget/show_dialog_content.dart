import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduationproject/app_theme.dart';
import 'package:graduationproject/utils/provider/section_content_provider.dart';
import 'package:graduationproject/utils/provider/setting_provider.dart';
import 'package:graduationproject/utils/provider/user_provider.dart';
import 'package:provider/provider.dart';

import '../../models/section_model.dart';

// class ShowDialogContent extends StatelessWidget {
//   final TextEditingController sentenceController;
//   final SectionModel currentSection;  // Add this parameter
//
//   ShowDialogContent({
//     required this.sentenceController,
//     required this.currentSection,  // Require this parameter
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Center(child: Text("Add A Sentence", style: TextStyle(fontSize: 18))),
//       content: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(
//               controller: sentenceController,
//               textAlign: TextAlign.center,
//               decoration: InputDecoration(hintText: "Write A Sentence", border: UnderlineInputBorder()),
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 TextButton(
//                   onPressed: () => Navigator.of(context).pop(),
//                   child: Text("Close", style: TextStyle(color: AppTheme.primary)),
//                 ),
//                 TextButton(
//                   onPressed: () async => await _addSentence(context),
//                   child: Text("Add", style: TextStyle(color: AppTheme.primary)),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> _addSentence(BuildContext context) async {
//     final userId = Provider.of<UserProvider>(context, listen: false).curruser?.id ?? '';
//     if (userId.isEmpty) {
//       Fluttertoast.showToast(msg: "User ID is not available.");
//       return;
//     }
//
//     try {
//       // Create content only for the current section
//       await Provider.of<SectionContentProvider>(context, listen: false).addContentSection(
//         userId,
//         currentSection,
//         SectionContentModel(
//           title: sentenceController.text,
//           sectionId: currentSection.id,  // Add the section ID
//         ),
//       );
//
//       Fluttertoast.showToast(
//         msg: "Sentence added successfully",
//         backgroundColor: AppTheme.grey,
//         fontSize: 18.0,
//         gravity: ToastGravity.BOTTOM,
//         toastLength: Toast.LENGTH_LONG,
//         textColor: AppTheme.primary,
//       );
//     } catch (e) {
//       Fluttertoast.showToast(msg: "Failed to add sentence: $e");
//       print("Error: $e");
//     } finally {
//       Navigator.of(context).pop();
//     }
//   }
// }
class ShowDialogContent extends StatelessWidget {
  final TextEditingController sentenceController;
  final SectionModel currentSection;

  const ShowDialogContent({
    required this.sentenceController,
    required this.currentSection,
  });

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider=Provider.of<SettingProvider>(context);
    return AlertDialog(
      backgroundColor: AppTheme.white,
      title: Text("Add New Item",style: TextStyle(
        color: settingProvider.themeMode==ThemeMode.dark?AppTheme.darksecondary:AppTheme.primary
      ),),
      content: TextField(
        controller: sentenceController,
        style: TextStyle(
            color: settingProvider.themeMode==ThemeMode.dark?
            AppTheme.black:AppTheme.black
        ),
        decoration: InputDecoration(hintText:
        "Enter item name",hintStyle: TextStyle(
            color: settingProvider.themeMode==ThemeMode.dark?
            AppTheme.darksecondary:AppTheme.primary
                ,   fontSize: 14.0
        )),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel",style: TextStyle(
              color: settingProvider.themeMode==ThemeMode.dark?AppTheme.darksecondary:AppTheme.primary
          )),
        ),
        TextButton(
          onPressed: () async {
            if (sentenceController.text.isNotEmpty) {
              final userId = Provider.of<UserProvider>(context, listen: false).curruser!.id!;
              final newItem = SectionContentModel(
                title: sentenceController.text,
                sectionId: currentSection.id,
              );

              await Provider.of<SectionContentProvider>(context, listen: false)
                  .addContentSection(userId, currentSection, newItem);
              Fluttertoast.showToast(msg: "sentence added sucessfuly",
                  backgroundColor: AppTheme.primary,
                  fontSize: 18.0,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  toastLength: Toast.LENGTH_LONG,
                  textColor: AppTheme.white
              );
              Navigator.pop(context);
            }
          },
          child: Text("Add",style: TextStyle(
              color: settingProvider.themeMode==ThemeMode.dark?AppTheme.darksecondary:AppTheme.primary
          ),),
        ),
      ],
    );
  }
}