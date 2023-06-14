import 'package:flutter/material.dart';

class BackGroundWite extends StatelessWidget {
  const BackGroundWite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/images/background_white.jpg',height: double.infinity,width: double.infinity  ,),
    );
  }
}

class NurseImage extends StatelessWidget {
  double ? width,height;
   NurseImage({Key? key, this.width,this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(45),
      child: Image.asset('assets/images/nurse.png',width: width,height: height,),
    );
  }
}
