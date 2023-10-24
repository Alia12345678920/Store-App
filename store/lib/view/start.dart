import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MaterialButton(
              color: Colors.pinkAccent,
              onPressed: (){
                Get.updateLocale(Locale("ar"));
              //  Get.to(() => const Sinup)
                //ينتقل لصفحة اللوق اين
              },child: Text("d".tr,style: TextStyle(
              color: Colors.white,
            ),),),
            SizedBox(height: 10,),
            MaterialButton(
              color: Colors.pinkAccent,
              onPressed: (){
                Get.updateLocale(Locale("en"));
              },child: Text("e".tr,style: TextStyle(
              color: Colors.white,),),)
          ],
        ),
      ),

    );
  }
}
