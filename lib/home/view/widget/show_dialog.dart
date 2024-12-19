import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduationproject/app_theme.dart';
import 'package:graduationproject/home/models/section_model.dart';
import 'package:graduationproject/utils/firebase_functions.dart';
import 'package:graduationproject/utils/provider/section_provider.dart';
import 'package:graduationproject/utils/provider/user_provider.dart';
import 'package:provider/provider.dart';

class ShowDialog extends StatelessWidget {
  final TextEditingController sentenceController;

  ShowDialog({required this.sentenceController});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text("Add A Section", style: TextStyle(fontSize: 18))),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: sentenceController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: "Write A Section",
              border: UnderlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Close", style: TextStyle(color: AppTheme.primary)),
              ),
              TextButton(
                onPressed: () {
                  String sentence = sentenceController.text.trim();
                  if (sentence.isNotEmpty) {
                    final userId = Provider.of<UserProvider>(context,
                        listen: false).curruser!.id;

                    // Add the section using SectionProvider
                    Provider.of<SectionProvider>(context, listen: false)
                        .addSection(sentence, userId)
                        .then((_) {
                      Navigator.pop(context); // Close the dialog
                      Fluttertoast.showToast(
                        msg: "Section added successfully",
                        backgroundColor: AppTheme.secondary,
                        fontSize: 18.0,
                        gravity: ToastGravity.BOTTOM,
                        toastLength: Toast.LENGTH_LONG,
                        textColor: AppTheme.primary,
                      );
                    });
                  }
                },
                child: Text("Add",
                    style: TextStyle(color: AppTheme.primary)),
              ),

            ],
          )
        ],
      ),
    );
  }
}

