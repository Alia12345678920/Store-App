import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controller/theme_data/theme_data_light.dart';
import 'package:store/controller/theme_data/theme_data_dark.dart';
import 'package:store/controller/SharedPrefrences/CasheHelper.dart';
class settings extends StatefulWidget {
  const settings({super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  String dropdownValue = "one";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          theme: CacheData.getData(key: 'Mode')??false?getThemeDataLight():getThemeDataDark(),

        debugShowCheckedModeBanner: false,
    home:Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          
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
                  ),

                ],
              ),
            ],
          ),
            Divider(height: 2,),
            Row(
              children: [
                Text("z".tr,style: TextStyle(fontSize: 20),),
                Transform.scale(
                  scale: 1,
                  child:  Switch(
                    value: CacheData.getData(key: 'Mode')??false,
                    onChanged: (value) {
                      setState(() {
                        CacheData.setData(key: 'Mode', value: value
                        ).then((value) {
                          print(value);
                          print(CacheData.getData(key: 'Mode'));
                        });
                      });
                    }
                    ,
                    // activeThumbImage: NetworkImage('https://freepngimg.com/thumb/categories/1738.png'),
                    // inactiveThumbColor:Colors.grey[100] ,
                    // inactiveThumbImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbRmuMatEH3ymhjMmyYKL6S_kONjiYYEWq-e1Vy2cN26fmDgVH7dFl0A26A9I66KcBycI&usqp=CAU'),
                  ),
                ),
              ],
            ),
]
        ),
      ),
      )
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