import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DftButton extends StatelessWidget {
  Color bg;
  Color borderColor;
  double? radius;
  Color txtColor;
  double? width;
  double? height;
  String txt;
  Function() onPress;
   DftButton({
    required this.txt,
     this.radius=20.0,
     required this.onPress,
     required this.txtColor,
     required this.borderColor,
     this.height=70,
     required this.bg,
     this.width
});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

style: ElevatedButton.styleFrom(
  backgroundColor: bg,

  fixedSize: Size(width??MediaQuery.of(context).size.width, height!),
  shape: RoundedRectangleBorder(
    side: BorderSide(
      width: 5,
      color: borderColor
    ),
    borderRadius:BorderRadius.circular(radius!)
  )
),
        onPressed:onPress,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(txt,style:
          GoogleFonts.roboto(
            color: txtColor,
            fontSize: 24.0,
            fontWeight: FontWeight.w500
          ),),
        ));
  }
}
