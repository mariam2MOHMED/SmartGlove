import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/app_theme.dart';
import 'package:graduationproject/auth/view/screens/register_screen.dart';
import 'package:graduationproject/auth/view/widget/dft_btn.dart';
import 'package:graduationproject/auth/view/widget/dft_txt_field.dart';
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20.0),
        child: Form(
          key: fromkey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text("Sign\n In",style: GoogleFonts.abrilFatface(
                    fontSize:30.0,
                    fontWeight:FontWeight.bold,
                    color:AppTheme.primary,
                  ),),
                ),
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
                const SizedBox(height: 20.0,),
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
                const SizedBox(height: 40.0,),
                DftButton(txt: "Login",
                    onPress: login, txtColor: Colors.white,
                    borderColor: AppTheme.primary, bg: AppTheme.primary),
                const SizedBox(height: 20.0,),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).
                      pushNamed(RegisterScreen.routeName);
                    },
                    child: Text("Don't have an account",
                      style: GoogleFonts.abrilFatface(
                      fontSize:30.0,
                      fontWeight:FontWeight.bold,
                      color:AppTheme.primary,
                    ),),
                  ),
                ),


              ],
            ),
          ),
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
            backgroundColor: AppTheme.secondary,
            fontSize: 18.0,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            toastLength: Toast.LENGTH_LONG,
            textColor: AppTheme.primary
        );
        Navigator.of(context).pushNamed(HomePage.routeName);
      }).catchError((e){
        print("the error is $e");
      });
    }
  }

}
