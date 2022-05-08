import 'package:flutter/material.dart';
import 'package:food_delivery_app/Screens/home/main_food_page.dart';
import 'package:food_delivery_app/constants/app_Column.dart';
import 'package:food_delivery_app/helper/controller/CartController.dart';
import 'package:food_delivery_app/helper/controller/popular_product_controller.dart';
import 'package:food_delivery_app/models/product_model.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/utils/expandable_Text_Widget.dart';
import 'package:get/get.dart';

import '../../constants/App_Icons.dart';
import '../../constants/appColors.dart';
import '../../constants/big_Text.dart';
import '../../constants/small_text.dart';

class PopularFoodPage extends StatelessWidget {
  int indexId;
  PopularFoodPage({required this.indexId});
  @override
  Widget build(BuildContext context) {
    var product=Get.find<PopularProductController>().popularProductList[indexId];
    Get.find<PopularProductController>().initQuantity(product,Get.find<CartController>());
    return Scaffold(
      body: Stack(
        children: [
          Positioned(left: 0,right: 0,
              height: Dimensions.popularFoodImageHeight,
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/food  (${indexId+6}).jpg'),
                    fit: BoxFit.cover
                  )
                ),

          )),
          Positioned(  height: 120,
              left: 20, right: 20,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector( onTap:(){
                Navigator.pop(context);
                //Get.to(()=>MainFoodPage());
              },
                  child: AppIcons(icon: Icons.close,)),

              GetBuilder<PopularProductController>(
                  builder: (GetxController controller) { return  Stack(
                      children:[
                        AppIcons(icon: Icons.shopping_cart_outlined),
                        Get.find<PopularProductController>().totalItems>=1?
                        Positioned( right:0, left:9,bottom:10,
                            child: AppIcons(icon:Icons.circle,iconColor: AppColors.mainColor,)):
                        Container(),
                        Get.find<PopularProductController>().totalItems>=1?
                        Positioned( right:0, left:9,bottom:10,
                            child: BigText(text: Get.find<PopularProductController>().totalItems.toString(),size: 12,color: Colors.white,)):
                        Container(),
                      ]);},
              )
            ],
          )),
          Positioned( left: 0,right: 0, bottom: 0,top: Dimensions.popularFoodImageHeight-30,
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height20,left: Dimensions.width15,right: Dimensions.width15),
                decoration: BoxDecoration(
                  color: Colors.white ,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius20),topRight: Radius.circular(Dimensions.radius20),)
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: 'Mexican Trush',),
                    SizedBox(height: Dimensions.height20,),
                    BigText(text:  product.name,),
                    Expanded(
                      child: SingleChildScrollView( scrollDirection: Axis.vertical,
                        child: ExpandableTextWidget(text:product.description!),),
                    ),

                  ],
                ),
          ))
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>( builder: (PopularProductController popularProduct) {
        return Container( height: Dimensions.height100, padding: EdgeInsets.symmetric(horizontal: Dimensions.radius30),
        decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius30),topRight: Radius.circular(Dimensions.radius30))
        ),
        child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        GetBuilder<PopularProductController>(
        builder: (PopularProductController product) {
        return Container( padding: EdgeInsets.all(Dimensions.height15),
        decoration: BoxDecoration(color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius10)
        ),),
        child: Row(children: [GestureDetector( onTap:(){product.setQuantity(false);},
        child: Icon(Icons.remove,color: Colors.grey,)),
        BigText(text: '  ${product.inCartItems.toString()}  ',),
        GestureDetector( onTap:(){product.setQuantity(true);},
        child: Icon(Icons.add,color: Colors.grey,)),],),);}
        ),
        GestureDetector( onTap: (){
            popularProduct.addItems(product);
        },
        child: Container( padding: EdgeInsets.all(Dimensions.height15),
        decoration: BoxDecoration(color: AppColors.mainColor,
        borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius10)
        ),),
        child: Row(children: [BigText(text: '  \$8.00  ',),

        BigText(text: 'Add to Cart ',)],),),
        ),

        ],)

        );
        } ),
    );
  }
}
