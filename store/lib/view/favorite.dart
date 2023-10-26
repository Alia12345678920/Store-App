import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/homeScreenController.dart';

class favorite extends StatefulWidget {
  const favorite({super.key});
  @override
  State<favorite> createState() => _favoriteState();
}

class _favoriteState extends State<favorite> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<homeScreenController>(builder: (controller){
      return controller.favoriteProduct.isEmpty? Center(
          child: Text("i".tr)):
      Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context , index)=>
                      InkWell(
                        onTap: (){
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
                                          maxLines: 1,
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
                                          minWidth: 150,
                                          padding: EdgeInsets.all(10),
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)) ,
                                          color: Color(0xff49796B),
                                          onPressed: (){
                                            controller.removeFromFavorite(controller.product!.products![index],);
                                          },
                                          child: Row(children: [
                                            Text("remov from favorite   "), Icon(Icons.favorite, color: Colors.white,)
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
                  itemCount: controller.favoriteProduct.length),
            ),
          ],
        ),
      );

    });
  }
}
