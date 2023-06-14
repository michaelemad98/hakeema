import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hakeema/feature/constant/constats.dart';

class languageController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    getLanguage();
    super.onInit();
  }
  bool ?isArabic ;
  getLanguage()async{
    isArabic = await box.read('language');
    print('Language is Arabic = ${isArabic}');
  }
}