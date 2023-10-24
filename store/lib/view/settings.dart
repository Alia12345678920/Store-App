import 'package:flutter/material.dart';
import 'package:get/get.dart';

class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  String dropdownValue = "one";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:[ Row(
          children: [
            Text("l".tr,style: TextStyle(fontSize: 20),),
            DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_drop_down_sharp),
              style: TextStyle(color: Color(0xff49796B)),
              underline: Container(height: 2,color: Color(0xff49796B),),
              onChanged: (String? newValue){
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: [
                DropdownMenuItem<String>(
                  value: 'one',
                  child: Text('e'.tr),
                  onTap: (){
                    Get.updateLocale(Locale("en"));
                  },
                ),
                DropdownMenuItem<String>(
                  value: 'two',
                  child: Text('d'.tr),
                  onTap: (){
                    Get.updateLocale(Locale("ar"));
                  },
                )

              ],
            ),
          ],
        ),
          Divider(height: 2,)

]
      ),

    );
  }
}
// child: Column(
//   mainAxisSize: MainAxisSize.min,
//   children: [
//     MaterialButton(
//       color: Colors.pinkAccent,
//       onPressed: (){
//         Get.updateLocale(Locale("ar"));
//         //  Get.to(() => const Sinup)
//         //ينتقل لصفحة اللوق اين
//       },child: Text("d".tr,style: TextStyle(
//       color: Colors.white,
//     ),),),
//     SizedBox(height: 10,),
//     MaterialButton(
//       color: Colors.pinkAccent,
//       onPressed: (){
//         Get.updateLocale(Locale("en"));
//       },child: Text("e".tr,style: TextStyle(
//       color: Colors.white,),),)
//   ],
// ),