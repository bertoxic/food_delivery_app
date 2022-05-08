import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/appColors.dart';
import 'package:food_delivery_app/helper/controller/CartController.dart';
import 'package:food_delivery_app/helper/repository/popular_product_repo.dart';
import 'package:food_delivery_app/models/product_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{
  PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  late  List<dynamic> _popularProductList=[];
  List <dynamic> get popularProductList{return _popularProductList;}
  bool _isLoaded=false;
  bool get isLoaded=>_isLoaded;
  int _quantity=0;
  int get quantity=>_quantity;
  int _inCartItems=0;
  int get inCartItems=> _inCartItems +_quantity;
 late CartController _cart;
  Future<void> getProductList()async {
     Response response=await popularProductRepo.getpopularProductList();
     if(response.statusCode==200){
      // print('i think of me too');
       _isLoaded=true;
       _popularProductList=[];
       _popularProductList.addAll(Products.fromJson(response.body).products);
       update();
     }else{print('problem with statuscode '+ response.body.toString());}
  }

 setQuantity(bool isIncrement){
    //isIncrement=true;
    if(isIncrement){
      _quantity=checkQuantity(_quantity+1);
    }else{
      _quantity=checkQuantity(_quantity-1);
    }
    update();
 }
 int checkQuantity(int quantity){

    if (_inCartItems+quantity<0){
      quantity=0;
      Get.snackbar('Item Count', 'You cannot select zero number of items',borderRadius:20,colorText:Colors.grey.shade200);
    }else if(_inCartItems+quantity>20){
      Get.snackbar('Item Count', 'You have selected the maximum number of items',borderRadius:20,colorText:Colors.grey.shade200);
      quantity=20;
    }
    return quantity;
 }
void initQuantity(ProductModel product ,CartController cart){
  _quantity=0;
  _inCartItems=0;
  _cart=cart;
  bool exist=false;
  exist=_cart.existInCart(product);
  print(exist.toString());
  if(exist==true){
    _inCartItems=_cart.getQuantity(product);

  }print('incart item is '+ _inCartItems.toString());


}
      int get totalItems{
          return _cart.totalItems;
      }
      void addItems(ProductModel product){
   // if(_quantity>0){
     _cart.addItems(product, _quantity);
     _quantity=0;
     _inCartItems=_cart.getQuantity(product);
     _cart.items.forEach((key, value) {print('ggggggggggg '+value.quantity.toString());});
   // }else{
   //   Get.snackbar('Item Count', 'You should add an item',borderRadius:20,colorText:Colors.white,backgroundColor: AppColors.mainColor);
   // }
        update();
}

}