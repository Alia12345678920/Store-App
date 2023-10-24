import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controller/translate.dart';
import 'package:store/view/indrotaction_screen.dart';
import 'package:store/view/login.dart';
import 'package:store/view/settings.dart';
import 'package:store/view/splash.dart';
import 'package:store/view/start.dart';
import 'view/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Locale("en"),//ar تغيره عربي(الاتجاه)
     translations: Translate(),
      title: 'Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff49796B).withOpacity(0.6)),
        useMaterial3: true,
      ),
      home: homePage(),
    );
  }
}