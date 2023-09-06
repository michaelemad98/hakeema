import 'package:flutter/material.dart';
class EdtTxtRegister extends StatelessWidget {
    String? hintText;
    TextEditingController ?tec;
   EdtTxtRegister({Key? key,this.hintText,this.tec}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]
      ),

      child: TextField(
        controller: tec,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
class EdtTxtRegisterWithcode extends StatelessWidget {
  String? hintText;
  TextEditingController ?tec;
  Widget ?prefixIcon;
  EdtTxtRegisterWithcode({Key? key,this.hintText,this.tec,this.prefixIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.only(top: 5,bottom:5 ,left: 15,right:  15,),
      decoration: BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]
      ),

      child: TextField(
        controller: tec,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          prefixIcon: prefixIcon
        ),
      ),
    );
  }
}

class OtpEditText extends StatelessWidget {
  String hintText;
  TextEditingController tec;
   OtpEditText({super.key,required this.tec,required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30,left: 45,right: 45),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]
      ),

      child: TextField(
        controller: tec,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,

        ),
      ),
    );
  }
}

