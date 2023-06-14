import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hakeema/feature/view/widgits/Buttons/dufueltBtn.dart';


import '../../widgits/Images/realnurseimg.dart';
import '../../widgits/Textview/textview.dart';
import '../RequrmentsScreens/contractType.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          RealNurseImg(),
          SizedBox(height: 25,),
          TextWelcome(txt:  '${AppLocalizations.of(context)!.you_can_make_an_appoinment}',fontSize: 28,color: Colors.cyan.shade900),

          DefultBtn(txt: '${AppLocalizations.of(context)!.appoinment}', onPressed: (){Get.to(()=>ContractType());}),
          SizedBox(height: 25,),
          TextWelcome(txt: '${AppLocalizations.of(context)!.or_you_can_call_us_directly}',fontSize: 20,color: Colors.cyan.shade700),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.call,color: Colors.cyan.shade700,)),
              TextWelcome(txt: '+97477592426',fontSize: 20,color: Colors.cyan.shade700),
            ],
          ),

        ],
      )),
    );
  }
}
