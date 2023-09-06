import 'package:flutter/material.dart';
import 'package:hakeema/feature/view/screens/registphone/registerCustomermobile.dart';

import '../../../../constant/constats.dart';
import '../../../widgits/Buttons/dufueltBtn.dart';
import '../../../widgits/Textview/textview.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  final GestureTapCallback? onPressedd;
 const RegisterScreen({Key? key ,this.onPressedd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: SingleChildScrollView(
      child: Column(
        children: [
          FadeInImage(width: 200,
              image: NetworkImage(
                  '${imageUrl}profileloader.gif'),
              placeholder: AssetImage(
                  "assets/images/logo.png")),
          DefaultText(txt: '${AppLocalizations.of(context)!.resultnotfound}',color: Colors.black,fontSize: 35),
          DefaultText(txt: '${AppLocalizations.of(context)!.whoopsthisinformationisnotavailable}',color: Colors.grey,fontSize: 20),
          BtnRqurment(txt: '${AppLocalizations.of(context)!.register}', onPressed: (){
            Get.to(()=>RegisterCustomer());
          }),
        ],
      ),
    ),);
  }
}
