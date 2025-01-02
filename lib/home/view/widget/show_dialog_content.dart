import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduationproject/app_theme.dart';
import 'package:graduationproject/home/models/section_content_model.dart';
import 'package:graduationproject/utils/provider/section_content_provider.dart';
import 'package:graduationproject/utils/provider/section_provider.dart';
import 'package:graduationproject/utils/provider/user_provider.dart';
import 'package:provider/provider.dart';

class ShowDialogContent extends StatelessWidget {
  final TextEditingController sentenceController;

  ShowDialogContent({required this.sentenceController});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          "Add A Sentence",
          style: TextStyle(fontSize: 18),
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: sentenceController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: "Write A Sentence",
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Close Button
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Close",
                    style: TextStyle(color: AppTheme.primary),
                  ),
                ),
                // Add Button
                TextButton(
                  onPressed: () async {
                    await _addSentence(context);
                  },
                  child: Text(
                    "Add",
                    style: TextStyle(color: AppTheme.primary),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _addSentence(BuildContext context) async {
    final userId = Provider.of<UserProvider>(context, listen: false).curruser?.id ?? '';
    if (userId.isEmpty) {
      Fluttertoast.showToast(msg: "User ID is not available.");
      return;
    }

    final sections = Provider.of<SectionProvider>(context, listen: false).sections ?? [];
    if (sections.isEmpty) {
      Fluttertoast.showToast(msg: "No sections found.");
      return;
    }

    try {
      for (var section in sections) {
        await Provider.of<SectionContentProvider>(context, listen: false)
            .addContentSection(
          userId,
          section,
          SectionContentModel(txt: sentenceController.text),
        );
      }

      Fluttertoast.showToast(
        msg: "Sentence added successfully",
        backgroundColor: AppTheme.secondary,
        fontSize: 18.0,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
        textColor: AppTheme.primary,
      );
    } catch (e) {
      Fluttertoast.showToast(msg: "Failed to add sentence: $e");
      print("Error: $e");
    } finally {
      Navigator.of(context).pop();
    }
  }
}
