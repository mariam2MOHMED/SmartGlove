import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduationproject/app_theme.dart';
import 'package:graduationproject/home/models/section_content_model.dart';
import 'package:graduationproject/home/models/section_model.dart';
import 'package:graduationproject/utils/firebase_functions.dart';
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
      title: Center(child: Text("Add A Sentence",
          style: TextStyle(fontSize: 18))),
      content: Column(
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
            mainAxisAlignment:
            MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Close",
                    style: TextStyle(color: AppTheme.primary)),
              ),
              TextButton(
                onPressed: () async{
                final userId=Provider.of<UserProvider>
                  (context,listen: false).curruser!.id;
                final sections = Provider.of<SectionProvider>
                  (context, listen: false).sections;
                for (var section in sections) {
                  Provider.of<SectionContentProvider>
                    (context,listen: false).addContentSection
                    (userId,
                      section,
                      SectionContentModel
                        (txt: sentenceController.text)).then(
                          (value) {
                        Navigator.of(context).pop();
                        Provider.of<SectionContentProvider>
                          (context,listen: false).getAlSecsContent
                          (userId, section)  ;

                        Fluttertoast.showToast(
                          msg: "Sentence added successfully",
                          backgroundColor: AppTheme.secondary,
                          fontSize: 18.0,
                          gravity: ToastGravity.BOTTOM,
                          toastLength: Toast.LENGTH_LONG,
                          textColor: AppTheme.primary,
                        );
                      }).catchError((e){
                    print("the error is $e");
                  })  ;

                }

                },
                child: Text("Add",
                    style: TextStyle(
                        color: AppTheme.primary)),
              ),

            ],
          )
        ],
      ),
    );
  }
}

