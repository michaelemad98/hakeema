import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hakeema/feature/controller/profileControllers.dart';
import 'package:hakeema/feature/model/usermodel.dart';
import 'package:hakeema/feature/view/screens/HomeMainScreen/Settings/settingsProfileScreen/SettingprofileScreen.dart';
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
        title: Text(
          AppLocalizations.of(context)!.profile,
          style: TextStyle(color: Colors.cyan),
        ),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SettingsProfileScreen()));
            }, icon: Icon(Icons.settings)),

        ],
      ),
      body: SingleChildScrollView(
          child: FutureBuilder(
        future: controllar.getCustomerInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return controllar.isCompleted
                  ? SingleChildScrollView(
                    child: Container(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ProfileContainer(
                              title: AppLocalizations.of(context)!.name,
                                txt:
                                controllar.data['Data']['FirstNameArabic']==null?"":
                                    "${controllar.data['Data']['FirstNameArabic']}"),
                            ProfileContainer(
                                title: AppLocalizations.of(context)!.email,
                                txt: controllar.data['Data']['Email']==null?"":controllar.data['Data']['Email']),
                            ProfileContainer(
                                title: AppLocalizations.of(context)!.phone,
                                txt: controllar.data['Data']['Mobile']==null?"":controllar.data['Data']['Mobile']),
                            Container(
                              padding: EdgeInsets.all(16),
                              margin: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade900,
                                boxShadow: [
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

                                      txt: controllar.data['Data']['BuildingNumber']==null?"":controllar.data['Data']['BuildingNumber'],
                                  title:AppLocalizations.of(context)!.building_num,
                                  ),
                                  ProfileContaineraddress(
                                    title: AppLocalizations.of(context)!.unit_no,
                                      txt: controllar.data['Data']['UnitNumber']==null?"":controllar.data['Data']['UnitNumber']),
                                  Row(
                                    children: [
                                      Flexible(
                                        child: ProfileContaineraddress(
                                          title: AppLocalizations.of(context)!.street,
                                            txt: controllar.data['Data']
                                                    ['StreetName']==null?"":controllar.data['Data']
                                            ['StreetName']
                                                .toString()),
                                      ),
                                      Flexible(
                                        child: ProfileContaineraddress(
                                          title: AppLocalizations.of(context)!.zone_no,
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
                      ),
                  )
                  : RegisterScreen();
            } else if (snapshot.hasError) {
              return RegisterScreen();
            } else {
              return Center(
                child:
                    Text('${AppLocalizations.of(context)!.somethingwentwrong}'),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )),
    );
  }
}

/*
,
 */
