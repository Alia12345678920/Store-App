import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/productsModel.dart';

class homeScreenController extends GetxController{
  @override
  void onInit() {
    getdata();
  }

  productsModel? product;
  getdata() async{
    http.Response response = await http.get(Uri.parse("https://dummyjson.com/products"));
    Map<String,dynamic> data = jsonDecode(response.body);
    product = productsModel.fromJson(data);
    // print(product!.products![10].title);
    update();
  }
  int cartCount = 0 ;
  int total = 0 ;

  List<Products>cartProduct = [];

  addToCart(Product, int price){
    cartProduct.add(Product);
    print(cartProduct.length);
    cartCount ++;
    total += price;
    update();
  }

  removeFromCart(Product, int price){
    cartProduct.remove(Product);
    cartCount --;
    total -= price;
    update();
  }

  List<Products>favoriteProduct = [];


  addToFavorite(Product){
    favoriteProduct.add(Product);
    print(cartProduct.length);
    // cartCount ++;
    // total += price;
    update();
  }
  removeFromFavorite(Product){
    favoriteProduct.remove(Product);
    // cartCount --;
    // total -= price;
    update();
  }
}