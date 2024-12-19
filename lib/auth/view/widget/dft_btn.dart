import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DftButton extends StatelessWidget {
  Color bg;
  Color borderColor;
  Color txtColor;
  double? width;
  String txt;
  Function() onPress;
   DftButton({
    required this.txt,
     required this.onPress,
     required this.txtColor,
     required this.borderColor,
     required this.bg,
     this.width
});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

style: ElevatedButton.styleFrom(
  backgroundColor: bg,

  fixedSize: Size(width??MediaQuery.of(context).size.width, 70),
  shape: RoundedRectangleBorder(
    side: BorderSide(
      width: 5,
      color: borderColor
    ),
    borderRadius:BorderRadius.circular(20)
  )
),
        onPressed:onPress,
        child: Text(txt,style: 
        GoogleFonts.abrilFatface(
          color: txtColor,
          fontSize: 24.0,
          fontWeight: FontWeight.w500
        ),));
  }
}
