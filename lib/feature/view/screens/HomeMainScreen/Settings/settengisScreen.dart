import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../widgits/Containers/settingContainer.dart';

class SettengScreen extends StatelessWidget {
  const SettengScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(AppLocalizations.of(context)!.settings,style: TextStyle(color: Colors.cyan),),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              SettingContainerbtn(widget: Icon(Icons.account_circle_sharp,color: Colors.cyan,),txt: 'Edit Account'),
              SettingContainerbtn(widget: Icon(Icons.location_on,color: Colors.cyan),txt: 'Edit Address'),
              SettingContainerbtn(widget: Icon(Icons.language,color: Colors.cyan),txt: 'Change Language'),
              SettingContainerbtn(widget: Icon(Icons.exit_to_app,color: Colors.cyan),txt: 'Exit'),
            ],
          ),
        ),
      ),
    );
  }
}
