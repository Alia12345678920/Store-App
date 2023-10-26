import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/homeScreenController.dart';
import '../model/productsModel.dart';
import 'package:store/controller/theme_data/theme_data_light.dart';
import 'package:store/controller/theme_data/theme_data_dark.dart';
import 'package:store/controller/SharedPrefrences/CasheHelper.dart';


class productDetails extends StatefulWidget {
  productsModel product;
  int index;
 productDetails({
   required this.product,
   required this.index,
   super.key});

  @override
  State<productDetails> createState() => _productDetailsState();
}

class _productDetailsState extends State<productDetails> {
  homeScreenController controller = Get.find();

  @override
  Widget build(BuildContext context) {
     return
       // GetMaterialApp(
    //     theme: CacheData.getData(key: 'Mode')??false?getThemeDataLight():getThemeDataDark(),
    //  home:
      Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      actions: [
      Column(
      //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // TextButton(
          //     onPressed: (){},
          //     child: Text('TextButton')),
          // const Divider(
          //   thickness: 1,
          //   indent: 100,
          //   endIndent: 100,
          // ),
          // SizedBox(
          //   height: 90,
          //   width: 100,
          //   child: FittedBox(
          //     fit: BoxFit.fill,
          //     child: Switch(
          //         value: TF,
          //         onChanged: (value){
          //           setState(() {
          //             TF=value;
          //           });
          //
          //         },
          //       activeThumbImage: NetworkImage('https://freepngimg.com/thumb/categories/1738.png'),
          //      // inactiveThumbColor:Colors.grey[100] ,
          //       inactiveThumbImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbRmuMatEH3ymhjMmyYKL6S_kONjiYYEWq-e1Vy2cN26fmDgVH7dFl0A26A9I66KcBycI&usqp=CAU'),
          //     ),
          //   ),
          // ),
          // const Divider(
          //   thickness: 1,
          //   indent: 100,
          //   endIndent: 100,
          // ),
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
      ),]
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Text("Brand  " "${widget.product.products![widget.index].title}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.product.products![widget.index].images!.length,
              itemBuilder: (BuildContext context,int e) => Image.network(widget.product.products![widget.index].images![e],),
            ),
          ),
          SizedBox(height: 5,),
          Container(
            padding: EdgeInsets.all(20),
            // color: Colors.grey,
            child: Text("${widget.product.products![widget.index].description}",
            ),),
          Container(
            padding: EdgeInsets.all(20),
            // color: Colors.grey,
            child: Text("The price is : " "${widget.product.products![widget.index].price}" " \$"),),
          Container(
            padding: EdgeInsets.all(20),
            // color: Colors.grey,
            child: Text("The rating is : " "${widget.product.products![widget.index].rating}"),),
          Container(
            padding: EdgeInsets.only(left: 40 , right: 40),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
              MaterialButton(
                minWidth: 150,
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)) ,
               color: Color(0xff49796B),
                onPressed: (){
                  controller.addToCart(controller.product!.products![widget.index],
                      controller.product!.products![widget.index].price!.toInt());

                },
                child: Row(children: [
                  Text("add to cart   "), Icon(Icons.shopping_cart, color: Colors.white,)
                ],) ,),
              SizedBox(width: 20,),
              MaterialButton(
                minWidth: 150,
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)) ,
                color: Color(0xff49796B),
                onPressed: (){},
                child: Row(children: [
                  Text("buy now   "), Icon(Icons.money, color: Colors.white,)
                ],) ,),

            ],),
          )


        ],
      )
    //  )

    );
  }}
