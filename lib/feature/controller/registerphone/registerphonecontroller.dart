import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hakeema/feature/view/screens/HomeMainScreen/HomeMainScreen.dart';
import 'package:hakeema/feature/view/screens/registphone/otpScreen.dart';
import 'dart:math';
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
  CreateUserWithPhoneNumber(context)async{
    print("${selectedCountryCode}");
    // /*
    await _auth.setSettings(appVerificationDisabledForTesting: false);
    await _auth.verifyPhoneNumber(
        phoneNumber:"${selectedCountryCode}${phonetec.text.trim()}" ,
        verificationCompleted: (PhoneAuthCredential credential)async{
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e ){
          SendLogError(description: e.code,mobile:"${selectedCountryCode}${phonetec.text.trim()}");
          if(e.code == "invalid-phone-number"){
            showToast(text: "The provided phone number is not valid.", state: ToastState.ERROR);
          }else{
            print('teeee ${e.code}');
            showToast(text: "${e.code}. Try Again after 24 hour.", state: ToastState.ERROR);
            AwesomeDialog(
                context: context,
                dialogType: DialogType.info,
                animType: AnimType.rightSlide,
                title: 'phone-number "${selectedCountryCode}${phonetec.text.trim()}',
                desc: '${e.code}',
                btnCancelOnPress: () {},
          btnOkOnPress: () {},
          )..show();
          }
        },
        codeSent: (String verificationId,int? resendToken){
          this.verificationId.value= verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId){
          this.verificationId.value= verificationId;
        }
    );
    Get.to(()=>OtPScreen());
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

  bool registeringload= false;
  makeregisteringlo(){
    registeringload = true;
    update();
  }
  VerifyOTPPhone(context){
    print(number);
    if(otpTec.text == number){
      CustomerSignup("5QuSEVen5qNv9nMDPPjIcgmFigu1");

    }else{
      AwesomeDialog(
        context: context,
        dialogType: DialogType.info,
        animType: AnimType.rightSlide,
        title: '${otpTec.text}',
        desc: 'otp is not verified',
        btnCancelOnPress: () {},

      )..show();
    }
  }
  void verifyOTPphone()async{

    var isverified =  await verifyOTP(otpTec.text);
    uid=user.uid;
    await CustomerSignup(uid);
    update();
    isverified ? print('number is verified'):print("number is not verified");
    isverified ? registeringload = true:registeringload = false;
    update();
  }
  SendLogError({mobile,description}) async {
    Dio dio = Dio();
    final responce = await dio.post('https://hakima-api.birdcloud.qa/ErrorLog/Post',data: {
      "Mobile": mobile,
      "Description":description
    });

  }
  String number = '';
  CreateMessage(){
    Random random = Random();
    for(int i = 0; i < 6; i++){
      number = number + random.nextInt(9).toString();
    }
    print("number is CreateMessage ${number}");
    SendSms('OTP IS ${number} ');

  }

  SendSms(message)async{
    print (number);
    Dio dio = Dio();
    final responce = await dio.get('https://messaging.ooredoo.qa/bms/soap/Messenger.asmx/HTTP_SendSms?customerID=2369&userName=Hakeema&userPassword=nx4Uw@61ci9O&originator=Hakeema&smsText=${message}&recipientPhone=${phonetec.text.trim()}&messageType=Latin&defDate=20230829031212&blink=true&flash=false&Private=true');
  Get.to(()=>OtPScreen());
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
      registeringload= false;
      Get.offAll(()=>HomeMainScreen(currentpage: 0,));
    }
    else{
      print(responce.data);
      registeringload= false;
      showToast(text: "Something went wrong", state: ToastState.ERROR);
    }

  }

}