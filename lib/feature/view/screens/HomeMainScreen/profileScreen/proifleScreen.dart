import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hakeema/feature/controller/profileControllers.dart';
import 'package:hakeema/feature/model/usermodel.dart';
import 'package:hakeema/feature/view/widgits/Buttons/dufueltBtn.dart';

import '../../../../../main.dart';
import '../../../../constant/constats.dart';
import '../../../../model/customerinfomodel.dart';
import '../../../widgits/Containers/profileContainer.dart';
import '../../../widgits/Textview/textview.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import '../../registphone/registerCustomermobile.dart';
import '../../registphone/registertScreenPhone.dart';
import 'EditProfile.dart';
import 'RegisterScreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controllar = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(AppLocalizations.of(context)!.profile,
          style: TextStyle(color: Colors.cyan),),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          GetBuilder<ProfileController>(
              init: ProfileController(),
              builder: (controllar){
            return IconButton(onPressed: () {
              AwesomeDialog(
                  context: context,
                  dialogType: DialogType.noHeader,
                  animType: AnimType.rightSlide,
                  body:Container(
                    margin: EdgeInsets.all(16),
                    child: Column(
                      children: [

                        Text('${AppLocalizations.of(context)!.changeLang}'),
                        SizedBox(height: 16,),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children:[
                              InkWell(
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage('https://www.flaticon.com/download/icon/2626476?icon_id=2626476&author=573&team=573&keyword=Language&pack=2626431&style=Outline+Color&style_id=1225&format=png&color=%23000000&colored=2&size=512%2C256%2C128%2C64%2C32%2C24%2C16&selection=1&type=standard&search=englis'),
                                  radius: 45,
                                ),
                                onTap: (){
                                  MyApp.setLocale(context, Locale('en'));
                                  controllar.language();
                                  Navigator.pop(context);
                                },
                              ),
                              InkWell(
                                onTap: (){
                                  MyApp.setLocale(context, Locale('ar'));
                                  controllar.language();
                                  Navigator.pop(context);
                                },
                                child: CircleAvatar(
                                  radius: 45,
                                  backgroundImage: NetworkImage('https://www.flaticon.com/download/icon/6091204?icon_id=6091204&author=410&team=410&keyword=Arabic&pack=6090915&style=Lineal+color&style_id=15&format=png&color=%23000000&colored=2&size=512%2C256%2C128%2C64%2C32%2C24%2C16&selection=1&type=standard&token=03AAYGu2TjodTAQbDEiht_87GZmEBm2a6pT9YrnwwWY4Br7G5tYABmocCzsd1eOEVfPfyQBY_M21ykmkPcWzOPTB0aodXPrxcgLj0_ExMx1veoAHOZczk71FRUo9t-oAU0iu55YlQxrYMaad-TjlsCTIEYftbgF2ENZ64FMmOyumih3vZK8wLc_ZVJQGUoTWW6PRDv7xwuWG7zdxzRPtxtjBfslRnc0H3gSnHUcjnaF1xuxioIqbBhvE6u5iBTnNEOQ3Wm-Ilqhlmw2JGH6yCTuAtoTYI1o_QJUCycbw-5WlE3iCX-RDJV3NCY3NJpO19a1Zc7bdeWOdQRS-9GUYnOp8jxKrzLhyI2X1tnQz7xJK2fbKDiwAwWX4q3yRERByXKgWJfFHVr50LOjcijq1bXkiirpaHO_tmt-3aqGoOgsIdxYTEGvEwAIIzeTavWyyKnpdQCUQLrLsrfGAnLZGJ5jTHKuesbsi54JMqcllnjptL0nMqDspaCX5TfQk5nsmly_mXho8HrMtuQzXr2EqfKTR_AkhchlX84_x4MJVQzfcHYVDdje7lZvnvjn1GZKh8HK622-PThIdkYhJYnrKqjE80OZG925eK20e-ZpWnKv54mOgViHXLLFNBGIbyQ8Jw4SlsIrCW6EBEj4p-Ozw7WYov197LEwQ3j4a2VzF_HoK_Era9bOzRyNXm4BcFc31KvmNiSG_w3RGKtPjId9HB-2weI3LYAzmtAAoFrITrFuZ52IlgQUL_BDs8xluagCFiRJlbhmrbFitqW5OfiMiwzc9Hyr5RpWYfvffNegz6sXLJvNZBVAP1f-IiNz4rMg-UYsganKVpt9Qa3uboR8PT9vxNu0MSm_UknksIYWrF0vwQ4HQNM204sdDtZ4kBq10fGxUBVqkslH7UlfW99a27ePEq4YAewIZK2XwfxMm2LkoVywn1bM5jLrntttQxua16z1zI6x4E61RsvYqLrB-AmDkFmgwUIgAXZFtSHbJ2D5WjmTcdpOSWYczeKGA6s-05cYCzNRY2YM_FU_44Jrwr7GnXIfuKgKpTduzgxmAcO46X6aHA_rLC6JOK5mOTIQdmPaeSm_j19sk_rsMsr-e2rHtGsuIa_IDApoj254t21VeAwoqaPaYTaxXGnna6QguueMXIAI0FkGtIVVkIMoTnbgkUDJufr3sJZvhVG4ik_gIIJbx8hFPXV6wx75VV28VbGEeFGONmdS1gQXHZ1w5gyaIdJ82CvcHfhi9XxAlGyYhiqFztIK3gxOOLzQ2tBqszbo-ENgqUL9I4333IygfgT-cgpMjklqLXR-sgfnU_V2ttgdYZt4DcYAm2E9bjHHOYt79Mg6Do6M298MiQd7IC8x1i-yyKiXmMVZN3OQfk6S3gy3oYuetFE10J3lPpUShz_Nrwx-d_rzhTW2L3NrWerK7qq4n0oBg9lss8hN9gLV2_oJSOXJGWYP73HG6rRtL0is4sZCs5MKSbo&search=arabic'),
                                ),
                              ),
                            ]
                        ),
                      ],
                    ),
                  )
              )
                  .show();
            }, icon: Icon(Icons.language,color: Colors.cyan,));
          }),
          IconButton(onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EditProfileScreen()));
          }, icon: Icon(Icons.edit, color: Colors.cyan,)),
          IconButton(onPressed: () async{
            await FirebaseAuth.instance.signOut();
            box.write(isLoginkey, false);
            Get.offAll(()=>RegisterByPhone());
          }, icon: Icon(Icons.logout, color: Colors.cyan.shade900,)),

        ],
      ),
      body: SingleChildScrollView(
          child: FutureBuilder(
            future: controllar.getCustomerInfo(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return controllar.isCompleted ? Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ProfileContainer(txt: "${controllar
                            .data['Data']['FirstNameArabic']}"),
                        ProfileContainer(txt: controllar.data['Data']['Email']),
                        ProfileContainer(
                            txt: controllar.data['Data']['Mobile']),
                        Container(
                          padding: EdgeInsets.all(16),
                          margin: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade900
                            , boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                          ),
                          child: Column(
                            children: [
                              ProfileContaineraddress(
                                  txt: controllar.data['Data']['BuildingNumber']
                                      .toString()),
                              ProfileContaineraddress(
                                  txt: controllar.data['Data']['UnitNumber']
                                      .toString()),
                              Row(
                                children: [
                                  Flexible(child: ProfileContaineraddress(
                                      txt: controllar.data['Data']['StreetName']
                                          .toString()),
                                  ),
                                  Flexible(child: ProfileContaineraddress(
                                      txt: controllar.data['Data']['ZoneNO']
                                          .toString()),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ) : RegisterScreen();
                } else if (snapshot.hasError) {
                  return RegisterScreen();
                } else {
                  return Center(child: Text(
                      '${AppLocalizations.of(context)!.somethingwentwrong}'),);
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
      ),
    );
  }
}

/*
,
 */