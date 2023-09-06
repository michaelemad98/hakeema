import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hakeema/feature/controller/languageController.dart';
import 'package:hakeema/feature/view/screens/RequrmentsScreens/serviceTimeScreen.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../constant/constats.dart';
import '../../../controller/contractTypeContrller.dart';
import '../../widgits/Buttons/dufueltBtn.dart';
import '../../widgits/Images/backgroundwhite.dart';
import '../../widgits/StackScreenWid/stackScreenW.dart';
import '../../widgits/Textview/textview.dart';

class ContractType extends StatelessWidget {
  ContractType({Key? key}) : super(key: key);
  final ContractTypeController controller = Get.put(ContractTypeController());

  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    // List contractTypeList = ['${getLang(context , 'monthly')}','${getLang(context , 'weekly')}','${getLang(context , 'onday')}','${getLang(context, 'onevist')}'];
    List contractTypeList = ['${AppLocalizations.of(context)!.monthly}',AppLocalizations.of(context)!.weekly,AppLocalizations.of(context)!.onday,AppLocalizations.of(context)!.onevist];
    return Directionality(
      textDirection:box.read('language')?TextDirection.rtl:TextDirection.ltr,
      child: StackScreenWidgit(
        widget: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(
              child: Column(children: [
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
                    child: GetBuilder<ContractTypeController>(
                      init: ContractTypeController(),
                      builder: (controller) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 45,
                            ),
                            TextWelcome(
                              txt: AppLocalizations.of(context)!.contracttype,
                              fontSize: 25,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: contractTypeList.length,
                                  itemBuilder: (context,index){
                                    return Container(
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            border:
                                            Border.all(color: Colors.cyan, width: 1),
                                            borderRadius: BorderRadius.circular(16)),
                                        child:RadioListTile(value: index,groupValue:controller.selcectValue,
                                          onChanged: (val){
                                            controller.onChange(val);
                                          },
                                          title:  DefaultText(txt: contractTypeList[index], fontSize: 20),
                                        )
                                    );
                                  }),
                            ),
                          ],
                        );
                      },
                    )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 25,right: 35),
                      child: BtnRqurment(txt: '${AppLocalizations.of(context)!.next}',
                        onPressed: (){
                          // Get.to(()=>ServiceTimeScreen());
                          // print(contractTypeList[controller.selcectValue]);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ServiceTimeScreen(contractType: contractTypeList[controller.selcectValue],)));
                        },
                      ),
                    ),
                  ],
                )
              ],),
            ),
            Positioned(
                top: -100,
                child: NurseImage(
                  width: 120,
                ))
          ],
        ),
      ),
    );
  }
}

/*

 */
