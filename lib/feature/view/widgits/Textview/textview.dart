import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
    String txt;
   TextView({Key? key,required this.txt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(txt,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900,fontSize: 45),);
  }
}
class DefaultText  extends StatelessWidget {
  String txt;
  double ? fontSize;
  Color? color;
   DefaultText ({Key? key,required this.txt,this.fontSize,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Text(txt,style: TextStyle(fontSize: fontSize,color: color,fontWeight: FontWeight.w900),);
  }
}

class TextWelcome extends StatelessWidget {
  String txt;
  double ? fontSize;
  Color? color;
  TextWelcome({Key? key,required this.txt,this.fontSize,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(txt,style: TextStyle(fontSize: fontSize,color: color,fontWeight: FontWeight.w900),);
  }
}

class TitelText extends StatelessWidget {
  final String txt;
  const TitelText({super.key,required this.txt});

  @override
  Widget build(BuildContext context) {
    return Text(txt,style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w900),);
  }
}

