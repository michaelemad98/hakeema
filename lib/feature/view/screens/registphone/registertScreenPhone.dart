import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

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
          Container(
            child: Image.asset('assets/images/backgroundgreen.png',width: double.infinity,height: double.infinity,),
          ),
          GetBuilder<RegisterPhoneController>(
              init: RegisterPhoneController(),
              builder: (controller){
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWelcome(txt: AppLocalizations.of(context)!.bettertogether,fontSize: 32,color: Colors.white),
                  Image.asset('assets/images/animregist.gif',width: 200,),
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
                    controller.CreateUserWithPhoneNumber();
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
