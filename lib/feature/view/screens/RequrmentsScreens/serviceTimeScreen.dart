import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/contractTypeContrller.dart';
import '../../widgits/Buttons/dufueltBtn.dart';
import '../../widgits/Images/backgroundwhite.dart';
import '../../widgits/StackScreenWid/stackScreenW.dart';
import '../../widgits/Textview/textview.dart';
import 'needCareScreen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ServiceTimeScreen extends StatelessWidget {

    String? contractType;
   ServiceTimeScreen({Key? key,this.contractType}) : super(key: key);
  final ServiceTimeController controller = Get.put(ServiceTimeController());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
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
                  child: GetBuilder<ServiceTimeController>(
                    init: ServiceTimeController(),
                    builder: (controller) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 45,
                          ),
                          TextWelcome(
                            txt: AppLocalizations.of(context)!.choose_Service_Time,
                            fontSize: 25,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: controller.ServiceTimelist.length,
                                itemBuilder: (context,index){
                                  return Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        border:
                                        Border.all(color: Colors.cyan, width: 1),
                                        borderRadius: BorderRadius.circular(16)),
                                    child: RadioListTile(value: index,groupValue: controller.selcectValue,onChanged: (val){
                                      controller.onChange(val);
                                    },
                                    title:DefaultText(txt: controller.ServiceTimelist[index], fontSize: 20)) ,

                                    // Row(
                                    //   children: [
                                    //     IconButton(onPressed: (){}, icon: Icon(Icons.radio_button_off)),
                                    //     Flexible(child: DefaultText(txt: controller.ServiceTimelist[index], fontSize: 20)),
                                    //   ],
                                    // ),
                                  );
                                }),
                          ),
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
                      // Get.to(()=>NeedCareScreen());
                      print(controller.ServiceTimelist[controller.selcectValue]);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>NeedCareScreen( contractType: contractType,seviceTime: controller.ServiceTimelist[controller.selcectValue],)));
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
