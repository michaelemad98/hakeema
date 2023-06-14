import 'package:flutter/material.dart';

import '../Images/backgroundwhite.dart';
class StackScreenWidgit extends StatelessWidget {
  final Widget widget;
  const StackScreenWidgit({Key? key,required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        BackGroundWite(),
        Scaffold(backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
          body:
        SafeArea(child:widget,),
        )
      ],
    );
  }
}
