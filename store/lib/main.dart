import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controller/translate.dart';
import 'package:store/view/indrotaction_screen.dart';
import 'package:store/view/login.dart';
import 'package:store/view/productdetails.dart';
import 'package:store/view/settings.dart';
import 'package:store/controller/SharedPrefrences/CasheHelper.dart';
import 'package:store/controller/theme_data/theme_data_light.dart';
import 'package:store/controller/theme_data/theme_data_dark.dart';

import 'package:store/view/splash.dart';
import 'view/homePage.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheData.cacheInitialization();
  runApp( MyApp());
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
      home: SplashScreen(),
    );
  }
}