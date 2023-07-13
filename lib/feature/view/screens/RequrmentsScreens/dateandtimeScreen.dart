import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hakeema/feature/view/screens/submitRegister/regusterSubmitScreen.dart';


import '../../../constant/constats.dart';
import '../../../controller/contractTypeContrller.dart';
import '../../widgits/Buttons/dufueltBtn.dart';
import '../../widgits/Images/backgroundwhite.dart';
import '../../widgits/StackScreenWid/stackScreenW.dart';
import '../../widgits/Textview/textview.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class DateAndTimeScreen extends StatelessWidget {
  String? contractType;
  String? seviceTime;
  String ?needCareScreen;
  String? typeCare;
  String ?spicallnstructions;
  DateAndTimeScreen({Key? key,this.contractType,this.seviceTime,this.needCareScreen,this.typeCare,this.spicallnstructions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return
      Directionality(
        textDirection: box.read('language')?TextDirection.rtl:TextDirection.ltr,
        child: StackScreenWidgit(widget:
    Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          ListView(
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
                  child: GetBuilder<DateandTimeController>(
                    init: DateandTimeController(),
                    builder: (controller) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Center(
                            child: SizedBox(
                              height: 45,
                            ),
                          ),
                          TextWelcome(
                            txt: AppLocalizations.of(context)!.whenwouldyouliketheservice,
                            fontSize: 25,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CalendarDatePicker(initialDate: controller.initialDate, firstDate: DateTime.now(), lastDate: DateTime(2050), onDateChanged: (value){
                            controller.onChagne(value);
                          },),
                          SizedBox(
                            height: 10,
                          ),
                          IconButton(onPressed: ()async{
                            controller.newTime= await showTimePicker(context: context, initialTime: controller.initialTime ,);
                            controller.changeTime();
                          }, icon: Icon(Icons.access_time_filled_sharp,size: 30,)),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.calendar_month),
                              TextWelcome(txt: '${controller.formattedDate}',color: Colors.black,fontSize: 12,),
                              TextWelcome(txt: '|',color: Colors.black,fontSize: 25,),
                              Icon(Icons.access_time_filled_sharp),
                              TextWelcome(txt: '${controller.initialTime.hour}:${controller.initialTime.minute}',color: Colors.black,fontSize: 12,),
                            ],
                          )
                        ],
                      );
                    },
                  )),
              GetBuilder<DateandTimeController>
                (
                  init: DateandTimeController(),
                  builder: (controller){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back_ios)),
                    BtnRqurment(
                      txt: AppLocalizations.of(context)!.next,
                      onPressed: () {
                        // Get.to(()=>RegisterSubmitScreen());
                        // controller.CheckAuth();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterSubmitScreen(spicallnstructions: spicallnstructions,needCareScreen: needCareScreen,seviceTime: seviceTime,typeCare: typeCare,contractType: contractType,dateandtime: "${controller.formattedDate} / ${controller.initialTime.hour}:${controller.initialTime.minute}",)));
                      },
                    ),
                  ],
                );
              })
            ],
          ),
          Positioned(
              top: -100,
              child: NurseImage(
                width: 120,
              ))
        ],
    )
        ,),
      );
  }
}
