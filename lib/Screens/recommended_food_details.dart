import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants/appColors.dart';
import 'package:food_delivery_app/constants/big_Text.dart';
import 'package:food_delivery_app/helper/controller/recommended_product_controller.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/utils/expandable_Text_Widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constants/App_Icons.dart';

class RecommendedFoodDetail extends StatefulWidget {
  int indexId;
  RecommendedFoodDetail( this.indexId, {Key? key}) : super(key: key);

  @override
  State<RecommendedFoodDetail> createState() => _RecommendedFoodDetailState();
}

class _RecommendedFoodDetailState extends State<RecommendedFoodDetail> {

  @override
  Widget build(BuildContext context) {
    var product=Get.find<RecommendedProductController>().RecommendedList[widget.indexId];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar( automaticallyImplyLeading: false,
            title:  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector( onTap:(){Navigator.pop(context);},
              child: AppIcons(icon: Icons.close,size: 10,iconsize: 14,)),
          AppIcons(icon: Icons.shopping_cart_outlined,iconsize: 14,),
        ],
      ),
            bottom: PreferredSize(
              preferredSize:Size.fromHeight(30) ,
              child: Container( decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))),
                width: double.maxFinite,padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child:Center(child: BigText(text: product.name!,)),),

            ),
            pinned: true,
            flexibleSpace: Image(image: AssetImage('assets/images/food  (${widget.indexId}).jpg'),
            fit: BoxFit.cover,
              width: double.maxFinite,
            ), expandedHeight:250,
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ExpandableTextWidget(text: product.description!),
            ),

          )

        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container( padding: EdgeInsets.symmetric(horizontal: Dimensions.height100+10),
            child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              AppIcons(icon: Icons.remove,iconColor: AppColors.buttonBackgroundColor,backgroundColor: AppColors.mainColor,),
              BigText(text:'\$ 12.88 ' + 'x'+'0',),
              AppIcons(icon: Icons.add,iconColor: AppColors.buttonBackgroundColor,backgroundColor: AppColors.mainColor,),

              ],),
          ),
          SizedBox(height: Dimensions.height10,),
          Container(  padding: EdgeInsets.symmetric(horizontal: Dimensions.height45,vertical: Dimensions.height30),
            decoration: BoxDecoration(borderRadius:  BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
            color: Colors.grey.shade300,
            ),
            child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            Container( padding: EdgeInsets.all(Dimensions.height15),
              decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),color: Colors.white,
            ),
              child: Icon(Icons.favorite,color: AppColors.mainColor,),),
              Container( padding: EdgeInsets.symmetric(horizontal:Dimensions.height20,vertical: Dimensions.height15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: AppColors.mainColor,
              ),
                  child: Row(children: [
                  BigText(text: '\$'+'${product.price} ' + ' | Add to Cart',color: Colors.white,)
              ],))

          ],) ,)
        ],
      ),
    );
  }
}
