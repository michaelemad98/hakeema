import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import '../../../constant/Toastmessage/compontents.dart';
import '../../../constant/constats.dart';
import '../../../controller/contractTypeContrller.dart';
import '../../../controller/registercontroller.dart';
import '../../widgits/Buttons/dufueltBtn.dart';
import '../../widgits/EditText/EditTextDefault.dart';
import '../../widgits/EditText/registeredittxt.dart';
import '../../widgits/Images/backgroundwhite.dart';
import '../../widgits/StackScreenWid/stackScreenW.dart';
import '../../widgits/Textview/textview.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import '../HomeMainScreen/HomeMainScreen.dart';
import '../RequrmentsScreens/dateandtimeScreen.dart';

class RegisterSubmitScreen extends StatelessWidget {
  String? contractType;
  String? seviceTime;
  String? needCareScreen;
  String? typeCare;
  String? spicallnstructions;

  RegisterSubmitScreen(
      {Key? key,
      this.contractType,
      this.seviceTime,
      this.needCareScreen,
      this.typeCare,
      this.spicallnstructions})
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
                            TextWelcome(
                              txt: AppLocalizations.of(context)!
                                  .please_submit_the_Following_details,
                              fontSize: 18,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            EdtTxtRegister(
                              hintText: AppLocalizations.of(context)!.name,
                              tec: controller.nametec,
                            ),
                            EdtTxtRegister(
                              hintText: AppLocalizations.of(context)!.email,
                              tec: controller.emailtec,
                            ),
                            EdtTxtRegister(
                              hintText: AppLocalizations.of(context)!.phone,
                              tec: controller.phonetec,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(Icons.arrow_back_ios)),
                                BtnSend(
                                    onPressed: () {
                                      controller.send(
                                          typeCare: typeCare,
                                          spicallnstructions:
                                              spicallnstructions,
                                          seviceTime: seviceTime,
                                          needCareScreen: needCareScreen,
                                          contractType: contractType);

                                      if (controller.finishSendFirebase ==
                                          true) {
                                        AwesomeDialog(
                                          context: context,
                                          dialogType: DialogType.success,
                                          animType: AnimType.topSlide,
                                          title:
                                              '${AppLocalizations.of(context)!.thankuforsend}',
                                          desc:
                                              '${AppLocalizations.of(context)!.yourrequestisbeingprocessed}',
                                          btnCancelOnPress: () {
                                            Navigator.pop(context);
                                          },
                                          btnOkOnPress: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeMainScreen()));
                                          },
                                        ).show();
                                      }
                                    },
                                    widget: controller.isSendtoFirebase
                                        ? Text(
                                            '${AppLocalizations.of(context)!.send}')
                                        : CircularProgressIndicator()),
                              ],
                            )
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
