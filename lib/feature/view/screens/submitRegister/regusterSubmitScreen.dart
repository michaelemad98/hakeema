import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hakeema/feature/view/screens/HomeMainScreen/profileScreen/RegisterScreen.dart';
import '../../../constant/Toastmessage/compontents.dart';
import '../../../constant/constats.dart';
import '../../../controller/ConnectwithApi/ConnectwithapiController.dart';
import '../../../controller/contractTypeContrller.dart';
import '../../../controller/registercontroller.dart';
import '../../../model/usermodel.dart';
import '../../widgits/Buttons/dufueltBtn.dart';
import '../../widgits/Containers/ContainerAdress.dart';
import '../../widgits/EditText/EditTextDefault.dart';
import '../../widgits/EditText/createaccountedittext.dart';
import '../../widgits/EditText/registeredittxt.dart';
import '../../widgits/Images/backgroundwhite.dart';
import '../../widgits/StackScreenWid/stackScreenW.dart';
import '../../widgits/Textview/textview.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import '../HomeMainScreen/HomeMainScreen.dart';
import '../RequrmentsScreens/dateandtimeScreen.dart';
import '../registphone/registerCustomermobile.dart';


class RegisterSubmitScreen extends StatelessWidget {
  String? contractType;
  String? seviceTime;
  String? needCareScreen;
  String? typeCare;
  String? spicallnstructions;
  String? dateandtime;

  RegisterSubmitScreen(
      {Key? key,
        this.contractType,
        this.seviceTime,
        this.needCareScreen,
        this.typeCare,
        this.spicallnstructions,
        this.dateandtime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Directionality(
      textDirection:
      box.read('language') ? TextDirection.rtl : TextDirection.ltr,
      child: StackScreenWidgit(
          widget: SingleChildScrollView(
            child: Stack(
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
                        child: GetBuilder<RegisgterController>(
                          init: RegisgterController(),
                          builder: (controller) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 45,
                                ),
                                GetBuilder<ConnectWithAPIController>(
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
                                            controller.RegisterCustomer(typeCare:typeCare,
                                                spicallnstructions: spicallnstructions,
                                                seviceTime: seviceTime,
                                                needCareScreen: needCareScreen,
                                                contractType: contractType,
                                                dateandtime: dateandtime,
                                               context: context
                                            );

                                          }):CircularProgressIndicator()
                                        ],
                                      );
                                  } ,),

                                SizedBox(
                                  height: 10,
                                ),
/*
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                BtnSend(
                                    onPressed: () {
                                      controller.send(
                                          typeCare: typeCare,
                                          spicallnstructions:
                                              spicallnstructions,
                                          seviceTime: seviceTime,
                                          needCareScreen: needCareScreen,
                                          contractType: contractType,
                                        dateandtime: dateandtime
                                      );
                                      },
                                    widget: controller.isSendtoFirebase
                                        ? Text(
                                            '${AppLocalizations.of(context)!.send}')
                                        : CircularProgressIndicator()),
                              ],
                            )

 */
                              ],
                            );
                          },
                        )),
                  ],
                ),
                Positioned(
                    top: -100,
                    child: NurseImage(
                      width: 120,
                    ))
              ],
            ),
          )),
    );
  }
}
