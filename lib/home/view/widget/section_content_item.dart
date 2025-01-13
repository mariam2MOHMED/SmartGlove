import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/app_theme.dart';
import 'package:graduationproject/home/models/section_model.dart';
import 'package:graduationproject/utils/provider/setting_provider.dart';
import 'package:provider/provider.dart';

import '../../models/section_content_model.dart';

class SectionContentItem extends StatelessWidget {
  SectionContentModel sectionContentModel;
   SectionContentItem({required this.sectionContentModel});

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider=Provider.of<SettingProvider>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
decoration: BoxDecoration(
  color: settingProvider.themeMode==ThemeMode.dark? AppTheme.darksecondary:AppTheme.thirdcolor,
  borderRadius: BorderRadius.circular(12.0)
),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0
        ),
        child: Text(sectionContentModel.title,
          textAlign: TextAlign.center,
          style:
        TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: AppTheme.white
        ),),
      ),
    );
  }
}
