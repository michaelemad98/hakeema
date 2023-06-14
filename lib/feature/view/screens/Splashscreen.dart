import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hakeema/feature/controller/splashscreencontroler.dart';

import '../widgits/Textview/textview.dart';
class SplashScreen extends StatelessWidget {
   SplashScreen({Key? key}) : super(key: key);
  final SplashController controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
        child: Image.asset('assets/images/background.png'),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: GetBuilder<SplashController>(
              init: SplashController(),
              builder: (controller)=>Container(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 85,
                      backgroundColor: Colors.blue.shade900,
                      child: Image.asset('assets/images/ganaral-nurse.png',width:120,),
                    ),
                    SizedBox(height:16 ,),
                    TextView(txt: '${controller.hakima}',),
                    Image.asset('assets/images/phone.png')
                  ],
                ),
              )
            ),
          ),
        ),
      ],
    );
  }
}
