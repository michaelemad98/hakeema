import 'package:flutter/material.dart';

import '../Textview/textview.dart';

class ProfileEditText extends StatelessWidget {
  String ? hintText,labletxt;
  TextEditingController ?tec;
  ProfileEditText({Key? key,this.hintText,this.tec,this.labletxt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]
      ),
      child:TextField(
        controller: tec,
        decoration: InputDecoration(
          label: Text("${labletxt}"),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
class ProfileEditTextaddress extends StatelessWidget {
  String ? hintText,lable;
  TextEditingController ?tec;
  ProfileEditTextaddress({Key? key,this.hintText,this.tec,this.lable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),

      ),
      child:TextField(
        controller: tec,
        decoration: InputDecoration(
          label: Text('${lable}'),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
