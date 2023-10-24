import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/view/productdetails.dart';
import '../controller/homeScreenController.dart';

class cart extends StatefulWidget {
  const cart({super.key});
  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  homeScreenController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<homeScreenController>(builder: (controller){
      return controller.cartProduct.isEmpty? Center(
        child: Text("f".tr)):
      Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [Text("Totai   " "${controller.total}" r" $",
                style: TextStyle(
                fontSize: 25, color: Color(0xff49796B),
                fontWeight: FontWeight.bold,
              ),),
              MaterialButton(
                color: Color(0xff49796B),
                onPressed: (){},child: Text("Goto pay" , ),)
            ],),
            Expanded(
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                  itemBuilder: (context , index)=>
                  InkWell(
                    onTap: (){
                      Get.to(()=> productDetails(product:controller.product!,index: index,));
                    },
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                      ),
                      // margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row( children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Image.network("${controller.product!.products![index].thumbnail}",
                                height: 150,
                                width: 150,
                                fit: BoxFit.fill,),
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(right: 20, left:20),
                                height: 150,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${controller.cartProduct[index].title}",
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 25, color: Color(0xff49796B),
                                        fontWeight: FontWeight.bold,
                                      ),),
                                    Text("${controller.cartProduct[index].description}",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Spacer(),
                                    // SizedBox(height: 15,),
                                    Row(children: [
                                      Text("${controller.cartProduct[index].price}" r" $",
                                        style: TextStyle(
                                          fontSize: 20, color: Color(0xff49796B),
                                          fontWeight: FontWeight.bold,
                                        ),),
                                      Spacer(),
                                      //   SizedBox(width: 50,),
                                      Text("${controller.cartProduct[index].rating}",
                                        style: TextStyle(
                                          fontSize: 20, color: Color(0xff49796B),
                                          fontWeight: FontWeight.bold,
                                        ),)

                                    ],),
                                    MaterialButton(
                                      minWidth: 30,
                                      padding: EdgeInsets.only(right: 1, left: 5,),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)) ,
                                      color: Color(0xff49796B),
                                      onPressed: (){
                                        controller.removeFromCart(controller.product!.products![index],
                                            controller.product!.products![index].price!.toInt());
                                      },
                                      child: Row(children: [
                                        Text("remov from cart   "), Icon(Icons.shopping_cart, color: Colors.white,)
                                      ],) ,),

                                  ],),
                              ),
                            )
                          ],),
                        ],
                      ),
                    ),
                  )
                ,separatorBuilder:  (context , index)=> Container(height: 20,
                  // color: Colors.grey,
                  margin: EdgeInsets.only(right: 10, left: 10),) ,
                itemCount: controller.cartProduct.length),
            ),
          ],
        ),
      );

    });
  }
}
