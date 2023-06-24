import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';


import '../../../constant/constats.dart';
import '../../../controller/contractTypeContrller.dart';
import '../../widgits/Buttons/dufueltBtn.dart';
import '../../widgits/Images/backgroundwhite.dart';
import '../../widgits/StackScreenWid/stackScreenW.dart';
import '../../widgits/Textview/textview.dart';
import 'TypeCareScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class NeedCareScreen extends StatelessWidget {
  String? contractType;
  String? seviceTime;
   NeedCareScreen({Key? key,this.contractType,this.seviceTime}) : super(key: key);
  final NeedCareController controller = Get.put(NeedCareController());

  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    List careneeded = [
      AppLocalizations.of(context)!.mother_baby_and_child,
      AppLocalizations.of(context)!.apatient_discharging_from_a_hospital,
      AppLocalizations.of(context)!.elderly,
      AppLocalizations.of(context)!.aPatient_during_Tough_Times,
      AppLocalizations.of(context)!.after_a_Stroke,
      AppLocalizations.of(context)!.patinet_with_Disabiltie,
      AppLocalizations.of(context)!.other
    ];
    return Directionality(
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
                      child: GetBuilder<NeedCareController>(
                        init: NeedCareController(),
                        builder: (controller) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 45,
                              ),
                              TextWelcome(
                                txt: AppLocalizations.of(context)!.whoNeedsCare,
                                fontSize: 25,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height:height*0.5,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                    itemBuilder: (context,index){
                                      return Container(
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            border:
                                            Border.all(color: Colors.cyan, width: 1),
                                            borderRadius: BorderRadius.circular(16)),
                                        child:RadioListTile(value: index,groupValue: controller.selcectValue,onChanged: (val){
                                          controller.onChange(val);
                                        },
                                        title: DefaultText(txt: careneeded[index], fontSize: 20)),

                                        // Row(
                                        //   children: [
                                        //     IconButton(onPressed: (){}, icon: Icon(Icons.radio_button_off)),
                                        //     Flexible(child: DefaultText(txt: controller.careneeded[index], fontSize: 20)),
                                        //   ],
                                        // ),
                                      );
                                    },
                                  itemCount: careneeded.length,
                                ),
                              )
                            ],
                          );
                        },
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, icon: Icon(Icons.arrow_back_ios)),
                      BtnRqurment(
                        txt: AppLocalizations.of(context)!.next,
                        onPressed: () {
                          // Get.to(()=>TypeCareScreen());
                          print(careneeded[controller.selcectValue]);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>TypeCareScreen(contractType: contractType,seviceTime: seviceTime,needCareScreen:careneeded[controller.selcectValue],)));
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
