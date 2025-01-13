import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SettingProvider with ChangeNotifier{
   ThemeMode themeMode=ThemeMode.light;
   Future<void> ChangeTheme(ThemeMode selectTheme)async{
    themeMode=selectTheme;
    final SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
   await sharedPreferences.setBool("isDark", selectTheme==ThemeMode.dark);
    notifyListeners();
  }
  Future<void>getTheme()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDark=  await prefs.getBool("isDark");
    if(isDark!=null){
      if(isDark==true){
        themeMode=ThemeMode.dark;
      }else{
        themeMode=ThemeMode.light;
      }
    }
    notifyListeners();
  }
}