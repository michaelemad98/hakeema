import 'package:flutter/material.dart';
class DefultBtn extends StatelessWidget {
  final String txt;
  final GestureTapCallback onPressed;
  const DefultBtn({Key? key ,required this.txt,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ButtonStyle style =
    ElevatedButton.styleFrom(
        backgroundColor: Colors.cyan.shade700,
        foregroundColor: Colors.white,
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
class BtnRqurment extends StatelessWidget {
  final String txt;
  final GestureTapCallback onPressed;
  const BtnRqurment({Key? key,required this.txt,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ButtonStyle style =
    ElevatedButton.styleFrom(
        backgroundColor: Colors.cyan.shade900,
        foregroundColor: Colors.white,
        minimumSize: Size(140, 50),
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        textStyle: const TextStyle(fontSize: 25));
    return Container(
      margin: EdgeInsets.only(left: 0,right: 0,top: 16),
      child: ElevatedButton(
        onPressed: onPressed, child: Text(txt),style: style,),
    );
  }
}

class BtnSend extends StatelessWidget {
  Widget? widget;
  GestureTapCallback onPressed;
  BtnSend({Key? key,this.widget,required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ButtonStyle style =
    ElevatedButton.styleFrom(
        backgroundColor: Colors.cyan.shade900,
        foregroundColor: Colors.white,
        minimumSize: Size(140, 50),
        elevation: 3,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
        ),
        textStyle: const TextStyle(fontSize: 25));
    return ElevatedButton(onPressed: onPressed, child: widget,style: style,);
  }
}


