import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hakeema/feature/constant/Toastmessage/compontents.dart';
import 'package:hakeema/feature/view/screens/registphone/otpScreen.dart';
import 'package:hakeema/feature/view/widgits/Images/backgroundgreen.dart';

import '../../../constant/constats.dart';
import '../../../controller/registerphone/registerphonecontroller.dart';
import '../../widgits/Buttons/dufueltBtn.dart';
import '../../widgits/EditText/registeredittxt.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../widgits/Textview/textview.dart';
class RegisterByPhone extends StatelessWidget {
  const RegisterByPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: box.read('language')?TextDirection.rtl:TextDirection.ltr,
      child: Stack(
        children: [
          BackGroundGreen(),
          GetBuilder<RegisterPhoneController>(
              init: RegisterPhoneController(),
              builder: (controller){
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWelcome(txt: AppLocalizations.of(context)!.bettertogether,fontSize: 32,color: Colors.white),
                    FadeInImage(width: 200,
                        image: NetworkImage(
                            '${imageUrl}animregist.gif'),
                        placeholder: AssetImage(
                            "assets/images/logo.png")),


                  Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        TextWelcome(txt: AppLocalizations.of(context)!.enteryourmobilephonetoregisterinhakeema,fontSize: 24,color: Colors.white.withOpacity(0.8)),
                      ],
                    ),
                  ),
                  EdtTxtRegisterWithcode(
                    hintText: AppLocalizations.of(context)!.phone,
                    tec: controller.phonetec,
                    prefixIcon: DropdownButton<String>(
                      value: controller.selectedCountryCode,
                      items: controller.countrycode.map<DropdownMenuItem<String>>((value){
                        return  DropdownMenuItem<String>(
                            value:value['dial_code'] ,
                            child: Text('${value['code']} ${value['flag']}'));
                      }).toList(),
                      onChanged:(value) {
                        controller.onchage(value);
                      },
                    ),
                  ),
                  BtnRqurment(onPressed: (){
                    if(controller.phonetec.text==""){
                      showToast(text: "Please Enter Phone number", state: ToastState.WARNING);
                    }else{
                      // controller.CreateUserWithPhoneNumber(context);
                      controller.CreateMessage();

                    }

                   /*
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.question,
                      animType: AnimType.topSlide,
                      title:
                      '${AppLocalizations.of(context)!.thankuforsend}',
                      body: EdtTxtRegister(tec: controller.otpTec,
                        hintText: 'Enter OTP',
                      ),
                      btnOkOnPress: () {
                        controller.verifyOTPphone();
                      },
                    ).show();
                    */
                  },txt: "${AppLocalizations.of(context)!.continueto}",)
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
