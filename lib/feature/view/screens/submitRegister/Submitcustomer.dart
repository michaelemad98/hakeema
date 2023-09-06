import 'package:flutter/material.dart';
import 'package:hakeema/feature/controller/ConnectwithApi/ConnectwithapiController.dart';

import '../../widgits/Buttons/dufueltBtn.dart';
import '../../widgits/Containers/ContainerAdress.dart';
import 'package:get/get.dart';
import '../../widgits/EditText/createaccountedittext.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SubmitCustomer extends StatelessWidget {
  const SubmitCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: GetBuilder<ConnectWithAPIController>(
          init:ConnectWithAPIController(),
          builder:(controller){
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
    );
  }
}
