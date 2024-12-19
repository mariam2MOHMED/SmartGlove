import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduationproject/auth/view/screens/login_screen.dart';
import 'package:graduationproject/auth/view/widget/dft_txt_field.dart';
import 'package:graduationproject/home/view/screens/home_page.dart';
import 'package:graduationproject/utils/firebase_functions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../../../app_theme.dart';
import '../../../utils/provider/user_provider.dart';
import '../widget/dft_btn.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName="/RegisterScreen";
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}
class _RegisterScreenState extends State<RegisterScreen> {
  var nameController=TextEditingController();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  XFile? selectedFile;
  var fromkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 35.0),
        child: Form(
          key: fromkey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // InkWell(
                //   onTap: (){
                //     uploadPhoto();
                //   },
                //   child: CircleAvatar(
                //     radius: 50.0,
                //     backgroundImage:selectedFile!=null? FileImage(
                //         File(selectedFile!.path)):null,
                //    backgroundColor: AppTheme.primary,
                //     child:selectedFile==null?
                //     Icon(Icons.person,color: AppTheme.secondary,
                //       size: 40.0,):null,
                //   ),
                // ),
Align(
  alignment: AlignmentDirectional.topStart,
  child: Text("Create\n Account",
    style: GoogleFonts.abrilFatface(
    fontSize:30.0,
    fontWeight:FontWeight.bold,
    color:AppTheme.primary,
  ),),
),
                const SizedBox(height: 20.0,),
                dftTxtField(

                  controller: nameController, hinttxt: "Name",
                  prefixIcon: Icons.person,
                  validator: (value){
                    if(value!.isEmpty||value==null){
                      return "Name must be not empty";
                    }else{
                      return null;
                    }
                  },
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

                  controller: passwordController, hinttxt: "Password",
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
                DftButton(txt: "Register",
                    onPress: register,
                    txtColor: Colors.white,
                    borderColor: AppTheme.primary,
                    bg: AppTheme.primary),
                const SizedBox(height: 20.0,),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).pushNamed(
                        LoginScreen.routeName
                      );
                    },
                    child: Text("Already Have an account",
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
  void register(){
    if(fromkey.currentState!.validate()){
FirebaseUtils.register(email: emailController.text,
    name: nameController.text,
    password: passwordController.text).then((user) {
  Provider.of<UserProvider>(context,listen: false).getUser(user);
  Fluttertoast.showToast(msg: "${user.name}  registered sucessfuly",
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
  uploadPhoto()async{
    ImagePicker picker=ImagePicker();
    var status=await Permission.storage.request();
    if(status==PermissionStatus.granted){
      var photo=await picker.pickImage
        (source: ImageSource.gallery);
      if(photo!=null){
        photo=selectedFile;
        setState(() {});
      }
    }

  }
}
