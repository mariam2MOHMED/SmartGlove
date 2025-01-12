import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/app_theme.dart';
import 'package:graduationproject/auth/view/screens/login_screen.dart';
import 'package:graduationproject/auth/view/screens/register_screen.dart';
import 'package:graduationproject/auth/view/screens/welcome_screen.dart';
import 'package:graduationproject/utils/provider/section_content_provider.dart';
import 'package:graduationproject/utils/provider/section_provider.dart';
import 'package:graduationproject/utils/provider/setting_provider.dart';
import 'package:graduationproject/utils/provider/user_provider.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'home/view/screens/home_page.dart';
import 'home/view/screens/section_content_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create:
        (BuildContext context) =>UserProvider()),
   ChangeNotifierProvider(create:
  (BuildContext context) =>SectionProvider()),
        ChangeNotifierProvider(create: (_) => SectionContentProvider()),
        ChangeNotifierProvider(create:
            (BuildContext context) =>SettingProvider()..
            getTheme()),
    ],
    child: GradProject()));
}
class GradProject extends StatelessWidget {
  const GradProject({super.key});

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider=Provider.of<SettingProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     themeMode: settingProvider.themeMode,
     darkTheme: AppTheme.darkTheme,
     theme: AppTheme.lightTheme,
     routes: {
        WelcomeScreen.routeName:(_)=>WelcomeScreen(),
       RegisterScreen.routeName:(_)=>RegisterScreen(),
       LoginScreen.routeName:(_)=>LoginScreen(),
        SectionContentScreen.routeName:(_)=>SectionContentScreen(),
     //HomePage
       HomePage.routeName:(_)=>HomePage(),
        },
      initialRoute:WelcomeScreen.routeName,
    );
  }
}
