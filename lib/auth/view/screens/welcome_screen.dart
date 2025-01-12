import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/app_theme.dart';
import 'package:graduationproject/auth/view/screens/login_screen.dart';
import 'package:graduationproject/auth/view/screens/register_screen.dart';
import 'package:graduationproject/auth/view/widget/dft_btn.dart';
import 'package:provider/provider.dart';

import '../../../utils/provider/setting_provider.dart';

class WelcomeScreen extends StatelessWidget {
  static String routeName="/WelcomeScreen";
   WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider=Provider.of<SettingProvider>(context);
    return Scaffold(

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 115.0,
                backgroundImage:
                        AssetImage(settingProvider.themeMode==ThemeMode.dark?

                        "assets/images/logo_dark.jpg":
                        "assets/images/logo_light.jpg",
                ),

              ),
              SizedBox(height: 40.0,),
          Row(
            children: [
              Expanded(
          child: DftButton(
              onPress: (){
              Navigator.of(context).pushNamed(
                  RegisterScreen.routeName);
              },
              txt: "Sign Up", txtColor:settingProvider.themeMode==ThemeMode.dark?
          Colors.white:Colors.white,
              borderColor:settingProvider.themeMode==ThemeMode.dark?
              AppTheme.darksecondary:AppTheme.primary,
              bg: settingProvider.themeMode==ThemeMode.dark?
              AppTheme.darksecondary:AppTheme.primary),
              ),
              SizedBox(width: 20.0,),
              Expanded(
          child: DftButton(txt: "Sign In",
              txtColor: settingProvider.themeMode==ThemeMode.dark?
              AppTheme.white:AppTheme.primary,
              onPress: (){
                Navigator.of(context).pushNamed(
                    LoginScreen.routeName);
              },
              borderColor:settingProvider.themeMode==ThemeMode.dark?
              AppTheme.darksecondary:AppTheme.primary,
              bg:settingProvider.themeMode==ThemeMode.dark?
              AppTheme.darkprimary:Colors.white),
              ),

            ],
          )
            ],
          ),
        ),
      ),
    );
  }
}
