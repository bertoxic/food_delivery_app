import 'package:flutter/material.dart';
import 'package:food_delivery_app/helper/repository/cart_repo.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/models/product_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../constants/appColors.dart';

class CartController{
  CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<int,CartModel> _items={};
  Map<int , CartModel> get items=>_items;

  void addItems(ProductModel product, int quantity){
    var totalQuanity=0;
   if(_items.containsKey(product.id)){

      _items.update(product.id!, (value){
        totalQuanity=value.quantity! + quantity;
        return CartModel(
       id: value.id,
       img: value.img,
       isExist: true,
       price: value.price,
       quantity: value.quantity! + quantity,
       time: DateTime.now().toString(),

     );

      }
     );  if(totalQuanity<=0){_items.remove(product.id);}
     print('adding now '+ product.id.toString()+ product.name.toString()+'Quantity '+quantity.toString());
   }else{
     if(quantity>0){
       _items.putIfAbsent(product.id!, () {
         return CartModel(
             time: DateTime.now().toString(),
             quantity: quantity,
             price: product.price,
             isExist: true,
             id: product.id,
             img: product.img,
             name: product.name
         );});
     }else{
       Get.snackbar('Item Count', 'You should add an item',borderRadius:20,colorText:Colors.white,backgroundColor: AppColors.mainColor);
     }
   }

  }

  bool existInCart(ProductModel product){
    if(_items.containsKey(product.id)){
      return true;
    }return false;
  }
  int getQuantity(ProductModel product){
    var quantity=0;
    if(_items.containsKey(product.id)){
      _items.forEach((key, value) {
        if(key==product.id){
          print('the quantity of this item is '+value.quantity.toString());
          quantity=value.quantity!;
        }
      });
    } return quantity;
  }
int get totalItems{
    var totalQuantity=0;
    _items.forEach((key, value) {
     totalQuantity+=value.quantity!;
    });
    return totalQuantity;
}

}