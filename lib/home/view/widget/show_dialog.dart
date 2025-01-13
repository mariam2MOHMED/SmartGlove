import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduationproject/app_theme.dart';
import 'package:graduationproject/home/models/section_model.dart';
import 'package:graduationproject/utils/firebase_functions.dart';
import 'package:graduationproject/utils/provider/section_provider.dart';
import 'package:graduationproject/utils/provider/user_provider.dart';
import 'package:provider/provider.dart';

import '../../../utils/provider/setting_provider.dart';

class ShowDialog extends StatelessWidget {
  final TextEditingController sentenceController;

  ShowDialog({required this.sentenceController});

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider=Provider.of<SettingProvider>(context);
    return AlertDialog(
      backgroundColor: AppTheme.white,
      title: Center(child:
      Text("Add A Section", style: TextStyle(fontSize: 18,
      color: settingProvider.themeMode==ThemeMode.dark?AppTheme.darksecondary:AppTheme.primary
      ))),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: sentenceController,
            style: TextStyle(
                color: settingProvider.themeMode==ThemeMode.dark?
                AppTheme.black:AppTheme.black
            ),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: "Write A Section",
              hintStyle: TextStyle(
                color:
                settingProvider.themeMode==ThemeMode.dark?AppTheme.darksecondary:AppTheme.primary,
                fontSize: 14.0
              ),
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
                child: Text("Close", style:
                TextStyle(
                  color:
                  settingProvider.themeMode==ThemeMode.dark?AppTheme.darksecondary:AppTheme.primary,
                )),
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
                        backgroundColor: AppTheme.primary,
                        fontSize: 18.0,
                        gravity: ToastGravity.BOTTOM,
                        toastLength: Toast.LENGTH_LONG,
                        textColor: Colors.white,
                      );
                    });
                  }
                },
                child: Text("Add",
                    style: TextStyle( color:
                    settingProvider.themeMode==ThemeMode.dark?AppTheme.darksecondary:AppTheme.primary,)),
              ),

            ],
          )
        ],
      ),
    );
  }
}

