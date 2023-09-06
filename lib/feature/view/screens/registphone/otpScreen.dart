import 'package:flutter/material.dart';
import 'package:hakeema/feature/constant/Toastmessage/compontents.dart';
import 'package:hakeema/feature/constant/constats.dart';
import 'package:hakeema/feature/controller/registerphone/registerphonecontroller.dart';
import 'package:hakeema/feature/view/widgits/Buttons/dufueltBtn.dart';
import 'package:hakeema/feature/view/widgits/Images/backgroundwhite.dart';
import 'package:hakeema/feature/view/widgits/Images/imagelogo.dart';
import 'package:hakeema/feature/view/widgits/Textview/textview.dart';
import 'package:get/get.dart';
import '../../widgits/EditText/registeredittxt.dart';
class OtPScreen extends StatelessWidget {
  const OtPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: box.read('language')?TextDirection.rtl:TextDirection.ltr,
      child: Stack(

        children: [
          BackGroundWite(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: GetBuilder<RegisterPhoneController>(
                init: RegisterPhoneController(),
                builder: (controller){
                 return Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,

                   children: [
                     otbimage(),
                     SizedBox(height: 16,),
                     TitelText(txt: 'Otp Verification',),
                     OtpEditText(
                       tec: controller.otpTec,
                       hintText: 'Enter OTP',
                     ),
                    BtnRqurment(txt: 'Verify',onPressed: (){
                       if(controller.otpTec.text==""){
                         showToast(text: 'Enter OTP Code', state: ToastState.WARNING);
                       }else{
                         // controller.makeregisteringlo();
                         controller.VerifyOTPPhone(context);
                       }
                     },)
                   ],
                 );
                } ,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
