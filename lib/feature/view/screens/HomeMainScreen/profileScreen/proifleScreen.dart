import 'package:flutter/material.dart';

import '../../../widgits/Containers/profileContainer.dart';
import '../../../widgits/Textview/textview.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'EditProfile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(AppLocalizations.of(context)!.profile,style: TextStyle(color: Colors.cyan),),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfileScreen()));
          }, icon: Icon(Icons.edit,color: Colors.cyan,)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileContainer(txt: AppLocalizations.of(context)!.name),
              ProfileContainer(txt: AppLocalizations.of(context)!.email),
              ProfileContainer(txt: AppLocalizations.of(context)!.phone),
              Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade900
                      ,boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                ),
                child:Column(
                  children: [
                    ProfileContaineraddress(txt: AppLocalizations.of(context)!.building_num),
                    ProfileContaineraddress(txt: AppLocalizations.of(context)!.unit_no),
                    Row(
                      children: [
                        Flexible(child: ProfileContaineraddress(txt: AppLocalizations.of(context)!.zone_no),
                        ),
                        Flexible(child: ProfileContaineraddress(txt: AppLocalizations.of(context)!.street),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
