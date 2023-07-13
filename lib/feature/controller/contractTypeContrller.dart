

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class ContractTypeController extends GetxController{


var  selcectValue  ;
  onChange(val){
    selcectValue = val;
    print(selcectValue);
    update();
  }
}
class ServiceTimeController extends GetxController{

  List ServiceTimelist = ["8","10","12"];
  var  selcectValue  ;
  onChange(val){
    selcectValue = val;
    print(selcectValue);
    update();
  }
}

class NeedCareController extends GetxController{

  var  selcectValue  ;
  onChange(val){
    selcectValue = val;
    print(selcectValue);
    update();
  }

}


class TypeCareController extends GetxController{

  var  selcectValue  ;
  onChange(val){
    selcectValue = val;
    print(selcectValue);
    update();
  }
}
class SpicallCallInstructionController extends GetxController{

  TextEditingController specialinstructionsTec = TextEditingController();
}

class DateandTimeController extends GetxController{
  DateTime initialDate = DateTime.now();
  TimeOfDay initialTime= TimeOfDay.now();
  TimeOfDay? newTime;
  DateTime now = DateTime.now();
  String ?formattedDate;

  @override
  void onInit() {
    // TODO: implement onInit
    formattedDate = DateFormat.yMMMEd().format(initialDate);
    // CheckAuth();
    super.onInit();
  }

  changeTime(){
    if (newTime == null)return;
    initialTime = newTime!;
    update();
  }
  onChagne(value){
    initialDate =  value ;
    formattedDate = DateFormat.yMMMEd().format(initialDate);
    update();
  }

  CheckAuth()async{
    await FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }

    });
  }
}