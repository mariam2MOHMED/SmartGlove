import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/app_theme.dart';
import 'package:graduationproject/auth/view/screens/login_screen.dart';
import 'package:graduationproject/auth/view/screens/register_screen.dart';
import 'package:graduationproject/auth/view/widget/dft_btn.dart';

class WelcomeScreen extends StatelessWidget {
  static String routeName="/WelcomeScreen";
   WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                        AssetImage('assets/images/logo.png',
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
              txt: "Sign Up", txtColor: Colors.white,
              borderColor: AppTheme.primary, bg:  AppTheme.primary),
              ),
              SizedBox(width: 20.0,),
              Expanded(
          child: DftButton(txt: "Sign In",
              txtColor: AppTheme.primary,
              onPress: (){
                Navigator.of(context).pushNamed(
                    LoginScreen.routeName);
              },
              borderColor:AppTheme.primary,
              bg:  Colors.white ),
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
