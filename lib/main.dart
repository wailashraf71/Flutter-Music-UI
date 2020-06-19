import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:music/ui/components/theme.dart';
import 'package:music/ui/screens/auth/login.dart';

void main(){
  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: [
//      Locale('ku', 'IQ'),
      Locale('ar', 'IQ')
    ],
    path: 'assets/languages',
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music',
      navigatorKey: Get.nestedKey(5),
      debugShowCheckedModeBanner: false,
      theme: mainThemeLight(context),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        EasyLocalization.of(context).delegate,
      ],
      supportedLocales: EasyLocalization.of(context).supportedLocales,
      locale: EasyLocalization.of(context).locale,
      home: Login(),
    );
  }
}