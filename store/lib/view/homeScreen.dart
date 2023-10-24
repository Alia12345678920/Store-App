import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/view/productdetails.dart';
import '../controller/homeScreenController.dart';
import 'productSearch.dart';

class homeScreen extends StatefulWidget {
   homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

  homeScreenController controller = Get.put(homeScreenController());
  homeScreenController controller1= Get.put(homeScreenController());
  homeScreenController controller2= Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff49796B).withOpacity(0.5),
        onPressed: () {
            showSearch(context: context, delegate:
            productSearch(products :controller2.product!.products!));
        },
        child: const Icon(Icons.search),
      ),

      body :Column(
        children: [
          // Card(
          //   child: Image(image: AssetImage('image/1.jpeg'),
          //     height: 100, width: double.infinity,fit: BoxFit.fill,),
          // ),

      GetBuilder<homeScreenController>(builder: (controller) =>
      controller.product != null ?
             Container(
              clipBehavior: Clip.hardEdge,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
              ),
              child: CarouselSlider.builder(
                itemCount: 4,
                //لو اشتي افعل كل العناصر
                // itemCount: controller.product!.products!.length ,
                itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Container(
                      child: Image.network("${controller.product!.products![itemIndex].thumbnail}",
                       height: 100,
                      width: 200,
                        fit: BoxFit.fill,
                      ) ,
                      //Text(itemIndex.toString()),
                    ), options: CarouselOptions(
                height: 100,
                aspectRatio: 16/9,
                // لو اشتي الصورة كاملة اخليه 1
                viewportFraction: 0.5,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                onPageChanged: (index , reason){},
                scrollDirection: Axis.horizontal,
              ),
              ),
            ):Center(child: CircularProgressIndicator())
          ),
          //.
          SizedBox(height: 20,),
          Expanded(
            child: GetBuilder<homeScreenController>(builder: (controller) =>
                   controller.product != null ?
                   GridView.builder(
                     // physics: NeverScrollableScrollPhysics(),
                       shrinkWrap: true,
                       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                           childAspectRatio: (150 /199),
                           crossAxisSpacing: 5 ,
                           mainAxisSpacing: 5 ,
                           crossAxisCount: 2),
                      // نقدر نحددعدد العناصر اللي نشتي
                     // itemCount: controller.product!.products!.length,
                       itemCount: 10,
                       itemBuilder: (BuildContext context, int index) =>
                           InkWell(
                             onTap: (){
                               Get.to(()=> productDetails(product:controller.product!,index: index,));
                             },
                             child: Container(
                               padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                               margin: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
                               decoration: BoxDecoration( borderRadius: BorderRadius.circular(20), color: Colors.white,
                                   // color: Color(0xFF212325),
                                   boxShadow: [
                                     BoxShadow(color: Colors.black.withOpacity(0.4),
                                     spreadRadius: 1,
                                     blurRadius: 8)
                                   ] ),
                               child: Column(
                                 children:[ Container(
                                   margin: EdgeInsets.only(top: 5,right: 5,left: 5),
                                   // clipBehavior: Clip.antiAlias,
                                   //     decoration: BoxDecoration(
                                   //      borderRadius: BorderRadius.circular(10)),
                                   child: Image.network("${controller.product!.products![index].thumbnail}",
                                     height: 120, width: 120,
                                     fit: BoxFit.contain,
                                   ),
                                 ),
                                   Padding(padding: EdgeInsets.only(bottom: 8)),
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text("${controller.product!.products![index].title}",
                                 style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                                         //في حال ظهور خطأ في مساحة العناوين
                                      maxLines: 1,
                                       overflow: TextOverflow.ellipsis,
                                       ),
                                       SizedBox(height: 4),
                                       Text("${controller.product!.products![index].price}" r"$",style:
                                         TextStyle(fontSize: 16, color: Colors.black45),)
                                     ],
                                   ),
                                     SizedBox(height: 5),
                                     Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                                       children: [
                                         MaterialButton(
                                           minWidth: 30,
                                           padding: EdgeInsets.only(right: 1, left: 5,),
                                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)) ,
                                           // color: Color(0xFFE57734),
                                           color: Color(0xff49796B) ,
                                           onPressed: (){
                                             controller.addToCart(controller.product!.products![index],
                                                 controller.product!.products![index].price!.toInt());
                                           },
                                           child: Row(
                                             children: [
                                             Text("add to cart  " ,style: TextStyle(color: Colors.white),), Icon(Icons.shopping_cart, color: Colors.white,)
                                           ],) ,
                                         ),
                                         InkWell(
                                           onTap: (){
                                             controller.addToFavorite(controller.product!.products![index],);
                                           },
                                           child: Container(
                                             padding: EdgeInsets.all(5),
                                             decoration: BoxDecoration(
                                               color: Color(0xff49796B),
                                               borderRadius: BorderRadius.circular(20),
                                             ),
                                             child:
                                             // IconButton(
                                             //   iconSize: 5,
                                             //   icon: Icon(Icons.favorite, color: Colors.white,size: 20),
                                             //   onPressed: (){
                                             //        controller.addToFavorite(controller.product!.products![index],);
                                             //   },),
                                             Icon(Icons.favorite, color: Colors.white,size: 20,),
                                           ),
                                         ),
                                       ],
                                     ),

                                   // MaterialButton(
                                   //   minWidth: 150,
                                   //   padding: EdgeInsets.all(10),
                                   //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)) ,
                                   //   color: Colors.pinkAccent,
                                   //   onPressed: (){
                                   //     controller.addToFavorite(controller.product!.products![index],);
                                   //   },
                                   //   child: Row(children: [
                                   //     Text("add to favorite   "), Icon(Icons.favorite, color: Colors.white,)
                                   //   ],) ,),
                                 ],
                               ),
                             ),
                           ))
                       :Center(child: CircularProgressIndicator()),

            ),
          )
        ],
      ),
    );
  }
}

