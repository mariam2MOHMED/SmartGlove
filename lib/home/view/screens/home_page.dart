import 'package:flutter/material.dart';
import 'package:graduationproject/home/view/screens/home_screen.dart';
import 'package:graduationproject/home/view/screens/sections_screen.dart';
import 'package:graduationproject/home/view/screens/add_screen.dart';
import 'package:graduationproject/utils/provider/setting_provider.dart';
import 'package:provider/provider.dart';

import '../widget/drawer.dart';

class HomePage extends StatefulWidget {
  static String routeName="/HomePage";
   HomePage({super.key});
List<String>titles=["Home","Sections","Additions"];
   List<Widget>screens=[
 HomeScreen(),
 SectionsScreen(),
     AddScreen()
   ];
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int  currindex=0;
  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider=Provider.of<SettingProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
appBar: AppBar(
  title:Text(widget.titles[currindex]) ,
  actions: [
   IconButton(onPressed: (){
     bool isDark=true;
     isDark=!isDark;
     settingProvider.ChangeTheme(isDark?ThemeMode.dark:ThemeMode.light);

   },
       icon: Icon(Icons.dark_mode,
   color: Colors.white,
   ))
  ],
),
      drawer: HomeDrawer(),
      body: widget.screens[currindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currindex,
        onTap: (index){
          currindex=index;
          setState(() {

          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,size: 30,),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_open_rounded,size: 30.0,),
              label: 'Section'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add,size: 30,),
              label: 'Add'),
        ],
      ),
    );
  }
}
