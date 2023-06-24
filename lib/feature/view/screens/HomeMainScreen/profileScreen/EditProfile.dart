import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hakeema/feature/constant/constats.dart';
import '../../../widgits/Containers/profileContainer.dart';
import '../../../widgits/EditText/edittextEditProifle.dart';
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: box.read('language')?TextDirection.rtl:TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(AppLocalizations.of(context)!.profile,style: TextStyle(color: Colors.cyan),),
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ProfileEditText(hintText: AppLocalizations.of(context)!.name),
                ProfileEditText(hintText: AppLocalizations.of(context)!.email),
                ProfileEditText(hintText: AppLocalizations.of(context)!.phone),
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
                      ProfileEditTextaddress(hintText: AppLocalizations.of(context)!.building_num),
                      ProfileEditTextaddress(hintText: AppLocalizations.of(context)!.unit_no),
                      Row(
                        children: [
                          Flexible(child: ProfileEditTextaddress(hintText: AppLocalizations.of(context)!.zone_no),
                          ),
                          Flexible(child: ProfileEditTextaddress(hintText: AppLocalizations.of(context)!.street),
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
      ),
    );
  }
}
