import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hakeema/feature/view/widgits/EditText/createaccountedittext.dart';

import '../../../constant/constats.dart';
import '../../../controller/ConnectwithApi/ConnectwithapiController.dart';
import '../../widgits/Buttons/dufueltBtn.dart';
import '../../widgits/Containers/ContainerAdress.dart';
import 'package:get/get.dart';
class RegisterCustomer extends StatelessWidget {
  const RegisterCustomer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: box.read('language')?TextDirection.rtl:TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text('${AppLocalizations.of(context)!.createanaccount}'),
        ),
        body: SingleChildScrollView(
          child: GetBuilder<ConnectWithAPIController>(init:ConnectWithAPIController(),builder:(controller){
            return
              Column(
                children: [
                  CreateaccEdtxt(labeltxt: "${AppLocalizations.of(context)!.name}",
                    hintText: AppLocalizations.of(context)!.enteryourname,
                    tec: controller.nameTec,
                  ),
                  CreateaccEdtxt(labeltxt: "${AppLocalizations.of(context)!.email}",
                    hintText: AppLocalizations.of(context)!.enteryouremai,
                    tec: controller.emailTec,
                  ),
                  ContainerAdress(buildingtec:controller.buildingTec,streettec: controller.streetTec,unittec: controller.unitTec,zonetec: controller.zoneTec,),
                  SizedBox(height: 16,),
                  !controller.isRegister?BtnRqurment(txt: '${AppLocalizations.of(context)!.register}', onPressed: (){

                    controller.RegisterCustomer();
                  }):CircularProgressIndicator()
                ],
              );
          } ,)
        ),
      ),
    );
  }
}
/*
Column(
            children: [
              CreateaccEdtxt(labeltxt: "${AppLocalizations.of(context)!.name}",
              hintText: AppLocalizations.of(context)!.enteryourname,
              ),
              CreateaccEdtxt(labeltxt: "${AppLocalizations.of(context)!.email}",
              hintText: AppLocalizations.of(context)!.enteryouremai,
              ),
              ContainerAdress(buildingtec: ),
              SizedBox(height: 16,),
              BtnRqurment(txt: '${AppLocalizations.of(context)!.register}', onPressed: (){

              })
            ],
          )
 */