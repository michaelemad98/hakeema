import 'package:flutter/material.dart';
class BtnStart extends StatelessWidget {
  final String txt;
  final GestureTapCallback onPressed;
  const BtnStart({Key? key, required this.txt,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ButtonStyle style =
    ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.cyan.shade700,
        minimumSize: Size(double.infinity, 50),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        textStyle: const TextStyle(fontSize: 25));
    return Container(
      margin: EdgeInsets.only(left: 35,right: 35,top: 16),
      child: ElevatedButton(
        onPressed: onPressed, child: Text(txt),style: style,),
    );
  }
}
