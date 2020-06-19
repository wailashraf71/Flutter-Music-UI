import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music/ui/components/theme.dart';
import 'package:music/ui/screens/auth/login.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music',
      navigatorKey: Get.nestedKey(5),
      debugShowCheckedModeBanner: false,
      theme: mainThemeLight(context),
      home: Login(),
    );
  }
}