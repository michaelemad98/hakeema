import 'package:flutter/material.dart';
class SettingContainerbtn extends StatelessWidget {
  String ? txt;
  Widget ?widget;
  SettingContainerbtn({Key? key,this.txt,this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white,
      borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0,3),
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget!,
          SizedBox(width: 20,),
          Text(txt!,style: TextStyle(color: Colors.cyan,fontSize: 20),),
        ],
      ),
    );
  }
}
