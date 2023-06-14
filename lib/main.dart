import 'package:flutter/material.dart';

import 'feature/view/screens/Splashscreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main()async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale){
    _MyAppState ? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale ? _locale;
  setLocale(Locale locale){
    setState(() {
      _locale= locale;
    });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Hakeeema',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: _locale,
        localeResolutionCallback: (currentLang,supportLang){
          if(currentLang !=null){
            for(Locale locale in supportLang){
              if(locale.languageCode== currentLang.languageCode){
                return currentLang;
              }
            }
          }
          return supportLang.first;
        },
      home:SplashScreen()
    );
  }
}


