import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgits/Buttons/welcomebtn.dart';
import '../widgits/Textview/textview.dart';
import '../widgits/Images/imagelogo.dart';
import 'languageScreen/languageScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Image.asset('assets/images/backgroundgreen.png',width: double.infinity,height: double.infinity,),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(title: Text('${AppLocalizations.of(context)!.welcome}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 25),),
          elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
          ),
          body:SafeArea(
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: ImageLogo()),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWelcome(txt: '${AppLocalizations.of(context)!.hakeema}',fontSize: 30,color: Colors.white),
                      TextWelcome(txt: '24',fontSize: 60,color: Colors.white),
                    ],
                  ),
                  BtnStart(txt: AppLocalizations.of(context)!.book_a_nurse,onPressed: (){
                    Get.to(()=>LanguageScreen());
                  },)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
