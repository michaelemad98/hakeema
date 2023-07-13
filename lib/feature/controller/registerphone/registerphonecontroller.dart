import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hakeema/feature/view/screens/HomeMainScreen/HomeMainScreen.dart';

import '../../constant/Toastmessage/compontents.dart';
import '../../constant/constats.dart';
class RegisterPhoneController extends GetxController{
  static RegisterPhoneController get instance => Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    GetCountryList();
    super.onInit();
  }


  TextEditingController phonetec= TextEditingController();
  TextEditingController otpTec= TextEditingController();
  var selectedCountryCode ;
  var countrycode ;
  GetCountryList()async{
    final  String response = await rootBundle.loadString('assets/jsonfils/CountryCodes.json');
    final data= await json.decode(response);
    countrycode=data;
    selectedCountryCode=await  countrycode[0]['dial_code'];
    update();
    print(countrycode[0]['code']);
    return data;
  }
  onchage(value){
    selectedCountryCode = value;
    update();
  }
  final _auth =FirebaseAuth.instance;
  var verificationId= ''.obs;
  CreateUserWithPhoneNumber()async{
    print("${selectedCountryCode}");
    // /*
    await _auth.verifyPhoneNumber(
        phoneNumber:"${selectedCountryCode}${phonetec.text.trim()}" ,
        verificationCompleted: (PhoneAuthCredential credential)async{
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e ){
          if(e.code == "invalid-phone-number"){
            showToast(text: "The provided phone number is not valid.", state: ToastState.ERROR);
          }else{
            print(e.code);
            showToast(text: "Something went wrong. Try Again.", state: ToastState.ERROR);
          }
        },
        codeSent: (String verificationId,int? resendToken){
          this.verificationId.value= verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId){
          this.verificationId.value= verificationId;
        }
    );
    // */
  }
  var userCredential;
  var user;
  var uid;
  Future<bool> verifyOTP(String otp)async{
    userCredential = await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: this.verificationId.value, smsCode: otp));
    user = userCredential.user;
    uid=user.uid;

    return userCredential.user!=null? true:false;
  }

  void verifyOTPphone()async{
    var isverified =  await verifyOTP(otpTec.text);
    uid=user.uid;
    await CustomerSignup(uid);
    //
    update();
    isverified ? print('number is verified'):print("number is not verified");

  }

  CustomerSignup(String userUID)async{
    print("${userUID} sssss ${selectedCountryCode}${phonetec.text.trim()}");
    Dio dio = Dio();
    final responce = await dio.post(
        'https://Hakima-api.birdcloud.qa/Customer/Signup',
        data: {
          "Mobile": "${selectedCountryCode}${phonetec.text.trim()}",
          "UID":"${userUID}"
        }
    );
    if(responce.data['Success']==true){
      print(responce.data['Data']['ID']);
      box.write(customerID, responce.data['Data']['ID']);
      box.write(isLoginkey, true);
      Get.offAll(()=>HomeMainScreen());
    }
    else{
      showToast(text: "Something went wrong", state: ToastState.ERROR);
    }

  }

}