import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../constant/constats.dart';
import '../../../controller/contractTypeContrller.dart';
import '../../widgits/Buttons/dufueltBtn.dart';
import '../../widgits/EditText/EditTextDefault.dart';
import '../../widgits/Images/backgroundwhite.dart';
import '../../widgits/StackScreenWid/stackScreenW.dart';
import '../../widgits/Textview/textview.dart';
import 'dateandtimeScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SpecialInstructionScreen extends StatelessWidget {
  const SpecialInstructionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return  Directionality(
      textDirection: box.read('language')?TextDirection.rtl:TextDirection.ltr,
      child: StackScreenWidgit(
          widget: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 25, right: 25, top: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.white),
                      child: GetBuilder<TypeCareController>(
                        init: TypeCareController(),
                        builder: (controller) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 45,
                              ),
                              TextWelcome(
                                txt: AppLocalizations.of(context)!.do_You_have_any_Special_Instructions,
                                fontSize: 25,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              DefaultEdittxt(hintText:AppLocalizations.of(context)!.enterspecialinstructionshere,)
                            ],
                          );
                        },
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(onPressed: (){
                        Get.back();
                      }, icon: Icon(Icons.arrow_back_ios)),
                      BtnRqurment(
                        txt: AppLocalizations.of(context)!.next,
                        onPressed: () {
                          Get.to(()=>DateAndTimeScreen());
                        },
                      ),
                    ],
                  )
                ],
              ),
              Positioned(
                  top: -100,
                  child: NurseImage(
                    width: 120,
                  ))
            ],
          )),
    );
  }
}
