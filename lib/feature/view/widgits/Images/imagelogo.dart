import 'package:flutter/material.dart';
import 'package:hakeema/feature/constant/constats.dart';
class ImageLogo extends StatelessWidget {
  const ImageLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      FadeInImage(
        width: 120,
          image: NetworkImage(
              '${imageUrl}logo.png'),
          placeholder: AssetImage(
              "assets/images/logo.png"));
      Image.asset(
      'assets/images/logo.png',width: 120,);
  }
}
class otbimage extends StatelessWidget {
  const otbimage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Image.asset('assets/images/Otp.png');
  }
}
