import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/app_theme.dart';
import 'package:graduationproject/utils/provider/setting_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    SettingProvider settingProvider=Provider.of<SettingProvider>(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Padding(
          padding: const EdgeInsets.symmetric
            (horizontal: 16.0),
          child: TextFormField(
          obscureText: false,
            validator: (value){
              if(value!.isEmpty||value==null){
                return "Item must be not empty";
              }else{
                return null;
              }
            },
          style: TextStyle(
              color: Colors.black,
              fontSize: 15.0
          ),
                 // controller: widget.controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
                fillColor: Colors.white,
              filled: true,

              prefixIcon:Icon(CupertinoIcons.hand_point_right_fill,
                color:settingProvider.themeMode==ThemeMode.dark?
                AppTheme.black:
                AppTheme.primary,),
              hintText: "Enter an item",

              hintStyle: TextStyle(
                  color: settingProvider.themeMode==
                      ThemeMode.dark?AppTheme.black
                      :AppTheme.primary,
                  fontSize: 16.0
              ),
              border:UnderlineInputBorder(
                  borderSide: BorderSide(
                      color:settingProvider.themeMode==
                          ThemeMode.dark?
                      Color(0xffE5E5E5):  Color(0xff64748B)
                  )
              )
          ),
                ),
        )
        ],
      ),
    );
  }
}
