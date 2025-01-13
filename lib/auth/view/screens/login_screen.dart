import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/app_theme.dart';
import 'package:graduationproject/auth/view/screens/register_screen.dart';
import 'package:graduationproject/auth/view/widget/dft_btn.dart';
import 'package:graduationproject/auth/view/widget/dft_txt_field.dart';
import 'package:graduationproject/utils/provider/setting_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../../../home/view/screens/home_page.dart';
import '../../../utils/firebase_functions.dart';
import '../../../utils/provider/user_provider.dart';

class LoginScreen extends StatefulWidget {
  static String routeName="/LoginScreen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var fromkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider=Provider.of<SettingProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: fromkey,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                Image.asset(settingProvider.themeMode==ThemeMode.dark?
                "assets/images/login_img_dark.png"
                    :"assets/images/login_img.png",
                width: MediaQuery.of(context).size.width,
                  height:MediaQuery.of(context).size.height*0.45,
                  fit: BoxFit.fill,
                ),
        Column(

          children: [
            SizedBox(height: 70.0,),
            Align(
              alignment: AlignmentDirectional.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.handHoldingDroplet,
                    color: settingProvider.themeMode==ThemeMode.dark?
                    AppTheme.white:AppTheme.black, size: 32.0,),
                  Text("  Smart Glove",style:Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.26,),
            Align(
                alignment: AlignmentDirectional.center,
                child: Text("Login",style: Theme.of(context)
                    .textTheme.titleMedium)
            ),
            SizedBox(height: 30.0,),
          ],
        ),
              ],
            ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 20.0,),
                dftTxtField(

                  controller: emailController, hinttxt: "E-mail",
                  prefixIcon: Icons.email,
                  validator: (value){
                    if(value!.isEmpty||value==null){
                      return "Email must be not empty";
                    }else{
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 26.0,),
                dftTxtField(
                  controller: passwordController,
                  hinttxt: "Password",
                  prefixIcon: Icons.password,
                  isPassword: true,
                  validator: (value){
                    if(value!.isEmpty||value==null){
                      return "Password must be not empty";
                    }else{
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20.0,),
                DftButton(txt: "Log in",
                    onPress: login, txtColor: AppTheme.white,
                    height: 50.0,
                    radius: 6.0,
                    borderColor:settingProvider.themeMode==ThemeMode.dark?
                    AppTheme.darksecondary:AppTheme.black,
                    bg: settingProvider.themeMode==ThemeMode.dark?
                    AppTheme.darksecondary:AppTheme.black,),
                const SizedBox(height: 28.0,),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Row(
                    children: [
                      Text("Don't have an account? ",
                        style:Theme.of(context).textTheme.headlineSmall),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).
                          pushNamed(RegisterScreen.routeName);
                        },
                        child: Text(" Create Account",
                            style:Theme.of(context).textTheme.titleSmall),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          )

          ],
        ),
      ),
    );
  }
  void login(){
    if(fromkey.currentState!.validate()){
      FirebaseUtils.login(email: emailController.text,

          password: passwordController.text).then((user) {
        Provider.of<UserProvider>(context,listen: false).
        getUser(user);
        Fluttertoast.showToast(msg: "${user.name} logined sucessfuly",
            backgroundColor:
            Provider.of<SettingProvider>(context,listen: false).themeMode==ThemeMode.dark?
            AppTheme.darksecondary:AppTheme.primary,
            fontSize: 18.0,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            toastLength: Toast.LENGTH_LONG,
            textColor: AppTheme.white
        );
        Navigator.of(context).pushNamed(HomePage.routeName);
      }).catchError((e){
        Fluttertoast.showToast(msg: "something went wrong!",
            backgroundColor: Colors.red,
            fontSize: 18.0,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            toastLength: Toast.LENGTH_LONG,
            textColor: AppTheme.primary
        );
        print("the error is $e");
      });
    }
  }

}
