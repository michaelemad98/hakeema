import 'package:flutter/material.dart';

import '../../../constant/constats.dart';

class BackGroundWite extends StatelessWidget {
  const BackGroundWite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Image.asset('assets/images/background_white.jpg')
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
      child: FadeInImage(width: width,height: height,
          fit: BoxFit.cover,
          image: NetworkImage(
              '${imageUrl}nurse.png'),
          placeholder: AssetImage(
              "assets/images/logo.png")),

          //.asset('assets/images/nurse.png',width: width,height: height,),
    );
  }
}