// ListView.separated(
// physics: BouncingScrollPhysics(),
// itemBuilder: (context , index)=>
// InkWell(
// onTap: (){
// Get.to(()=> productDetails(product:controller.product!,index: index,));
// },
// child: Container(
// decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
// color: Colors.grey[200],
// ),
// margin: EdgeInsets.all(10),
// child: Column(
// children: [
// Row( children: [
// Container(
// clipBehavior: Clip.antiAlias,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(20)
// ),
// child: Image.network("${controller.product!.products![index].thumbnail}",
// height: 150,
// width: 150,
// fit: BoxFit.fill,),
// ),
// Expanded(
// child: Container(
// padding: EdgeInsets.only(right: 20, left:20),
// height: 150,
// child: Column(
// mainAxisSize: MainAxisSize.min,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text("${controller.product!.products![index].title}",
// maxLines: 1,
// style: TextStyle(
// fontSize: 25, color: Colors.pink,
// fontWeight: FontWeight.bold,
// ),),
// Text("${controller.product!.products![index].description}",
// maxLines: 1,
// overflow: TextOverflow.ellipsis,
// ),
// Spacer(),
// // SizedBox(height: 15,),
// Row(children: [
// Text("${controller.product!.products![index].price}" r" $",
// style: TextStyle(
// fontSize: 20, color: Colors.pink,
// fontWeight: FontWeight.bold,
// ),),
// Spacer(),
// //   SizedBox(width: 50,),
// Text("${controller.product!.products![index].rating}",
// style: TextStyle(
// fontSize: 20, color: Colors.pink,
// fontWeight: FontWeight.bold,
// ),)
//
// ],),
// MaterialButton(
// minWidth: 150,
// padding: EdgeInsets.all(10),
// shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)) ,
// color: Colors.pinkAccent,
// onPressed: (){
// controller.addToCart(controller.product!.products![index],
// controller.product!.products![index].price!.toInt());
// },
// child: Row(children: [
// Text("add to cart   "), Icon(Icons.shopping_cart, color: Colors.white,)
// ],) ,),
// MaterialButton(
// minWidth: 150,
// padding: EdgeInsets.all(10),
// shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)) ,
// color: Colors.pinkAccent,
// onPressed: (){
// controller.addToFavorite(controller.product!.products![index],);
// },
// child: Row(children: [
// Text("add to favorite   "), Icon(Icons.favorite, color: Colors.white,)
// ],) ,),
//
// ],),
// ),
// )
// ],),
// ],
// ),
// ),
// )
// ,separatorBuilder:  (context , index)=> Container(height: 1,
// color: Colors.grey,
// margin: EdgeInsets.only(right: 10, left: 10),) ,
// itemCount: controller.product!.products!.length ,
// )
