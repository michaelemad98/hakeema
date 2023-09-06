import 'dart:async';

import 'package:get/get.dart';

import '../view/screens/WelcomeScreen.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    GotowelcomScreen();
    super.onInit();
  }
  String hakima='HAKEEMA 24';
  GotowelcomScreen()async{
    print('sssssss');
    Timer(Duration(seconds: 5),()=>  Get.off(()=>WelcomeScreen()));
  }
}