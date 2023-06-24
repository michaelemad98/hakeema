import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hakeema/feature/controller/homeController.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hakeema/feature/view/screens/HomeMainScreen/profileScreen/proifleScreen.dart';

import 'Settings/settengisScreen.dart';
import 'appontmentScreen.dart';

class HomeMainScreen extends StatelessWidget {
  const HomeMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(init: HomeController(),
      builder: (controller) {
        return CupertinoTabScaffold(tabBar: CupertinoTabBar(
          items:  <BottomNavigationBarItem>
          [
            BottomNavigationBarItem(icon: Icon(Icons.apps_sharp,),label: AppLocalizations.of(context)!.home),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle_sharp,),label: AppLocalizations.of(context)!.profile),
            BottomNavigationBarItem(icon: Icon(Icons.settings,),label: AppLocalizations.of(context)!.settings),
          ],
        ),
            tabBuilder: (context,index) {
          switch(index){
            case 0:
              return CupertinoTabView(builder: (context){
                return CupertinoPageScaffold(child: AppointmentScreen(),);

              },);
            case 1:
              return CupertinoTabView(builder: (context){
                return CupertinoPageScaffold(child: ProfileScreen(),);
              },);
            case 2:
              return CupertinoTabView(builder: (context){
                return CupertinoPageScaffold(child: SettengScreen(),);
              },);
          }
          return Container();
        }
        );
      },
    );
  }
}

/*
Scaffold(
              body: HomeController.widgetOptions.elementAt(controller.currentindex),
              bottomNavigationBar:BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex:controller.currentindex,
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.account_circle_sharp,),label: AppLocalizations.of(context)!.profile),
                  BottomNavigationBarItem(icon: Icon(Icons.apps_sharp,),label: AppLocalizations.of(context)!.home),
                  BottomNavigationBarItem(icon: Icon(Icons.settings,),label: AppLocalizations.of(context)!.settings),
                ],
                onTap: (index){
                  controller.ontab(index);
                },

          ),
        );
 */