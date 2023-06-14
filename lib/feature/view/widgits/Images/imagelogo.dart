import 'package:flutter/material.dart';
class ImageLogo extends StatelessWidget {
  const ImageLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/logo.png',width: 120,);
  }
}
