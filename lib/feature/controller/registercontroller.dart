import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hakeema/feature/constant/Toastmessage/compontents.dart';
import 'package:hakeema/feature/model/usermodel.dart';
import 'package:hakeema/feature/repository/userrepository/user_repository.dart';
import 'package:hakeema/feature/view/screens/HomeMainScreen/HomeMainScreen.dart';
import 'package:hakeema/feature/view/screens/WelcomeScreen.dart';

import '../constant/constats.dart';

class RegisgterController extends GetxController{


  bool isCompleted = false;
  var data ;
  getCustomerInfo()async{
    int customerid= box.read(customerID);
    Dio dio = Dio();
    final responce = await dio.get('${Url_api}/Customer/Get/${customerid}');
    print(responce.data);
    if(responce.data['Data']['IsCompleted']==true){
      isCompleted = true;
      update();
      data = responce.data;
    }else{
      isCompleted = false;
      update();
    }
    return responce.data;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    // CheckAuth();
    getCustomerInfo();
    super.onInit();
  }

  final _auth =FirebaseAuth.instance;
  var firebaseUser;
  var verificationId= ''.obs;
  var userCredential;
  var user;
  var uid;

  // /*
  @override
  void onReady() {
    // TODO: implement onReady
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser,_setInitialScreen);
    super.onReady();
  }
  _setInitialScreen(User? user){

  }
  // */

    bool  isSendtoFirebase = true;
    bool finishSendFirebase =false;
  TextEditingController nametec= TextEditingController();
  TextEditingController emailtec= TextEditingController();
  TextEditingController phonetec= TextEditingController();
  TextEditingController otpTec= TextEditingController();

  var countrycode ;
  var selectedCountryCode ;
  List countrydial_code=[];
  GetCountryList()async{
    countrydial_code.clear();
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
    bool isAuth= false;
  final _useRepo= Get.put(UserRepository());

  Future<bool> CheckAuth()async{
      await FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          print('User is currently signed out!');
          isAuth= false;
        } else {
          isAuth = true;
          // getUserData();
          print('User is signed in!');
        }
      });
      return isAuth;
    }
  getUserData(){
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser!.bindStream(_auth.userChanges());
    final phone = firebaseUser!.value!.phoneNumber;
    print(phone);
    if(phone !=null){
      return _useRepo.getUserDetails(phone);
    }else{
      showToast(text: 'Login To continue', state: ToastState.ERROR);
    }
  }
  CreateUserWithEmailAndPassword()async{
    try{
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailtec.text.trim(), password: phonetec.text.trim());
    } on FirebaseAuthException catch(e){
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    }
    catch(e){
      print(e);
    }
  }


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

  Future<bool> verifyOTP(String otp)async{
    userCredential = await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: this.verificationId.value, smsCode: otp));
    user = userCredential.user;
    uid=user.uid;
    send();
    return userCredential.user!=null? true:false;
  }

  void verifyOTPphone()async{
    var isverified =  await verifyOTP(otpTec.text);
    isAuth=true;
    update();
    isverified ? print('number is verified'):print("number is not verified");
  }

  Future creatUser({required String name,required String email,required String phone,
    required String contractType,
    required String seviceTime,
    required String needCareScreen,
    required String typeCare,
    required String spicallnstructions})async{
    final docUser = FirebaseFirestore.instance.collection('Users').doc(uid);
    final docUseraddress = docUser.collection('address').doc('Home');
    final docUserRequrment = docUser.collection('requirements').doc();
    final json= {
      "firebaseUser":uid,
      "Name":name, "Email":email, "Phone":phone
    };
    final jsonaddress={
      "Address":"",
      "Building No":"",
      "Unit No":"",
      "Zone No":"",
      "Street":""
    };
    final jsonrequrment={
      "contractType":contractType,
      "seviceTime":seviceTime,
      "needCareScreen":needCareScreen,
      "typeCare":typeCare,
      "spicallnstructions":spicallnstructions
    };
    await docUser.set(json);
    await docUseraddress.set(jsonaddress);
    await docUserRequrment.set(jsonrequrment);
    isSendtoFirebase =true;
    finishSendFirebase= true;

    update();
  }
  void send(
      {
      String ?contractType,
      String ?seviceTime,
      String ?needCareScreen,
      String ?typeCare,
      String ?spicallnstructions,
        String ? dateandtime
      }) async{
    try{

      Dio dio =Dio();
      final responce = await dio.post('https://Hakima-api.birdcloud.qa/BookANurse/Post',data: {
        "ID": 1,
        "Code": data['Data']['ID'],
        "ContractorType": contractType,
        "NeedsCare": needCareScreen,
        "CareServices": typeCare,
        "ServiceTime": dateandtime,
        "SpecialInstructions": spicallnstructions,
        "Name": data['Data']['FirstNameArabic'],
        "CustomerId": data['Data']['ID'],
        "Email": data['Data']['Email'],
        "Phone": data['Data']['Mobile'],
        "Notes": "sample string 12"
      }
      );
      print(responce.data);
      if(responce.statusCode==200){
        showToast(text: '${responce.data["Message"]}', state: ToastState.SUCCESS);
        if(responce.data['Success']==true){

        }else{
          showToast(text: 'Something went wrong', state: ToastState.SUCCESS);
        }
      }
    }catch(e){
      print(e);
    }

  }

}