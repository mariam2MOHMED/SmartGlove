import 'package:flutter/material.dart';
import 'package:graduationproject/app_theme.dart';
import 'package:graduationproject/auth/view/widget/dft_btn.dart';

import '../widget/show_dialog.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  var sectionController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          DftButton(txt: "Add a Section",
              onPress: addSection,
          txtColor: Colors.white,
          borderColor: AppTheme.primary,
          bg: AppTheme.primary),
            SizedBox(height:24.0 ,),
            DftButton(txt: "Add a Sentence",
                onPress: addSection,
                txtColor: Colors.white,
                borderColor: AppTheme.primary,
                bg: AppTheme.primary),
          ],
        ),
      ),
    );
  }
  addSection(){
    showDialog(context: context,
        builder: (context)=>
            ShowDialog(
              sentenceController: sectionController,
    ));
  }
}
