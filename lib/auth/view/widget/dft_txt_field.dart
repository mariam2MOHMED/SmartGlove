import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/app_theme.dart';

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
    return TextFormField(
      obscureText: isObsecure,
      validator:widget.validator,

      controller: widget.controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        prefixIcon:Icon(widget.prefixIcon??null,
          color: AppTheme.primary,),
        hintText: widget.hinttxt,
suffixIcon: widget.isPassword==true?IconButton(onPressed:
(){
  isObsecure= !isObsecure;
  setState(() {});
}, icon: Icon(isObsecure==true?Icons.visibility:
Icons.visibility_off,color: AppTheme.secondary,)):null,
        hintStyle: TextStyle(
          color: Colors.black,
          fontSize: 14.0
        ),
        border:OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),

        )
      ),
    );
  }
}
