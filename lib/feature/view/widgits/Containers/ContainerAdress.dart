import 'package:flutter/material.dart';
import 'package:hakeema/feature/view/widgits/Containers/profileContainer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../EditText/edittextEditProifle.dart';

class ContainerAdress extends StatelessWidget {
  TextEditingController ?buildingtec ;
  TextEditingController ?unittec ;
  TextEditingController ?streettec ;
  TextEditingController ?zonetec ;
  ContainerAdress({Key? key,this.buildingtec,this.streettec,this.unittec,this.zonetec}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          ProfileEditTextaddress(hintText: AppLocalizations.of(context)!.building_num,
          tec: buildingtec,
          ),
          ProfileEditTextaddress(hintText: AppLocalizations.of(context)!.unit_no,tec: unittec),
          Row(
            children: [
              Flexible(child: ProfileEditTextaddress(hintText: AppLocalizations.of(context)!.zone_no,tec: zonetec),
              ),
              Flexible(child: ProfileEditTextaddress(hintText: AppLocalizations.of(context)!.street,tec: streettec),
              ),
            ],
          )
        ],
      ),
    );
  }
}
