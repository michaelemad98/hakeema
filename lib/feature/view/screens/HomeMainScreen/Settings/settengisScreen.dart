import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:hakeema/feature/controller/myreservationcontroller/myreservationController.dart';
import 'package:hakeema/feature/model/reservationmodel.dart';
import '../../../widgits/Containers/reservationContaine.dart';
import '../../../widgits/Containers/settingContainer.dart';
import '../../../widgits/Textview/textview.dart';

class SettengScreen extends StatelessWidget {
  const SettengScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(AppLocalizations.of(context)!.myreservation,style: TextStyle(color: Colors.cyan),),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: GetBuilder<MyreservationController>(
        init: MyreservationController(),
        builder: (contrller){
          return SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: FutureBuilder(
                future: contrller.Getreservation(),
                builder: (context,snapshot){
                  if (snapshot.connectionState==ConnectionState.done){
                    if(snapshot.hasData){
                      return ListView.builder(
                          reverse: true,
                          itemCount: contrller.reservationmodel['Data'].length ,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context,index){
                            return reservationContainer(
                              code:"${contrller.reservationmodel["Data"]![index]["Code"]}" ,
                              contractorType: "${contrller.reservationmodel["Data"]![index]["ContractorType"]}",
                              careServices: "${contrller.reservationmodel["Data"]![index]["CareServices"]}",
                              needsCare: "${contrller.reservationmodel["Data"]![index]["NeedsCare"]}",
                              specialInstructions: "${contrller.reservationmodel["Data"]![index]["SpecialInstructions"]}",
                              serviceTime: "${contrller.reservationmodel["Data"]![index]["ServiceTime"]}",
                              widget: contrller.reservationmodel["Data"]![index]["status"]==0? Column(
                                children: [
                                  Icon(Icons.new_releases),
                                  DefaultText(txt: "${AppLocalizations.of(context)!.draft}",fontSize: 12,color: Colors.grey),
                                ],
                              ):contrller.reservationmodel["Data"]![index]["status"]==1?Column(
                                children: [
                                  Icon(Icons.fiber_new),
                                  DefaultText(txt: "${AppLocalizations.of(context)!.newstatus}",fontSize: 12,color: Colors.grey),
                                ],
                              ):contrller.reservationmodel["Data"]![index]["status"]==2?Column(
                                children: [
                                  Icon(Icons.cloud_upload_sharp),
                                  DefaultText(txt: "${AppLocalizations.of(context)!.inprocess}",fontSize: 12,color: Colors.grey),
                                ],
                              ):contrller.reservationmodel["Data"]![index]["status"]==3?Column(
                                children: [
                                  Icon(Icons.clear),
                                  DefaultText(txt: "${AppLocalizations.of(context)!.rejected}",fontSize: 12,color: Colors.grey),
                                ],
                              ):Column(
                                children: [
                                  Icon(Icons.check_circle),
                                  DefaultText(txt: "${AppLocalizations.of(context)!.done}",fontSize: 12,color: Colors.grey),
                                ],
                              ),
                              //widget: contrller.reservationmodel["Data"]![index]["status"]==0?Icon(Icons.new_releases)==1?Icon(Icons.fiber_new)==2?Icon(Icons.cloud_upload_sharp)==3?Icon(Icons.clear):Icon(Icons.check_circle):Icon(Icons.check_circle):Icon(Icons.check_circle):Icon(Icons.check_circle)
                            );
                            //Text("${contrller.reservationmodel["Data"]![index]["ContractorType"]}");
                          });
                    }else{
                      return IconButton(onPressed: (){
                        contrller.Getreservation();
                      }, icon: Icon(Icons.confirmation_number_sharp));
                    }
                  }
                  else{
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
