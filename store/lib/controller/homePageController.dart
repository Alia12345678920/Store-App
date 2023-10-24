import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:store/view/homeScreen.dart';
import 'package:store/view/settings.dart';
import 'package:store/view/cart.dart';

import '../view/favorite.dart';
import '../view/notes.dart';

class homePageController extends GetxController{

  List<String> titles =[
    "a",
    "b",
    "g",
    "c",
    "s",
  ];

  List<Widget> screens = [
     homeScreen(),
    cart(),
    favorite(),
    Notes(),
    settings(),
];
   int currentindex = 0;

}