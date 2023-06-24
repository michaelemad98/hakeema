import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hakeema/feature/view/screens/HomeMainScreen/profileScreen/proifleScreen.dart';

import '../view/screens/HomeMainScreen/Settings/settengisScreen.dart';
import '../view/screens/HomeMainScreen/appontmentScreen.dart';

class HomeController extends GetxController{
  int currentindex = 1;
  final tabs=[
    Center(child:Text('Profile')),
    AppointmentScreen(),
    Center(child:Text('Settings')),
  ];

  static List<Widget> widgetOptions= <Widget>[
    ProfileScreen(),
    AppointmentScreen(),
    SettengScreen(),
  ];

  ontab(index){
    currentindex = index;
    update();
  }
}