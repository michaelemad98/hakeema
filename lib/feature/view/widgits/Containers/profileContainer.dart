import 'package:flutter/material.dart';

import '../Textview/textview.dart';

class ProfileContainer extends StatelessWidget {
  String ? txt ,title;
    ProfileContainer({Key? key,this.txt,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       Container(
           margin: EdgeInsets.only(left: 16),
           child: DefaultText(txt: '${title}',fontSize: 16,color:Colors.cyan)),
        Container(
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
          child:Center(child: DefaultText(txt: '${txt}',fontSize: 18,color:Colors.cyan)),
        ),
      ],
    );
  }
}
class ProfileContaineraddress extends StatelessWidget {
  String ? txt,title;

    ProfileContaineraddress({Key? key,this.txt,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
            margin: EdgeInsets.only(left: 16),
            child: DefaultText(txt: '${title}',fontSize: 16,color:Colors.white)),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),

          ),
          child:Center(child: DefaultText(txt: '${txt}',fontSize: 20,color:Colors.cyan)),
        ),
      ],
    );
  }
}
