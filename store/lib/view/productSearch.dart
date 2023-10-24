import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/view/searchDetails.dart';
import '../model/productsModel.dart';

class productSearch extends SearchDelegate {
  List<Products> products;
  productSearch({
    required this.products,
});
  @override
  List<Widget>? buildActions(BuildContext context) {
   return [IconButton(onPressed: (){
     query = "";
   }, icon: Icon(Icons.close))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
   return Text("data");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List <Products>filter = products.where((element) {
      return element.title!.startsWith(query);
    }).toList();
return
  ListView.separated(
  physics: BouncingScrollPhysics(),
  itemBuilder: (context , index)=>
      InkWell(
        onTap: (){
          query == ""
              ? Get.to(()=>searchDetails(product: products, index: index,))
              : Get.to(()=>searchDetails(product: filter, index: index,));
        },
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
            color: Colors.grey[200],
          ),
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Row( children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Image.network(
                    query == "" ?
                    "${products[index].thumbnail}":"${filter[index].thumbnail}",
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
                        Text(
                          query == "" ?
                          "${products[index].title}" :"${filter[index].title}",
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 25, color: Color(0xff49796B),
                            fontWeight: FontWeight.bold,
                          ),),
                        Text(
                          query == "" ?
                          "${products[index].description}" : "${filter[index].description}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Spacer(),
                        // SizedBox(height: 15,),
                        Row(children: [
                          Text(
                            query == "" ?
                            "${products[index].price}" r" $" : "${filter[index].price}" r" $",
                            style: TextStyle(
                              fontSize: 20, color: Color(0xff49796B),
                              fontWeight: FontWeight.bold,
                            ),),
                          Spacer(),
                          //   SizedBox(width: 50,),
                          Text(
                            query == "" ?
                            "${products[index].rating}" : "${filter[index].rating}" ,
                            style: TextStyle(
                              fontSize: 20, color: Color(0xff49796B),
                              fontWeight: FontWeight.bold,
                            ),)

                        ],),
                        // MaterialButton(
                        //   minWidth: 150,
                        //   padding: EdgeInsets.all(10),
                        //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)) ,
                        //   color: Colors.pinkAccent,
                        //   onPressed: (){
                        //     controller.addToCart(controller.product!.products![index],
                        //         controller.product!.products![index].price!.toInt());
                        //   },
                        //   child: Row(children: [
                        //     Text("add to cart   "), Icon(Icons.shopping_cart, color: Colors.white,)
                        //   ],) ,),

                      ],),
                  ),
                )
              ],),
            ],
          ),
        ),
      )
  ,separatorBuilder:  (context , index)=> Container(height: 1,
  color: Colors.grey,
  margin: EdgeInsets.only(right: 10, left: 10),) ,
  itemCount:
  query == "" ? 10 : filter.length,);

  }

}