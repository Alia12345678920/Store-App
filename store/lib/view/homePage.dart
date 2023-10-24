import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/homePageController.dart';
import '../controller/homeScreenController.dart';
import '../productSearch.dart';

class homePage extends StatefulWidget {
   homePage({super.key});
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  homePageController controller= Get.put(homePageController());
  homeScreenController controller1= Get.put(homeScreenController());
  homeScreenController controller2= Get.find();
  String dropdownValue = "one";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<homePageController>(builder: (controller)=>
        Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color(0xff49796B),
            elevation: 0,
            title: Text(controller.titles[controller.currentindex].tr,style: TextStyle(color: Colors.white),) ,
            actions: [
            //   IconButton(onPressed: (){
            //   showSearch(context: context, delegate: productSearch(products :controller2.product!.products!));
            // },
            //     icon:
            // Icon(Icons.search, size: 35,)),
              SizedBox(width: 70,child: Stack(children: [
              IconButton(onPressed: (){} ,
                  icon: Icon(Icons.shopping_cart_checkout_outlined, color: Colors.white,)),
              GetBuilder<homeScreenController>(
                builder: (controller2) {
                  return Positioned(
                    right: 22,
                    child: CircleAvatar(
                      radius:10,
                      backgroundColor: Colors.white,
                      child: Text("${controller2.cartCount}"),
                    ),
                  );
                })],),)],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentindex,
            onTap: (value){
              controller.currentindex = value;
              print(controller.currentindex);
              controller.update();
            },
            // unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home,),label: "a".tr , backgroundColor: Color(0xff49796B)),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,),label: "b".tr ,backgroundColor: Color(0xff49796B)),
              BottomNavigationBarItem(icon: Icon(Icons.favorite,),label: "g".tr ,backgroundColor: Color(0xff49796B)),
              BottomNavigationBarItem(icon: Icon(Icons.note_alt,),label: "c".tr ,backgroundColor: Color(0xff49796B)),
              BottomNavigationBarItem(icon: Icon(Icons.settings,),label: "s".tr ,backgroundColor: Color(0xff49796B)),

            ],
             ),

          body: controller.screens[controller.currentindex],
        )
    );
  }
}

