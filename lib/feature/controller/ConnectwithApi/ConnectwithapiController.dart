import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hakeema/feature/constant/Toastmessage/compontents.dart';
import 'package:hakeema/feature/view/screens/HomeMainScreen/HomeMainScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
  RegisterCustomer(

      {String ?contractType,
        String ?seviceTime,
        String ?needCareScreen,
        String ?typeCare,
        String ?spicallnstructions,
        String ? dateandtime,
        context
      }
      )async {
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
      send(dateandtime: dateandtime,
        contractType: contractType,
        needCareScreen: needCareScreen,
        seviceTime: seviceTime,
        spicallnstructions: spicallnstructions,
        customerid: customerid,
        typeCare: typeCare,
        phone: phone,
        context: context
      );
      // Get.off(()=>HomeMainScreen(currentpage: 2,));
      update();
    } else {
      showToast(text: 'Login To continue', state: ToastState.ERROR);
      Get.offAll(()=>RegisterByPhone());
    }
  }
  void send(
      {
        String ?contractType,
        String ?seviceTime,
        String ?needCareScreen,
        String ?typeCare,
        String ?spicallnstructions,
        String ? dateandtime,
        String? phone,
        int ?customerid,
        context
      }) async{
    try{

      Dio dio =Dio();
      final responce = await dio.post('https://Hakima-api.birdcloud.qa/BookANurse/Post',data: {
        "ID": 1,
        "ContractorType": contractType,
        "NeedsCare": needCareScreen,
        "CareServices": typeCare,
        "ServiceTime": dateandtime,
        "SpecialInstructions": spicallnstructions,
        "Name": "${nameTec.text.trim()}",
        "CustomerId": customerid,
        "Email":"${emailTec.text.trim()}",
        "Phone":phone,
        "Notes": "sample string 12"
      }
      );
      print(responce.data);
      if(responce.statusCode==200){
        showToast(text: '${responce.data["Message"]}', state: ToastState.SUCCESS);
        if(responce.data['Success']==true){
          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.rightSlide,
            title: '${AppLocalizations.of(context)!.successfully}',
            desc: '${AppLocalizations.of(context)!.therequestwassubmittedsuccessfullyrequestnumber} ${responce.data['Data']['Code']}',
            btnCancelOnPress: () {

            },
            btnOkOnPress: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeMainScreen(currentpage: 0)));
              Get.off(()=>HomeMainScreen(currentpage: 2,));
            },
          )..show();
        }else{
          showToast(text: 'Something went wrong', state: ToastState.SUCCESS);
        }
      }
    }catch(e){
      print(e);
    }

  }

}