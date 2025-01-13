import 'package:flutter/material.dart';
import 'package:graduationproject/app_theme.dart';
import 'package:graduationproject/auth/view/widget/dft_btn.dart';
import 'package:graduationproject/home/view/screens/section_screen_list.dart';
import 'package:graduationproject/utils/provider/setting_provider.dart';
import 'package:provider/provider.dart';

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
    SettingProvider settingProvider=Provider.of<SettingProvider>(context);
    return
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          DftButton(txt: "Add a Section",
              onPress: addSection,
          txtColor: Colors.white,
          borderColor:settingProvider.themeMode==ThemeMode.dark?
          AppTheme.darksecondary:AppTheme.thirdcolor,
          bg: settingProvider.themeMode==ThemeMode.dark?
          AppTheme.darksecondary:AppTheme.thirdcolor,),
            SizedBox(height:24.0 ,),
            DftButton(txt: "Go to Sections",
                onPress: navigateTo,
                txtColor: Colors.white,
                borderColor: settingProvider.themeMode==ThemeMode.dark? AppTheme.darksecondary:AppTheme.thirdcolor,
                bg: settingProvider.themeMode==ThemeMode.dark? AppTheme.darksecondary:AppTheme.thirdcolor,),
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
  navigateTo(){
Navigator.push(context, MaterialPageRoute(builder: (context)=>
    SectionsScreenList()
));
  }
}
