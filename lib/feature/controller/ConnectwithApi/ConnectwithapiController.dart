import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hakeema/feature/constant/Toastmessage/compontents.dart';
import 'package:hakeema/feature/view/screens/HomeMainScreen/HomeMainScreen.dart';

import '../../constant/constats.dart';
import '../../view/screens/registphone/registertScreenPhone.dart';

class ConnectWithAPIController extends GetxController{
  static ConnectWithAPIController get instance => Get.find();
  TextEditingController nameTec= TextEditingController();
  TextEditingController emailTec= TextEditingController();
  TextEditingController buildingTec= TextEditingController();
  TextEditingController unitTec= TextEditingController();
  TextEditingController streetTec= TextEditingController();
  TextEditingController zoneTec= TextEditingController();

  final _auth =FirebaseAuth.instance;
  Rx<User?>? firebaseUser;
  var verificationId= ''.obs;
  var userCredential;
  var user;
  var uid;
  bool isRegister = false;
  RegisterCustomer()async {
    isRegister = true;
    update();
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser!.bindStream(_auth.userChanges());
    final phone = firebaseUser!.value!.phoneNumber;
    final uid = firebaseUser!.value!.uid;
    print(phone);
    if (phone != null) {
      int customerid= box.read(customerID);
      Dio dio = Dio();
      final responce = await dio.put(
          'https://Hakima-api.birdcloud.qa/Customer/Profile',
          data:{
            "ID": customerid,
            "Mobile": "${phone}",
            "Email": "${emailTec.text.trim()}",
//   "UID": "IPgwSc9NGSat2ovIiCrOcmy6CnJ3",
            "FirstNameArabic": "${nameTec.text.trim()}",
            "FirstNameEnglish": "${nameTec.text.trim()}",
            "Address": "Qatar",
            "Address2": "Qatar",
            "IsCompleted": true,
            "PlayerId": "sample string 11",
            "ZoneNO": "${zoneTec.text.trim()}",
            "StreetName": "${streetTec.text.trim()}",
            "locationgps": "sample string 14",
            "BuildingNumber": buildingTec.text.trim(),
            "UnitNumber": unitTec.text.trim(),
            "ValidationCode": "sample string 15",
            "AccessToken": "sample string 16"
          }
      );
      print(responce.data);
      isRegister = false;
      Get.off(()=>HomeMainScreen());
      update();
    } else {
      showToast(text: 'Login To continue', state: ToastState.ERROR);
      Get.offAll(()=>RegisterByPhone());
    }
  }
}