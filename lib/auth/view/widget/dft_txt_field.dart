import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/app_theme.dart';
import 'package:graduationproject/utils/provider/setting_provider.dart';
import 'package:provider/provider.dart';

class dftTxtField extends StatefulWidget {
  String hinttxt;
TextEditingController controller;
IconData? prefixIcon;
  String? Function(String?)? validator;
bool isPassword;
   dftTxtField({
     this.prefixIcon,
     this.validator,
     required this.controller,
     this.isPassword=false,
     required this.hinttxt});

  @override
  State<dftTxtField> createState() => _dftTxtFieldState();
}

class _dftTxtFieldState extends State<dftTxtField> {
  bool isObsecure=false;


  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider=Provider.of<SettingProvider>(context);
    return TextFormField(
      obscureText: isObsecure,
      validator:widget.validator,
style: settingProvider.themeMode==ThemeMode.dark?TextStyle(
  color: Colors.white,
  fontSize: 15.0
):TextStyle(
    color: Colors.black,
    fontSize: 15.0
),
      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(

        prefixIcon:Icon(widget.prefixIcon??null,
          color:settingProvider.themeMode==ThemeMode.dark?
          AppTheme.white:
          AppTheme.primary,),
        hintText: widget.hinttxt,

suffixIcon: widget.isPassword==true?IconButton(onPressed:
(){
  isObsecure= !isObsecure;
  setState(() {});
}, icon: Icon(isObsecure==true?Icons.visibility:
Icons.visibility_off,color: AppTheme.grey,)):null,
        hintStyle: TextStyle(
          color: settingProvider.themeMode==ThemeMode.dark?AppTheme.white:Colors.black,
          fontSize: 16.0
        ),
        border:UnderlineInputBorder(
       borderSide: BorderSide(
         color:settingProvider.themeMode==ThemeMode.dark?
         Color(0xffE5E5E5):  Color(0xff64748B)
       )
        )
      ),
    );
  }
}
