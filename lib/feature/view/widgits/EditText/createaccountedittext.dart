import 'package:flutter/material.dart';

class CreateaccEdtxt extends StatelessWidget {
  String ? labeltxt;
  String ? hintText;
  TextEditingController ?tec;

   CreateaccEdtxt({Key? key,this.labeltxt,this.hintText,this.tec}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: TextField(
        controller: tec,
        decoration: InputDecoration(
          label: Text('${labeltxt}'),
          prefixIcon: Icon(Icons.account_circle),
          hintText:hintText,
          enabledBorder: OutlineInputBorder(
            borderSide:
            BorderSide(width: 3, color: Colors.cyan), //<-- SEE HERE
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    );
  }
}
