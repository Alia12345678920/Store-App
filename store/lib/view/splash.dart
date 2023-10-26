import 'dart:async';
//import 'dart:js';

import 'package:flutter/material.dart';
//import 'package:dark/screens/onbording.dart';
// import 'package:store/view/login.dart';

import 'indrotaction_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds:5),
        ()=>Navigator.pushReplacement(context as BuildContext,
        MaterialPageRoute(builder: (context) =>
            indrotaction_screen()
        ))
    );
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xff49796B),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                 // backgroundColor: Colors.white,
                  radius: 70,
                  backgroundImage: AssetImage('image/Logo.png'),
                  // child: Padding(
                  //   padding: const EdgeInsets.all(0.0),
                  //   child: Image(
                  //     image: AssetImage('images/logo.png'),
                  //     color: Colors.pink[100],
                  //     colorBlendMode:BlendMode.color ,
                  //     height: 70,
                  //   //  centerSlice: new Rect.fromLTRB(6.0, 1.0, 17.0, 49.0),
                  //    // centerSlice: Rect.fromCircle(center:Offset(10,10) , radius: 50),
                  //   ),
                  // ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text('Store App',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
            )
          ],
        ),
      ) ,
    );
  }
}
