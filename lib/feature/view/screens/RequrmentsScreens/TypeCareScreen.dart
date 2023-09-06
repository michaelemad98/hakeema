import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hakeema/feature/view/screens/RequrmentsScreens/spicalInstructions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// import '../../../../components/applocal.dart';
import '../../../constant/constats.dart';
import '../../../controller/contractTypeContrller.dart';
import '../../widgits/Buttons/dufueltBtn.dart';
import '../../widgits/Images/backgroundwhite.dart';
import '../../widgits/StackScreenWid/stackScreenW.dart';
import '../../widgits/Textview/textview.dart';
class TypeCareScreen extends StatelessWidget {
  String? contractType;
  String? seviceTime;
  String ?needCareScreen;
   TypeCareScreen({Key? key,this.contractType,this.seviceTime,this.needCareScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    List typeCareService = [
    AppLocalizations.of(context)!.home_nursing_Care,
    AppLocalizations.of(context)!.general_Care,
    AppLocalizations.of(context)!.overnight_Care,
    AppLocalizations.of(context)!.personal_Care,
    AppLocalizations.of(context)!.prenatal_Care_and_Midwifery,
    AppLocalizations.of(context)!.new_Born_Or_Child_Care,
    AppLocalizations.of(context)!.special_Needs_Paediatric_Care,
    AppLocalizations.of(context)!.autism,
    AppLocalizations.of(context)!.down_Syndrome,
    AppLocalizations.of(context)!.home_nursing_Care,
    AppLocalizations.of(context)!.post_Operative_Care,
    AppLocalizations.of(context)!.critical_CareHome_Physiotherapy,
    AppLocalizations.of(context)!.diabetes_care,
    AppLocalizations.of(context)!.school_nursing,
    AppLocalizations.of(context)!.injection_services,
    AppLocalizations.of(context)!.travel_companion,
    AppLocalizations.of(context)!.injection_nbsb_services,
    AppLocalizations.of(context)!.other
    ];
    return  Directionality(
      textDirection: box.read('language')?TextDirection.rtl:TextDirection.ltr,
      child: StackScreenWidgit(
          widget: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
          GetBuilder<TypeCareController>(
          init: TypeCareController(),
        builder: (controller) {
          return
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 45,
                          ),
                          TextWelcome(
                            txt:AppLocalizations.of(context)!.choosetypeofcareService,
                            fontSize: 25,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height:height*0.5,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: typeCareService.length,
                                itemBuilder: (context,index){
                                  return Container(
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          border:
                                          Border.all(color: Colors.cyan, width: 1),
                                          borderRadius: BorderRadius.circular(16)),
                                      child: RadioListTile(value: index,onChanged: (val){
                                        controller.onChange(val);
                                      }, groupValue: controller.selcectValue,
                                        title: DefaultText(txt: typeCareService[index], fontSize: 20),
                                        activeColor: Colors.cyan,
                                      )
                                    // Row(
                                    //   children: [
                                    //     IconButton(onPressed: (){}, icon: Icon(Icons.radio_button_off)),
                                    //     Flexible(child: DefaultText(txt: controller.typeCareService[index], fontSize: 20)),
                                    //   ],
                                    // ),
                                  );
                                }),
                          ),
                        ],
                      )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, icon: Icon(Icons.arrow_back_ios)),
                      BtnRqurment(
                        txt: AppLocalizations.of(context)!.next,
                        onPressed: () {
                          // Get.to(()=>SpecialInstructionScreen());
                          print(typeCareService[controller.selcectValue]);
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SpecialInstructionScreen(contractType: contractType,needCareScreen: needCareScreen,seviceTime: seviceTime,typeCare: typeCareService[controller.selcectValue],)));
                        },
                      ),
                    ],
                  )
                ],
              ),
            );
        },
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

/*

Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 45,
                          ),
                          TextWelcome(
                            txt:AppLocalizations.of(context)!.choosetypeofcareService,
                            fontSize: 25,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height:height*0.5,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: typeCareService.length,
                                itemBuilder: (context,index){
                                  return Container(
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          border:
                                          Border.all(color: Colors.cyan, width: 1),
                                          borderRadius: BorderRadius.circular(16)),
                                      child: RadioListTile(value: index,onChanged: (val){
                                        controller.onChange(val);
                                      }, groupValue: controller.selcectValue,
                                        title: DefaultText(txt: typeCareService[index], fontSize: 20),
                                        activeColor: Colors.cyan,
                                      )
                                    // Row(
                                    //   children: [
                                    //     IconButton(onPressed: (){}, icon: Icon(Icons.radio_button_off)),
                                    //     Flexible(child: DefaultText(txt: controller.typeCareService[index], fontSize: 20)),
                                    //   ],
                                    // ),
                                  );
                                }),
                          ),
                        ],
                      )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(onPressed: (){
                        Get.back();
                      }, icon: Icon(Icons.arrow_back_ios)),
                      BtnRqurment(
                        txt: AppLocalizations.of(context)!.next,
                        onPressed: () {
                          // Get.to(()=>SpecialInstructionScreen());
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SpecialInstructionScreen(contractType: contractType,needCareScreen: needCareScreen,seviceTime: seviceTime,typeCare: typeCareService[controller.selcectValue],)));
                        },
                      ),
                    ],
                  )
                ],
              ),

                          GetBuilder<TypeCareController>(
                        init: TypeCareController(),
                        builder: (controller) {
                          return
                        },
                      )),
 */
