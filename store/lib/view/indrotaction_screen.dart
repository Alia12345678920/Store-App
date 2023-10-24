import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'login.dart';


class indrotaction_screen extends StatelessWidget{
  indrotaction_screen({super.key});
 final List<PageViewModel> pages= [

   PageViewModel(
     title: 'WELCOME',
     body: 'Hi we wish you a good time',

       image: Container(
         margin:EdgeInsets.only(top: 22),
         child: Center(
           child: Image(image: AssetImage('image/welcome.png',),
             )
           // Image.asset('image/welcome.png',) ,
         ),
       ),
          decoration: const PageDecoration(
            titleTextStyle: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            )
          ),
   ),
   PageViewModel(
     title: 'STOR ONLINE ',
     body: 'you can purchase electronic devices through this application',

     image: Center(
       child:Image.asset('image/2.png') ,
     ),
     decoration: const PageDecoration(
         titleTextStyle: TextStyle(
           fontSize: 25.0,
           fontWeight: FontWeight.bold,
         )
     ),
   ),
   PageViewModel(
     title: 'Thank you for following the instructions.',
     body: '',

     image: Center(
       child:Image(image: AssetImage('image/3.png'),)
     ),
     decoration: const PageDecoration(
         titleTextStyle: TextStyle(
           fontSize: 25.0,
           fontWeight: FontWeight.bold,
         )
     ),
   ),
 ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
backgroundColor: Colors.white,
      ),

          body:
          IntroductionScreen(
          pages: pages ,
          dotsDecorator: const DotsDecorator(
            size: Size(5, 5),
            color: Colors.grey,
            activeSize: Size.square(10),
            activeColor: Color(0xFF49796B),
          ),
          showDoneButton: true,
          done: const Text('Done',style: TextStyle(fontSize: 25),),
          showSkipButton: true ,
          skip: const Text('Skip',style: TextStyle(fontSize: 20),),
          showNextButton: true,
          next: const Icon(Icons.arrow_forward,size: 25,),
          onDone: () => onDone(context),
            curve: Curves.bounceOut,
        ),
    );
  }
     void onDone(context){
       debugShowCheckedModeBanner: false;
       Navigator.pushReplacement(
           context,
           MaterialPageRoute(builder: (context) => const LoginScreen() ) );
     }
}
