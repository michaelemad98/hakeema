import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:hakeema/feature/controller/myreservationcontroller/myreservationController.dart';
import 'package:hakeema/feature/model/reservationmodel.dart';
import '../../../widgits/Containers/reservationContaine.dart';
import '../../../widgits/Containers/settingContainer.dart';

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
                      itemCount: contrller.reservationmodel['Data'].length ,
                        shrinkWrap: true,
                        itemBuilder: (context,index){
                      return reservationContainer(contractorType: "${contrller.reservationmodel["Data"]![index]["ContractorType"]}",
                      careServices: "${contrller.reservationmodel["Data"]![index]["CareServices"]}",
                      needsCare: "${contrller.reservationmodel["Data"]![index]["NeedsCare"]}",
                        specialInstructions: "${contrller.reservationmodel["Data"]![index]["SpecialInstructions"]}",
                        serviceTime: "${contrller.reservationmodel["Data"]![index]["ServiceTime"]}",
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
