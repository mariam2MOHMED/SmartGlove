import 'package:flutter/material.dart';
import 'package:graduationproject/app_theme.dart';

import '../../models/section_model.dart';
import '../screens/section_content_screen.dart';

class SectionItem extends StatelessWidget {
  SectionModel sectionModel;
  int index;
   SectionItem({
    required this.sectionModel,
     required this.index,
});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
Navigator.of(context).pushNamed(
    SectionContentScreen.routeName,arguments: sectionModel);
      },
      child: Container(
        decoration:
        BoxDecoration(
          color: AppTheme.thirdcolor,
          borderRadius: BorderRadius.only(
           topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(index.isEven?20:0),
           bottomRight : Radius.circular(index.isOdd?20:0),
          )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 10.0),
          child: Center(
            child: Text(sectionModel.text,
            style: TextStyle(
              color: AppTheme.white,
             fontSize: 24.0,
             fontWeight: FontWeight.w500
            ),
            ),
          ),
        ),
      ),
    );
  }
}
