import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static Color primary=Color(0xff6a9277);
  static Color secondary=Color(0xffc6c7c6);
  static Color thirdcolor=Color(0xff85A98F);
  static Color white=Color(0xffFFFFFF);
  static Color fourthcolor=Color(0xffD3F1DF);
  static Color black=Color(0xff000008);
  static ThemeData lightTheme=ThemeData(
    drawerTheme: DrawerThemeData(

    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
      backgroundColor: primary,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedItemColor: AppTheme.secondary,
      unselectedItemColor: white,
      selectedIconTheme: IconThemeData(
        size: 30.0,

      )
    ),

    appBarTheme: AppBarTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
          bottomStart: Radius.circular(50),
            bottomEnd: Radius.circular(50),
          topEnd: Radius.zero, topStart: Radius.zero
        )
      ),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22.0,
        color: white
      ),
      backgroundColor: primary,
      foregroundColor: white,
      centerTitle: true
    )
  );
}