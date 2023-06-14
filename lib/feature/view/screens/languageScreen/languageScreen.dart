import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hakeema/classes/language.dart';
import 'package:hakeema/feature/constant/constats.dart';
import 'package:hakeema/feature/view/widgits/Images/backgroundwhite.dart';
import 'package:hakeema/main.dart';

import '../../widgits/Buttons/dufueltBtn.dart';
import '../HomeMainScreen/appontmentScreen.dart';
class LanguageScreen extends StatelessWidget {

  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackGroundWite(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NurseImage(),
              DefultBtn(onPressed: (){
                Language? language;
                MyApp.setLocale(context, Locale('ar'));
                Get.to(()=>AppointmentScreen());
                box.write("language", true);
              },txt: 'العربية',),
              DefultBtn(onPressed: (){
                MyApp.setLocale(context, Locale('en'));
                Get.to(()=>AppointmentScreen());
                box.write("language", false);
              },txt: 'English',),
            ],
          ),
        )
      ],
    );
  }
}
