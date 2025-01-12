import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AppTheme{
  static Color primary=Color(0xff6a9277);
  static Color grey=Color(0xffc6c7c6);
  static Color thirdcolor=Color(0xff85A98F);
  static Color white=Color(0xffFFFFFF);
  static Color fourthcolor=Color(0xffD3F1DF);
  static Color black=Color(0xff000113);
  static Color dark_txt_login=Color(0xff94A3B8);
  static Color dark_grey=Color(0xff475569);
  static Color txt_black=Color(0xff1E293B);
  static Color divder=Color(0xffCBD5E1);
  //334155
  static Color darkprimary=Color(0xff1E293B);
  static Color darksecondary=Color(0xff334155);
  static ThemeData lightTheme=ThemeData(
    scaffoldBackgroundColor: white,
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.roboto(
          fontWeight: FontWeight.bold,
          color: AppTheme.white,
          fontSize: 22.0
      ) ,
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
color: txt_black,
        fontSize: 24.0
      ),
      headlineSmall:GoogleFonts.roboto(
          fontWeight: FontWeight.w600,
          color: grey,
          fontSize: 18.0
      ) ,
        titleSmall: GoogleFonts.roboto(
            fontWeight: FontWeight.w600,
            color: black,
            fontSize: 18.0
        ),
      titleMedium: GoogleFonts.roboto(
          fontWeight: FontWeight.bold,
          color: black,
          fontSize: 28.0
      )
    ),
    drawerTheme: DrawerThemeData(

    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
      backgroundColor: primary,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedItemColor: AppTheme.grey,
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
  static ThemeData darkTheme=ThemeData(
    scaffoldBackgroundColor: black,
      textTheme: TextTheme(
          headlineSmall:GoogleFonts.roboto(
              fontWeight: FontWeight.w600,
              color: dark_txt_login,
              fontSize: 18.0
          ) ,
          titleSmall: GoogleFonts.roboto(
              fontWeight: FontWeight.w600,
              color: white,
              fontSize: 16.0
          ),
          titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: txt_black,
              fontSize: 24.0
          ),
          titleMedium: GoogleFonts.roboto(
              fontWeight: FontWeight.bold,
              color: white,
              fontSize: 28.0
          )
      ),
      drawerTheme: DrawerThemeData(

      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: primary,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedItemColor: AppTheme.grey,
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